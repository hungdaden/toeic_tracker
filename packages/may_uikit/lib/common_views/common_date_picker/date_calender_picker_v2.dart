// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';

/// Selection mode of [DateCalendarPickerV2].
enum DateCalendarPickerMode {
  /// Pick a single date.
  single,

  /// Pick a date range (start + end).
  range,
}

/// Result returned by [DateCalendarPickerV2] via [Navigator.pop].
///
/// - In [DateCalendarPickerMode.single] use [singleDate].
/// - In [DateCalendarPickerMode.range] use [startDate] and [endDate] (always
///   non-null when the range mode completes successfully).
class DateCalendarPickerResult {
  const DateCalendarPickerResult._({
    this.singleDate,
    this.startDate,
    this.endDate,
    required this.mode,
  });

  /// Builds a result for the single-date picker.
  const DateCalendarPickerResult.single(DateTime date)
      : this._(singleDate: date, mode: DateCalendarPickerMode.single);

  /// Builds a result for the range picker.
  const DateCalendarPickerResult.range(DateTime start, DateTime end)
      : this._(startDate: start, endDate: end, mode: DateCalendarPickerMode.range);

  final DateCalendarPickerMode mode;
  final DateTime? singleDate;
  final DateTime? startDate;
  final DateTime? endDate;
}

/// Standalone date calendar picker that matches the Figma spec.
///
/// Renders a single-month calendar inside a card with rounded corners and a
/// soft drop shadow. Supports two modes:
///   * [DateCalendarPickerMode.single] – one highlighted day, bottom value
///     shows the picked date and "1 ngày".
///   * [DateCalendarPickerMode.range] – the first tap selects the start, the
///     second tap (after the start is locked in) selects the end. Days in
///     between are tinted; the bottom value shows start, end, and the day
///     count.
///
/// Use [showDateCalendarPickerV2] for the standard round-corner bottom sheet
/// presentation, or embed the widget directly when a custom container is
/// needed.
class DateCalendarPickerV2 extends StatefulWidget {
  const DateCalendarPickerV2({
    this.mode = DateCalendarPickerMode.single,
    this.initialDate,
    this.initialStartDate,
    this.initialEndDate,
    this.minimumDate,
    this.maximumDate,
    this.dimWeekends = true,
    this.allowWeekendSelection = true,
    this.confirmLabel,
    this.cancelLabel,
    this.borderRadius = DimensV2.d28,
    this.title,
    this.onConfirm,
    this.showActionButtons = false,
    super.key,
  });

  /// Selection mode of the picker.
  final DateCalendarPickerMode mode;

  /// Initial date in [DateCalendarPickerMode.single].
  final DateTime? initialDate;

  /// Initial start date in [DateCalendarPickerMode.range].
  final DateTime? initialStartDate;

  /// Initial end date in [DateCalendarPickerMode.range]. Optional – when null
  /// only the start is initially set.
  final DateTime? initialEndDate;

  /// Earliest selectable date. Earlier days are rendered but disabled.
  final DateTime? minimumDate;

  /// Latest selectable date. Later days are rendered but disabled.
  final DateTime? maximumDate;

  /// Whether Saturday / Sunday should be visually dimmed.
  final bool dimWeekends;

  /// Whether tapping a weekend day is allowed.
  final bool allowWeekendSelection;

  /// Override the confirm button label.
  final String? confirmLabel;

  /// Override the cancel button label.
  final String? cancelLabel;

  /// Outer border radius of the picker card.
  final double borderRadius;

  /// Optional title rendered above the month row.
  final String? title;

  /// Whether to render the built-in action button row (Cancel / Confirm).
  ///
  /// Set to `false` when the host screen provides its own confirm/cancel
  /// controls (e.g. embedded inside a custom form).
  final bool showActionButtons;

  /// Called when the user confirms a selection. When null, the picker pops
  /// itself with a [DateCalendarPickerResult].
  final void Function(DateCalendarPickerResult result)? onConfirm;

  @override
  State<DateCalendarPickerV2> createState() => _DateCalendarPickerV2State();
}

class _DateCalendarPickerV2State extends State<DateCalendarPickerV2>
    with SingleTickerProviderStateMixin {
  late DateTime _visibleMonth;
  DateTime? _startDate;
  DateTime? _endDate;
  DateTime? _singleDate;

  /// Animation controller that drives the range reveal. Runs from 0 to 1
  /// each time the user picks (or resets) the start or end of a range.
  late AnimationController _rangeController;

  /// Eased wrapper around [_rangeController] for smoother reveal motion.
  late Animation<double> _rangeAnimation;

  /// Animated range bounds. These may lag behind [_startDate] / [_endDate]
  /// during the reveal: as the animation progresses, [_animatedEnd] walks
  /// from [_animatedStart] toward the actual end, painting in-range cells
  /// one by one. The animation completes (value == 1) once [_animatedEnd]
  /// reaches the real end.
  DateTime? _animatedStart;
  DateTime? _animatedEnd;

  @override
  void initState() {
    super.initState();
    final today = _stripTime(DateTime.now());
    _visibleMonth = DateTime(today.year, today.month);

    if (widget.mode == DateCalendarPickerMode.range) {
      _startDate = _stripTimeOrNull(widget.initialStartDate);
      _endDate = _stripTimeOrNull(widget.initialEndDate);
      _animatedStart = _startDate;
      _animatedEnd = _endDate;
    } else {
      _singleDate = _stripTimeOrNull(widget.initialDate) ?? today;
    }

    _rangeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _rangeAnimation = CurvedAnimation(
      parent: _rangeController,
      curve: Curves.easeInCubic,
    );
  }

  /// Disposes the [_rangeController] to release animation resources.
  @override
  void dispose() {
    _rangeController.dispose();
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // Date helpers
  // ---------------------------------------------------------------------------

  DateTime _stripTime(DateTime d) => DateTime(d.year, d.month, d.day);

  DateTime? _stripTimeOrNull(DateTime? d) {
    if (d == null) return null;
    return _stripTime(d);
  }

  /// Returns true when [a] and [b] represent the same calendar day.
  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  bool _isWeekend(DateTime date) {
    final wd = date.weekday;
    return wd == DateTime.saturday || wd == DateTime.sunday;
  }

  /// Resets and forwards the range reveal animation. The grid re-renders
  /// on every animation tick via the [AnimatedBuilder] in
  /// [_buildCalendarGrid], which walks [_animatedEnd] from
  /// [_animatedStart] toward the real end so in-range cells appear
  /// one-by-one from start to end.
  void _animateRange() {
    _rangeController
      ..reset()
      ..forward();
  }

  /// Builds the 6×7 grid for [_visibleMonth] padded with leading/trailing days
  /// from neighbouring months.
  List<DateTime> _buildGridDays() {
    final firstOfMonth = DateTime(_visibleMonth.year, _visibleMonth.month, 1);
    final leadingBlanks = firstOfMonth.weekday - 1; // 0..6 (Mon=1)
    final daysInMonth = DateTime(_visibleMonth.year, _visibleMonth.month + 1, 0).day;

    final List<DateTime> days = [];
    if (leadingBlanks > 0) {
      final prevMonth = DateTime(_visibleMonth.year, _visibleMonth.month, 0);
      for (var i = leadingBlanks; i > 0; i--) {
        days.add(DateTime(
          prevMonth.year,
          prevMonth.month,
          prevMonth.day - i + 1,
        ));
      }
    }
    for (var d = 1; d <= daysInMonth; d++) {
      days.add(DateTime(_visibleMonth.year, _visibleMonth.month, d));
    }
    while (days.length < 42) {
      days.add(days.last.add(const Duration(days: 1)));
    }
    return days;
  }

  // ---------------------------------------------------------------------------
  // State mutations
  // ---------------------------------------------------------------------------

  void _onDayTap(DateTime tapped) {
    if (!_isWithinBounds(tapped)) return;
    if (!widget.allowWeekendSelection && _isWeekend(tapped)) return;

    setState(() {
      if (widget.mode == DateCalendarPickerMode.single) {
        _singleDate = tapped;
        return;
      }

      if (_startDate == null || (_startDate != null && _endDate != null)) {
        // First tap, or a fresh restart after a previous range was complete.
        _startDate = tapped;
        _endDate = null;
        _animatedStart = tapped;
        _animatedEnd = null;
        _animateRange();
        return;
      }

      if (tapped.isBefore(_startDate!)) {
        // Picked before the current start – reset the range.
        _startDate = tapped;
        _endDate = null;
        _animatedStart = tapped;
        _animatedEnd = null;
        _animateRange();
        return;
      }

      // Completing (or re-completing) the range: pin the animated bounds
      // to the real start/end so the reveal walks from start → end.
      _endDate = tapped;
      _animatedStart = _startDate;
      _animatedEnd = _endDate;
      _animateRange();
    });
  }

  bool _isWithinBounds(DateTime day) {
    final min = widget.minimumDate;
    final max = widget.maximumDate;
    final dayOnly = _stripTime(day);
    if (min != null && dayOnly.isBefore(_stripTime(min))) return false;
    if (max != null && dayOnly.isAfter(_stripTime(max))) return false;
    return true;
  }

  void _goPrevMonth() {
    setState(() {
      _visibleMonth = DateTime(_visibleMonth.year, _visibleMonth.month - 1, 1);
    });
  }

  void _goNextMonth() {
    setState(() {
      _visibleMonth = DateTime(_visibleMonth.year, _visibleMonth.month + 1, 1);
    });
  }

  // ---------------------------------------------------------------------------
  // Pop helpers
  // ---------------------------------------------------------------------------

  void _popWithResult() {
    final navigator = Navigator.of(context);
    if (widget.mode == DateCalendarPickerMode.single) {
      final date = _singleDate;
      if (date == null) {
        navigator.pop();
        return;
      }
      final result = DateCalendarPickerResult.single(date);
      if (widget.onConfirm != null) {
        widget.onConfirm!(result);
        return;
      }
      navigator.pop(result);
    } else {
      final start = _startDate;
      if (start == null) {
        navigator.pop();
        return;
      }
      final end = _endDate ?? start;
      final result = DateCalendarPickerResult.range(start, end);
      if (widget.onConfirm != null) {
        widget.onConfirm!(result);
        return;
      }
      navigator.pop(result);
    }
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return CardV2(
      borderRadius: DimensV2.d28,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (widget.title != null) ...[
                Text(
                  widget.title!,
                  style: AppTextStylesV2.title15SemiBold.copyWith(
                    color: AppColorsV2.neutral900,
                  ),
                ),
                const SizedBox(height: DimensV2.d12),
              ],
              _buildMonthHeader(),
              const SizedBox(height: DimensV2.d4),
              _buildWeekdayHeader(),
              const SizedBox(height: DimensV2.d4),
              _buildCalendarGrid(),
              SizedBox(height: DimensV2.d14),
            ],
          ),
          const CommonDividerV2(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: DimensV2.d12,
            ).copyWith(top: DimensV2.d8),
            child: _buildValueSection(),
          ),
          if (widget.showActionButtons)
            Padding(
              padding: const EdgeInsets.only(
                top: DimensV2.d8,
              ),
              child: _buildActionButtons(),
            ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Header
  // ---------------------------------------------------------------------------

  Widget _buildMonthHeader() {
    return Row(
      children: [
        _ArrowButton(
          icon: Icons.chevron_left,
          color: AppColorsV2.greenTheme700,
          background: AppColorsV2.greenTheme100,
          onTap: _goPrevMonth,
        ),
        Expanded(
          child: Text(
            _formatMonthYear(_visibleMonth),
            textAlign: TextAlign.center,
            style: AppTextStylesV2.text16Medium.copyWith(
              color: AppColorsV2.neutral900,
            ),
          ),
        ),
        _ArrowButton(
          icon: Icons.chevron_right,
          color: AppColorsV2.greenTheme700,
          background: AppColorsV2.greenTheme100,
          onTap: _goNextMonth,
        ),
      ],
    );
  }

  Widget _buildWeekdayHeader() {
    const labels = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];
    return Row(
      children: labels
          .map(
            (l) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: DimensV2.d10),
                child: Text(
                  l,
                  textAlign: TextAlign.center,
                  style: AppTextStylesV2.labelMedium.copyWith(
                    color: AppColorsV2.neutral500,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  // ---------------------------------------------------------------------------
  // Grid
  // ---------------------------------------------------------------------------

  Widget _buildCalendarGrid() {
    return AnimatedBuilder(
      animation: _rangeAnimation,
      builder: (_, __) {
        final days = _buildGridDays();
        return Column(
          children: List.generate(6, (rowIndex) {
            return Row(
              children: List.generate(7, (colIndex) {
                final index = rowIndex * 7 + colIndex;
                final day = days[index];
                return Expanded(child: _buildDayCell(day));
              }),
            );
          }),
        );
      },
    );
  }

  Widget _buildDayCell(DateTime day) {
    final isCurrentMonth = day.month == _visibleMonth.month;
    final isWeekend = _isWeekend(day);
    final inBounds = _isWithinBounds(day);

    final bool isSelected;
    final bool isInRange;
    final bool isRangeStart;
    final bool isRangeEnd;
    final bool isStartEqualsEnd;

    if (widget.mode == DateCalendarPickerMode.single) {
      isSelected = _singleDate != null && _isSameDay(_singleDate!, day);
      isInRange = false;
      isRangeStart = isSelected;
      isRangeEnd = isSelected;
      isStartEqualsEnd = false;
    } else {
      // Selection state (start/end) always tracks the user's actual
      // picks so the cell's anchor state doesn't lag during the reveal.
      final start = _startDate;
      final end = _endDate;
      isRangeStart = start != null && _isSameDay(start, day);
      isRangeEnd = end != null && _isSameDay(end, day);
      isStartEqualsEnd = isRangeStart && isRangeEnd;
      isSelected = isRangeStart || isRangeEnd;

      // In-range fill is driven by the animated bounds, which walk from
      // [animatedStart] toward [animatedEnd] as the controller advances.
      // When the controller is at 0, animatedEnd == animatedStart and no
      // cell is in range; when it reaches 1, animatedEnd == end and the
      // full range is filled.
      //
      // Short-circuit: when [dimWeekends] is on, weekend days can never
      // be in range, so we skip the date math entirely and just leave
      // [isInRange] false.
      final aStart = _animatedStart;
      final aEnd = _animatedEnd;
      if (aStart != null && aEnd != null && (!widget.dimWeekends || !isWeekend)) {
        final total = aEnd.difference(aStart).inDays;
        final current = (total * _rangeAnimation.value).round();
        final animatedEnd = aStart.add(Duration(days: current));
        isInRange = day.isAfter(aStart) && day.isBefore(animatedEnd);
      } else {
        isInRange = false;
      }
    }

    final canTap = isCurrentMonth &&
        inBounds &&
        (!isWeekend || (!widget.dimWeekends && widget.allowWeekendSelection));

    final Color background;
    final Color textColor;

    if (!isCurrentMonth) {
      background = AppColorsV2.transparent;
      textColor = AppColorsV2.neutral300;
    } else if (isSelected) {
      background = AppColorsV2.greenTheme500;
      textColor = AppColorsV2.genericWhite;
    } else if (isInRange) {
      background = AppColorsV2.greenTheme100;
      textColor = AppColorsV2.neutral900;
    } else if (widget.dimWeekends && isWeekend) {
      background = AppColorsV2.transparent;
      textColor = AppColorsV2.neutral300;
    } else {
      background = AppColorsV2.transparent;
      textColor = AppColorsV2.neutral900;
    }

    final borderRadius = _resolveBorderRadius(
      isSelected: isSelected,
      isInRange: isInRange,
      isRangeStart: isRangeStart,
      isRangeEnd: isRangeEnd,
      isStartEqualsEnd: isStartEqualsEnd,
    );

    return GestureContainerV2(
      behavior: HitTestBehavior.opaque,
      onTap: canTap ? () => _onDayTap(day) : null,
      child: SizedBox(
        height: DimensV2.d36,
        child: Container(
          decoration: BoxDecoration(
            color: background,
            borderRadius: borderRadius,
          ),
          alignment: Alignment.center,
          child: Text(
            '${day.day}',
            style: AppTextStylesV2.text14Medium.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }

  BorderRadiusGeometry? _resolveBorderRadius({
    required bool isSelected,
    required bool isInRange,
    required bool isRangeStart,
    required bool isRangeEnd,
    required bool isStartEqualsEnd,
  }) {
    if (isSelected) {
      if (isStartEqualsEnd || widget.mode == DateCalendarPickerMode.single) {
        return BorderRadius.circular(DimensV2.d8);
      }
      return BorderRadiusDirectional.only(
        topStart: isRangeStart ? const Radius.circular(DimensV2.d8) : Radius.zero,
        bottomStart: isRangeStart ? const Radius.circular(DimensV2.d8) : Radius.zero,
        topEnd: isRangeEnd ? const Radius.circular(DimensV2.d8) : Radius.zero,
        bottomEnd: isRangeEnd ? const Radius.circular(DimensV2.d8) : Radius.zero,
      );
    }
    if (isInRange) {
      return BorderRadius.zero;
    }
    return null;
  }

  // ---------------------------------------------------------------------------
  // Value section
  // ---------------------------------------------------------------------------

  Widget _buildValueSection() {
    if (widget.mode == DateCalendarPickerMode.single) {
      return _buildSingleValueRow();
    }
    return _buildRangeValueRows();
  }

  Widget _buildSingleValueRow() {
    final valueText = _singleDate == null ? '--' : _formatDateWithWeekday(_singleDate!);
    final count = _singleDate == null ? '--' : '1 ngày';
    return Row(
      children: [
        Expanded(child: _valueItem('Ngày nghỉ', valueText)),
        const SizedBox(width: DimensV2.d12),
        Expanded(child: _valueItem('Số ngày nghỉ', count)),
      ],
    );
  }

  Widget _buildRangeValueRows() {
    final startText = _startDate == null ? '--' : _formatDateWithWeekday(_startDate!);
    final endText = _endDate == null ? '--' : _formatDateWithWeekday(_endDate!);
    final daysText =
        _startDate == null ? '--' : _formatDaysCount(_startDate!, _endDate ?? _startDate!);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(child: _valueItem('Ngày bắt đầu', startText)),
            const SizedBox(width: DimensV2.d12),
            Expanded(child: _valueItem('Ngày kết thúc', endText)),
          ],
        ),
        const SizedBox(height: DimensV2.d12),
        _valueItem('Số ngày nghỉ', daysText),
      ],
    );
  }

  Widget _valueItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: AppTextStylesV2.text13Medium.copyWith(
            color: AppColorsV2.neutral700,
          ),
        ),
        const SizedBox(height: DimensV2.d8),
        Text(
          value,
          style: AppTextStylesV2.text14Semibold.copyWith(
            color: AppColorsV2.neutral900,
          ),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // Action buttons
  // ---------------------------------------------------------------------------

  Widget _buildActionButtons() {
    final hasSelection =
        widget.mode == DateCalendarPickerMode.single ? _singleDate != null : _startDate != null;
    return Row(
      children: [
        Expanded(
          child: CommonButtonV2(
            label: widget.cancelLabel ?? 'Huỷ',
            variant: CommonButtonVariant.secondary,
            onTap: () => Navigator.of(context).pop(),
          ),
        ),
        const SizedBox(width: DimensV2.d12),
        Expanded(
          child: CommonButtonV2(
            label: widget.confirmLabel ?? 'Xác nhận',
            variant: CommonButtonVariant.primary,
            isEnabled: hasSelection,
            onTap: hasSelection ? _popWithResult : null,
          ),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // Formatting
  // ---------------------------------------------------------------------------

  static const _monthNames = [
    'Tháng 1',
    'Tháng 2',
    'Tháng 3',
    'Tháng 4',
    'Tháng 5',
    'Tháng 6',
    'Tháng 7',
    'Tháng 8',
    'Tháng 9',
    'Tháng 10',
    'Tháng 11',
    'Tháng 12',
  ];

  static const _weekdayShort = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];

  String _formatMonthYear(DateTime d) => '${_monthNames[d.month - 1]} ${d.year}';

  String _formatDateWithWeekday(DateTime d) {
    final wd = _weekdayShort[d.weekday - 1];
    final dd = d.day.toString().padLeft(2, '0');
    final mm = d.month.toString().padLeft(2, '0');
    return '$wd, $dd/$mm/${d.year}';
  }

  String _formatDaysCount(DateTime start, DateTime end) {
    // When weekends are dimmed they are considered non-working days, so the
    // count reflects "ngày nghỉ có lương" / working-day count (matches the
    // Figma spec where T4 08/08 → T6 17/08 is reported as 8 ngày instead of
    // the raw 10 inclusive days). When weekends are NOT dimmed the count is
    // the inclusive day count.
    if (widget.dimWeekends) {
      var count = 0;
      for (var d = start; !d.isAfter(end); d = d.add(const Duration(days: 1))) {
        if (!_isWeekend(d)) count += 1;
      }
      return '$count ngày';
    }
    final diff = end.difference(start).inDays;
    final days = diff + 1; // inclusive
    return '$days ngày';
  }
}

/// Small circular icon button used in the calendar month header.
class _ArrowButton extends StatelessWidget {
  const _ArrowButton({
    required this.icon,
    required this.color,
    required this.background,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final Color background;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      radius: DimensV2.d24,
      child: Container(
        width: DimensV2.d28,
        height: DimensV2.d28,
        decoration: BoxDecoration(
          color: background,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Icon(icon, size: DimensV2.d20, color: color),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Public helper
// -----------------------------------------------------------------------------

/// Shows the [DateCalendarPickerV2] inside a round-corner bottom sheet.
///
/// Returns a [DateCalendarPickerResult] when the user confirms, or `null` if
/// the sheet is dismissed.
Future<DateCalendarPickerResult?> showDateCalendarPickerV2({
  required BuildContext context,
  DateCalendarPickerMode mode = DateCalendarPickerMode.single,
  DateTime? initialDate,
  DateTime? initialStartDate,
  DateTime? initialEndDate,
  DateTime? minimumDate,
  DateTime? maximumDate,
  bool dimWeekends = true,
  bool allowWeekendSelection = true,
  String? confirmLabel,
  String? cancelLabel,
  String? title,
  bool isScrollControlled = true,
  EdgeInsets sheetPadding = const EdgeInsets.all(DimensV2.d16),
  EdgeInsets sheetMargin = const EdgeInsets.all(DimensV2.d16),
  double sheetBorderRadius = DimensV2.d28,
}) {
  return showModalBottomSheet<DateCalendarPickerResult>(
    context: context,
    isScrollControlled: isScrollControlled,
    backgroundColor: AppColorsV2.transparent,
    barrierColor: AppColorsV2.genericBlack.withValues(alpha: 0.45),
    builder: (sheetContext) {
      return Padding(
        padding: sheetMargin,
        child: Container(
          padding: sheetPadding,
          child: DateCalendarPickerV2(
            mode: mode,
            initialDate: initialDate,
            initialStartDate: initialStartDate,
            initialEndDate: initialEndDate,
            minimumDate: minimumDate,
            maximumDate: maximumDate,
            dimWeekends: dimWeekends,
            allowWeekendSelection: allowWeekendSelection,
            confirmLabel: confirmLabel,
            cancelLabel: cancelLabel,
            title: title,
            borderRadius: sheetBorderRadius,
          ),
        ),
      );
    },
  );
}
