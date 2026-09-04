import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../may_uikit.dart';
import '../../resources/generated/assets.gen.dart';

/// Parses `dd/MM/yyyy` or `dd-MM-yyyy` to a [DateTime]. Returns null on
/// invalid input so callers can treat it as "no date" without crashing.
DateTime? parseDate(String? dateStr) {
  if (dateStr == null || dateStr.isEmpty) {
    return null;
  }
  List<String> parts;
  if (dateStr.contains('/')) {
    parts = dateStr.split('/');
  } else if (dateStr.contains('-')) {
    parts = dateStr.split('-');
  } else {
    return null;
  }
  if (parts.length != 3) {
    return null;
  }
  final day = int.tryParse(parts[0]);
  final month = int.tryParse(parts[1]);
  final year = int.tryParse(parts[2]);
  if (day == null || month == null || year == null) {
    return null;
  }
  return DateTime(year, month, day);
}

String formatDateToDdMMyyyy(DateTime d) {
  return DateFormat('dd/MM/yyyy').format(d);
}

enum CalendarTypeQuick {
  dayOfWeek,
  none;

  static CalendarTypeQuick fromString(String? status) {
    switch (status) {
      case 'DAY_OF_WEEK':
        return CalendarTypeQuick.dayOfWeek;
      default:
        return CalendarTypeQuick.none;
    }
  }
}

/// Selection mode for [QuickCalendarPicker].
enum QuickPickerMode {
  /// User picks exactly one day. Value section shows `Ngày nghỉ` + `Số ngày nghỉ`.
  single,

  /// User picks a start and end day. Default; matches existing call sites.
  range,
}

/// Round arrow button used in the month header.
class _ArrowButton extends StatelessWidget {
  const _ArrowButton({
    required this.icon,
    required this.onTap,
  });

  final SvgGenImage icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      radius: DimensV2.d24,
      child: Container(
        width: DimensV2.d28,
        height: DimensV2.d28,
        decoration: BoxDecoration(
          color: context.mayColors.bgIcon,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: icon.svg(
          width: DimensV2.d10,
          height: DimensV2.d10,
          colorFilter: ColorFilter.mode(
            context.mayColors.icColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}

/// Day-type indicator rendered above the day number.
enum _DayTypeVariant {
  /// Active full day, not selected.
  fullDay,

  /// Selected full day.
  fullDaySelected,

  /// Inactive / past / full-day leave.
  offDay,

  /// Active half day, not selected.
  halfDay,

  /// Selected  /// Range start selecting a half day.
  halfDaySelectedStart,

  /// Range end selecting a half day.
  halfDaySelectedEnd,

  /// DA_SU_DUNG
  daSuDung,

  /// NGHI_KHONG_PHEP
  nghiKhongPhep,

  /// NGHI_CO_PHEP
  nghiCoPhep,

  /// CHUA_SU_DUNG
  chuaSuDung,

  /// Weekend indicator
  weekend,
}

/// 16×16 (or smaller, for the legend) visual indicator above each day number.
class _DayTypeIndicator extends StatelessWidget {
  const _DayTypeIndicator({
    required this.variant,
    this.size = DimensV2.d16,
  });

  final _DayTypeVariant variant;
  final double size;

  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    switch (variant) {
      case _DayTypeVariant.daSuDung:
        return _solidCircle(AppColorsV2.greenTheme500);
      case _DayTypeVariant.nghiKhongPhep:
        return _solidCircle(AppColorsV2.semanticCritical500);
      case _DayTypeVariant.nghiCoPhep:
        return _solidCircle(AppColorsV2.neutral300);
      case _DayTypeVariant.chuaSuDung:
        return _solidCircle(AppColorsV2.genericWhite, borderColor: colors.bdDefault);
      case _DayTypeVariant.weekend:
        return _solidCircle(AppColorsV2.neutral100);
      case _DayTypeVariant.fullDay:
        return _solidCircle(colors.indicatorFullDay);
      case _DayTypeVariant.fullDaySelected:
        return _solidCircle(colors.indicatorFullDaySelected);
      case _DayTypeVariant.offDay:
        return _solidCircle(colors.indicatorOffDay);
      case _DayTypeVariant.halfDay:
        return _splitCircle(
          left: colors.indicatorHalfDayLeft,
          right: colors.indicatorHalfDayRight,
        );
      case _DayTypeVariant.halfDaySelectedStart:
        return _splitCircle(
          left: colors.indicatorHalfDaySelectedLeft,
          right: colors.indicatorHalfDaySelectedRight,
        );
      case _DayTypeVariant.halfDaySelectedEnd:
        return _splitCircle(
          left: colors.indicatorHalfDaySelectedRight,
          right: colors.indicatorHalfDaySelectedLeft,
        );
    }
  }

  Widget _solidCircle(Color color, {Color? borderColor}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: borderColor ?? AppColorsV2.transparent),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _splitCircle({required Color left, required Color right}) {
    return ClipOval(
      child: SizedBox(
        width: size,
        height: size,
        child: Row(
          children: [
            Expanded(child: Container(color: left)),
            Expanded(child: Container(color: right)),
          ],
        ),
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  const _LegendItem({this.variant = _DayTypeVariant.fullDay, required this.label});

  final _DayTypeVariant variant;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _DayTypeIndicator(variant: variant, size: DimensV2.d16),
        const SizedBox(width: DimensV2.d8),
        Expanded(
          child: Text(
            label,
            style: AppTextStylesV2.text12Medium.copyWith(color: AppColorsV2.primaryTextColor),
          ),
        ),
      ],
    );
  }
}

/// Legend explaining the 3 day-type indicators shown on each cell.
class _PickerLegend extends StatelessWidget {
  const _PickerLegend({this.customLegends});
  final List<QuickCalendarLegend>? customLegends;

  @override
  Widget build(BuildContext context) {
    if (customLegends != null && customLegends!.isNotEmpty) {
      final rows = <Widget>[];
      for (int i = 0; i < customLegends!.length; i += 2) {
        final leftLegend = customLegends![i];
        final rightLegend = (i + 1 < customLegends!.length) ? customLegends![i + 1] : null;

        _DayTypeVariant getVariantFromLegend(QuickCalendarLegend legend) {
          final statusStr = legend.status?.toLowerCase();
          if (statusStr == 'da_su_dung') return _DayTypeVariant.daSuDung;
          if (statusStr == 'nghi_khong_phep') return _DayTypeVariant.nghiKhongPhep;
          if (statusStr == 'nghi_co_phep') return _DayTypeVariant.nghiCoPhep;
          if (statusStr == 'chua_su_dung') return _DayTypeVariant.chuaSuDung;

          final color = legend.resolvedColor;
          if (color == AppColorsV2.greenTheme500) return _DayTypeVariant.daSuDung;
          if (color == AppColorsV2.semanticCritical500) return _DayTypeVariant.nghiKhongPhep;
          if (color == AppColorsV2.neutral300) return _DayTypeVariant.nghiCoPhep;
          if (color == AppColorsV2.genericWhite) return _DayTypeVariant.chuaSuDung;
          return _DayTypeVariant.fullDay;
        }

        /// Builds a widget for the given [legend].
        Widget buildLegendItem(QuickCalendarLegend legend) {
          return _LegendItem(
            variant: getVariantFromLegend(legend),
            label: legend.title,
          );
        }

        rows.add(
          Row(
            children: [
              Expanded(child: buildLegendItem(leftLegend)),
              const SizedBox(width: DimensV2.d16),
              Expanded(
                  child:
                      rightLegend != null ? buildLegendItem(rightLegend) : const SizedBox.shrink()),
            ],
          ),
        );
        if (i + 2 < customLegends!.length) {
          rows.add(const SizedBox(height: DimensV2.d8));
        }
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: rows,
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: const [
            Expanded(
              child: _LegendItem(
                variant: _DayTypeVariant.fullDay,
                label: 'Học cả ngày',
              ),
            ),
            SizedBox(width: DimensV2.d16),
            Expanded(
              child: _LegendItem(
                variant: _DayTypeVariant.halfDay,
                label: 'Học nửa ngày',
              ),
            ),
          ],
        ),
        const SizedBox(height: DimensV2.d8),
        const _LegendItem(
          variant: _DayTypeVariant.offDay,
          label: 'Nghỉ học',
        ),
      ],
    );
  }
}

/// Day-cell-based date picker supporting single-day and range selection.
class QuickCalendarPicker<T, E> extends StatefulWidget {
  const QuickCalendarPicker({
    required this.months,
    this.mode = QuickPickerMode.range,
    this.initStartDate,
    this.initEndDate,
    this.initialDate,
    this.isSelectingEndDate = false,
    this.onCheckDuplicate,
    this.onCloseBottomSheet,
    this.isHalfDay = false,
    this.selectedShiftName,
    this.topWidget,
    this.bottomWidget,
    this.customBottomButton,
    this.isEnableConfirmButton = true,
    this.borderRadius = DimensV2.d28,
    this.margin,
    this.padding = const EdgeInsets.symmetric(horizontal: AppSpacingV2.md),
    this.onTapButton,
    this.onTapSingleButton,
    this.onConfirmRange,
    this.onConfirmSingle,
    this.customSelectingStarDateButtonName,
    this.customSelectingEndDateButtonName,
    this.submitText,
    this.timeSwipePage = 500,
    this.isLoading = false,
    this.isInBottomSheet = false,
    this.isShowValueSection = false,
    this.allowPastDates = false,
    this.autoSelectToday = true,
    this.customLegends,
    super.key,
    this.isInBottomSheetNoShadow = false,
  });

  final bool allowPastDates;
  final bool autoSelectToday;
  final List<QuickCalendarLegend>? customLegends;

  final String? initStartDate;
  final String? initEndDate;

  /// Initial single-day selection in `single` mode (dd/MM/yyyy). Ignored
  /// in range mode.
  final String? initialDate;

  /// `true` while the user is picking the range end date.
  final bool isSelectingEndDate;
  final List<T> months;

  /// Defaults to [QuickPickerMode.range] to preserve the existing
  /// range-mode contract.
  final QuickPickerMode mode;

  final Function(String)? onCheckDuplicate;
  final VoidCallback? onCloseBottomSheet;
  final bool isHalfDay;
  final String? selectedShiftName;
  final Widget? topWidget;
  final Widget? bottomWidget;
  final Widget? customBottomButton;
  final bool isEnableConfirmButton;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final Function(String?, String?, String?, String?)? onTapButton;

  /// Fires when the user confirms a single-date selection (single mode only).
  ///
  /// `date` is the display string (dd/MM/yyyy); `dateToCallApi` is the
  /// wire-format value resolved by the picker — empty when the backend
  /// did not supply one.
  final void Function(String date, String dateToCallApi)? onTapSingleButton;

  /// Fires when the user confirms a range selection (range mode only).
  final Function(String?, String?, String?, String?)? onConfirmRange;

  /// Fires when the user confirms a single selection in confirmation mode.
  final void Function(String date, String dateToCallApi)? onConfirmSingle;

  final String? customSelectingStarDateButtonName;
  final String? customSelectingEndDateButtonName;
  final int timeSwipePage;
  final bool isLoading;
  final String? submitText;
  final bool isInBottomSheet;
  final bool isShowValueSection;
  final bool isInBottomSheetNoShadow;

  @override
  State<QuickCalendarPicker<T, E>> createState() => _QuickCalendarPickerState<T, E>();
}

class _QuickCalendarPickerState<T, E> extends State<QuickCalendarPicker<T, E>>
    with SingleTickerProviderStateMixin {
  int currentMonthIndex = 0;
  String? selectedStartDate;
  String? selectedEndDate;

  /// Single-day selection (single mode only). Kept separate from the range
  /// fields so range-mode tap/animation logic stays untouched.
  String? _selectedDate;

  String? selectedDayOfWeek;
  late final PageController _pageController;
  final DateTime today = DateTime.now();
  final DateTime minDateLimit = DateTime(2023, 1, 1);
  bool _isConfirming = false;

  @override
  void initState() {
    super.initState();

    final DateTime todayTrunc = DateTime(today.year, today.month, today.day);

    if (widget.mode == QuickPickerMode.single) {
      _selectedDate = widget.initialDate;
      if (_selectedDate != null) {
        final DateTime? parsed = parseDate(_selectedDate);
        if (parsed == null || parsed.isAfter(todayTrunc) || parsed.isBefore(minDateLimit)) {
          _selectedDate = widget.autoSelectToday ? formatDateToDdMMyyyy(todayTrunc) : null;
        }
      } else if (widget.autoSelectToday) {
        _selectedDate = formatDateToDdMMyyyy(todayTrunc);
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted &&
            widget.autoSelectToday &&
            widget.initialDate == null &&
            _selectedDate != null) {
          final cell = _findCellByDate(_selectedDate!);
          final dateToCallApi = (cell?.dateToCallApi as String?) ?? '';
          widget.onTapSingleButton?.call(_selectedDate!, dateToCallApi);
        }
      });
    } else {
      if (widget.initStartDate != null && widget.initEndDate != null) {
        final DateTime? parsedStart = parseDate(widget.initStartDate);
        final DateTime? parsedEnd = parseDate(widget.initEndDate);

        if (parsedStart != null && parsedEnd != null) {
          final DateTime finalStart =
              parsedStart.isBefore(minDateLimit) ? minDateLimit : parsedStart;
          selectedStartDate = formatDateToDdMMyyyy(finalStart);
          selectedEndDate = formatDateToDdMMyyyy(parsedEnd);
        }
      }
    }

    int initIndex = 0;
    String? initialDateForPager;
    if (widget.mode == QuickPickerMode.single) {
      initialDateForPager = _selectedDate;
    } else if (selectedEndDate != null) {
      initialDateForPager = selectedEndDate;
    } else {
      initialDateForPager = formatDateToDdMMyyyy(todayTrunc);
    }
    if (initialDateForPager != null && widget.months.isNotEmpty) {
      final DateTime end = parseDate(initialDateForPager)!;
      initIndex = widget.months.indexWhere((monthModel) {
        final String? header = (monthModel as dynamic).month as String?;
        if (header == null) return false;
        final parts = header.split(' ');
        if (parts.length >= 3) {
          final monthNum = int.tryParse(parts[1]);
          final yearNum = int.tryParse(parts[2]);
          if (monthNum != null && yearNum != null) {
            return monthNum == end.month && yearNum == end.year;
          }
        }
        return false;
      });
      if (initIndex < 0) initIndex = 0;
      if (initIndex >= widget.months.length) initIndex = widget.months.length - 1;
    }

    currentMonthIndex = initIndex;
    _pageController = PageController(initialPage: initIndex);
  }

  @override
  void didUpdateWidget(covariant QuickCalendarPicker<T, E> oldWidget) {
    if (!oldWidget.isHalfDay && widget.isHalfDay) {
      selectedStartDate = null;
      selectedEndDate = null;
    }
    if (oldWidget.mode != widget.mode) {
      setState(() {
        selectedStartDate = null;
        selectedEndDate = null;
        _selectedDate = null;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  void _previousMonth() {
    if (currentMonthIndex > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: widget.timeSwipePage),
        curve: Curves.easeInOut,
      );
    }
  }

  void _nextMonth() {
    if (currentMonthIndex < widget.months.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: widget.timeSwipePage),
        curve: Curves.easeInOut,
      );
    }
  }

  void onDateTap(String date, String? dayOfWeek) {
    final DateTime? tapped = parseDate(date);
    if (tapped == null) return;

    final DateTime tappedTrunc = DateTime(tapped.year, tapped.month, tapped.day);

    setState(() {
      selectedDayOfWeek = dayOfWeek;

      if (widget.mode == QuickPickerMode.single) {
        _selectedDate = (_selectedDate == date) ? null : date;
        return;
      }

      bool isTappedStart = selectedStartDate != null && date == selectedStartDate;
      bool isTappedEnd = selectedEndDate != null && date == selectedEndDate;

      if (isTappedStart && isTappedEnd) {
        selectedStartDate = null;
        selectedEndDate = null;
        return;
      }
      bool isRangeComplete = selectedStartDate != null &&
          selectedEndDate != null &&
          selectedStartDate != selectedEndDate;

      if (isRangeComplete) {
        selectedStartDate = date;
        selectedEndDate = date;
        return;
      }

      if (selectedStartDate == null ||
          selectedEndDate == null ||
          selectedStartDate == selectedEndDate) {
        if (selectedStartDate == null) {
          selectedStartDate = date;
          selectedEndDate = date;
          return;
        }

        final DateTime start = parseDate(selectedStartDate!)!;

        if (tappedTrunc.isBefore(start)) {
          selectedEndDate = selectedStartDate;
          selectedStartDate = date;
        } else {
          selectedEndDate = date;
        }
        return;
      }
    });

    if (widget.onCheckDuplicate != null) {
      final DateTime tappedDate = parseDate(date)!;

      final formatted = DateFormat('dd-MM-yyyy').format(tappedDate);

      widget.onCheckDuplicate!.call(formatted);
    }

    if (widget.mode == QuickPickerMode.single) {
      final date = _selectedDate ?? '';
      final cell = _findCellByDate(date);
      final dateToCallApi = (cell?.dateToCallApi as String?) ?? '';
      widget.onTapSingleButton?.call(date, dateToCallApi);
    } else {
      final startCell = _findCellByDate(selectedStartDate ?? '');
      final endCell = _findCellByDate(selectedEndDate ?? '');
      widget.onTapButton?.call(
        selectedStartDate,
        selectedEndDate,
        (startCell?.dateToCallApi as String?) ?? '',
        (endCell?.dateToCallApi as String?) ?? '',
      );
    }
  }

  DateTime? _parseDdMmYyyy(String? raw) => parseDate(raw);

  /// True when [dateStr] is strictly between [start] and [end] on the
  /// calendar timeline. Drives the in-range tint.
  bool _isStrictlyBetween(String dateStr, String start, String end) {
    final d = _parseDdMmYyyy(dateStr);
    final s = _parseDdMmYyyy(start);
    final e = _parseDdMmYyyy(end);
    if (d == null || s == null || e == null) return false;
    return d.isAfter(s) && d.isBefore(e);
  }

  /// Sums the active cell contributions between [startDate] and [endDate]
  /// (dd/MM/yyyy): 1 for full day, 0.5 for half day, 0 for dimmed/full-day
  /// leave.
  double _countLeaveDays(String startDate, String endDate) {
    final s = _parseDdMmYyyy(startDate);
    final e = _parseDdMmYyyy(endDate);
    if (s == null || e == null) return 0;
    if (s.isAfter(e)) return 0;
    double total = 0;
    for (final month in widget.months) {
      final List<dynamic> cells = (month as dynamic).dayOfMonth as List<dynamic>;
      for (final cell in cells) {
        final String cellDate = (cell.date ?? '') as String;
        if (cellDate.isEmpty) continue;
        final DateTime? d = parseDate(cellDate);
        if (d == null) continue;
        if (d.isBefore(s) || d.isAfter(e)) continue;

        final bool isActive = cell.active == true;
        final bool isFullDay = cell.isFullDay == true;
        if (!isActive || isFullDay) continue;

        final bool isHalfDay = cell.isHalfDay == true;
        total += isHalfDay ? 0.5 : 1;
      }
    }
    return total;
  }

  /// Finds the [DayModel] matching [dateStr] across all months.
  dynamic _findCellByDate(String dateStr) {
    if (dateStr.isEmpty) return null;
    for (final month in widget.months) {
      final data = (month as dynamic).dayOfMonth as List<dynamic>;
      for (final cell in data) {
        if ((cell.date ?? '') as String == dateStr) return cell;
      }
    }
    return null;
  }

  /// Renders one month as an N-row × 7-column grid. Row count is the
  /// minimum needed to hold the month's days (5 for some months, 6 for
  /// others) so no empty white band appears at the bottom.
  Widget buildCalendarGrid(int monthIndex) {
    final List<dynamic> data = (widget.months[monthIndex] as dynamic).dayOfMonth as List<dynamic>;
    final originalDayCells = data.skip(7).toList();

    int paddingCount = 0;
    if (originalDayCells.isNotEmpty) {
      final firstDayDateStr = (originalDayCells.first.date ?? '') as String;
      final firstDayDate = parseDate(firstDayDateStr);
      if (firstDayDate != null) {
        paddingCount = firstDayDate.weekday - 1;
      }
    }

    final dayCells = [
      ...List.generate(paddingCount, (_) => null),
      ...originalDayCells,
    ];

    final int numRows = (dayCells.length / 7).ceil();

    return Column(
      children: List.generate(numRows, (rowIndex) {
        return Row(
          children: List.generate(7, (colIndex) {
            final index = rowIndex * 7 + colIndex;
            final cell = index < dayCells.length ? dayCells[index] : null;
            return Expanded(
              child: cell == null
                  ? widget.isInBottomSheet
                      ? const SizedBox(height: DimensV2.d36)
                      : const SizedBox(height: DimensV2.d56)
                  : _buildDayCell(context, cell, monthIndex: monthIndex, rowIndex: rowIndex),
            );
          }),
        );
      }),
    );
  }

  Widget _buildDayCell(
    BuildContext context,
    dynamic cell, {
    required int monthIndex,
    required int rowIndex,
  }) {
    final colors = context.mayColors;
    final String dateStr = (cell.date ?? '') as String;
    final bool isDayOfWeek =
        CalendarTypeQuick.fromString(cell.type as String?) == CalendarTypeQuick.dayOfWeek;
    final bool isActive = cell.active == true;
    final String content = (cell.content ?? '') as String;
    final String dayOfWeek = (cell.dayOfWeek ?? '') as String;

    final bool isEmptyCell = dateStr.isEmpty && !isDayOfWeek;
    final bool isEmptyContent = content.isEmpty && !isDayOfWeek;

    if (isEmptyCell || isEmptyContent) {
      return widget.isInBottomSheet
          ? const SizedBox(height: DimensV2.d36)
          : const SizedBox(height: DimensV2.d56);
    }

    final bool isHalfDay = cell.isHalfDay == true;
    final bool isFullDay = cell.isFullDay == true;
    final bool isPastFromModel = widget.allowPastDates ? false : (cell.isPast == true);

    bool disabled = false;
    if (dateStr.isNotEmpty) {
      final DateTime? cur = parseDate(dateStr);
      if (cur != null) {
        final DateTime curTrunc = DateTime(cur.year, cur.month, cur.day);
        if (curTrunc.isBefore(minDateLimit)) {
          disabled = true;
        }
      }
    }
    if (!isDayOfWeek && !isActive) {
      disabled = true;
    }
    final bool isDimmed = disabled || isPastFromModel || isFullDay || cell.isWeekend;

    bool isRangeStart = false;
    bool isRangeEnd = false;
    bool isStartEqualsEnd = false;
    bool isInRange = false;

    if (dateStr.isNotEmpty) {
      if (widget.mode == QuickPickerMode.single) {
        final isSel = _selectedDate != null && dateStr == _selectedDate;
        isRangeStart = isSel;
        isRangeEnd = isSel;
        isStartEqualsEnd = isSel;
      } else {
        isRangeStart = selectedStartDate != null && dateStr == selectedStartDate;
        isRangeEnd = selectedEndDate != null && dateStr == selectedEndDate;
        isStartEqualsEnd = isRangeStart && isRangeEnd;

        if (selectedStartDate != null && selectedEndDate != null && !isDayOfWeek && !isDimmed) {
          isInRange = _isStrictlyBetween(dateStr, selectedStartDate!, selectedEndDate!);
        }
      }
    }

    final Color background;
    final Color textColor;
    final bool isSelected = isRangeStart || isRangeEnd;

    if (isDayOfWeek) {
      background = AppColorsV2.transparent;
      textColor = colors.txDayDimmed;
    } else if (isEmptyContent) {
      background = AppColorsV2.transparent;
      textColor = colors.txDayDimmed;
    } else if (isSelected) {
      background = colors.bgSelectedDay;
      textColor = colors.txDaySelected;
    } else if (isInRange) {
      background = colors.bgInRangeDay;
      textColor = colors.txDayInRange;
    } else if (cell.isWeekend) {
      background = AppColorsV2.transparent;
      textColor = colors.txDayDimmed;
    } else if (isDimmed) {
      background = AppColorsV2.transparent;
      textColor = colors.txDayDefault;
    } else {
      background = AppColorsV2.transparent;
      textColor = colors.txDayDefault;
    }

    final borderRadius = _resolveBorderRadius(
      isSelected: isSelected,
      isInRange: isInRange,
      isRangeStart: isRangeStart,
      isRangeEnd: isRangeEnd,
      isStartEqualsEnd: isStartEqualsEnd,
    );

    final canTap = !isDayOfWeek && !isEmptyCell && !isDimmed;

    return GestureContainerV2(
      behavior: HitTestBehavior.opaque,
      onTap: canTap
          ? () {
              onDateTap(dateStr, dayOfWeek);
              if (!isActive) {
                if (rowIndex == 0 && currentMonthIndex > 0) {
                  _previousMonth();
                } else if (rowIndex == 5 && currentMonthIndex < widget.months.length - 1) {
                  _nextMonth();
                }
              }
            }
          : null,
      child: SizedBox(
        height: widget.isInBottomSheet ? DimensV2.d36 : DimensV2.d56,
        child: Container(
          decoration: BoxDecoration(
            color: background,
            borderRadius: borderRadius,
          ),
          child: isDayOfWeek
              ? Center(
                  child: Text(
                    content,
                    style: AppTextStylesV2.labelMedium.copyWith(
                      color: textColor,
                    ),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!widget.isInBottomSheet) ...[
                      _DayTypeIndicator(
                          variant: _resolveDayTypeVariant(
                        isPast: isPastFromModel,
                        isActive: isActive,
                        isHalfDay: isHalfDay,
                        isFullDay: isFullDay,
                        isSelected: isSelected,
                        isRangeStart: isRangeStart,
                        isRangeEnd: isRangeEnd,
                        isWeekend: cell.isWeekend,
                        status: cell.status,
                      )),
                      const SizedBox(height: DimensV2.d2),
                    ],
                    Text(
                      content,
                      style: AppTextStylesV2.text14Medium.copyWith(color: textColor),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  /// Picks the [_DayTypeVariant] for a cell. Past / inactive / full-day
  /// leave always render as off-day regardless of selection.
  _DayTypeVariant _resolveDayTypeVariant({
    required bool isPast,
    required bool isActive,
    required bool isHalfDay,
    required bool isFullDay,
    required bool isSelected,
    required bool isRangeStart,
    required bool isRangeEnd,
    required bool isWeekend,
    String? status,
  }) {
    if (isSelected && isHalfDay) {
      return _DayTypeVariant.halfDaySelectedEnd;
    }
    if (isSelected) {
      return _DayTypeVariant.fullDaySelected;
    }
    if (isWeekend) {
      return _DayTypeVariant.weekend;
    }
    if (status != null && status.isNotEmpty) {
      final lower = status.toLowerCase();
      if (lower == 'da_su_dung') return _DayTypeVariant.daSuDung;
      if (lower == 'nghi_khong_phep') return _DayTypeVariant.nghiKhongPhep;
      if (lower == 'nghi_co_phep') return _DayTypeVariant.nghiCoPhep;
      if (lower == 'chua_su_dung') return _DayTypeVariant.chuaSuDung;
    }
    if (isPast || !isActive || isFullDay) {
      return _DayTypeVariant.offDay;
    }
    if (isHalfDay) return _DayTypeVariant.halfDay;
    return _DayTypeVariant.fullDay;
  }

  BorderRadiusGeometry? _resolveBorderRadius({
    required bool isSelected,
    required bool isInRange,
    required bool isRangeStart,
    required bool isRangeEnd,
    required bool isStartEqualsEnd,
  }) {
    if (isSelected) {
      if (isStartEqualsEnd) {
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

  bool _shouldShowNextButton() {
    if (currentMonthIndex >= widget.months.length - 1) return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.months.isEmpty) {
      return const EmptyStateWidgetV2();
    }

    if (widget.isInBottomSheet) {
      return _buildBody();
    }

    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: Padding(
        padding: widget.padding ?? EdgeInsets.zero,
        child: CardV2(
          borderRadius: widget.borderRadius ?? DimensV2.d28,
          shadowColor: widget.isInBottomSheetNoShadow ? AppColorsV2.transparent : null,
          borderColor: widget.isInBottomSheetNoShadow ? AppColorsV2.transparent : null,
          padding: EdgeInsets.all(widget.isInBottomSheetNoShadow ? 0 : AppSpacingV2.cardLg),
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    final dynamic currentMonth = widget.months[currentMonthIndex];
    final String? monthLabel = (currentMonth as dynamic).month as String?;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.isHalfDay && widget.topWidget != null) ...[
          widget.topWidget!,
        ],
        _buildMonthHeader(monthLabel),
        _buildWeekdayHeader(),
        _buildCalendarPager(),
        if (!widget.isInBottomSheet) ...[
          const SizedBox(height: DimensV2.d6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: DimensV2.d12),
            child: _PickerLegend(customLegends: widget.customLegends),
          ),
          if (widget.isShowValueSection) ...[
            const SizedBox(height: DimensV2.d12),
            const CommonDividerV2(),
            const SizedBox(height: DimensV2.d12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: DimensV2.d12),
              child: _buildValueSection(),
            ),
          ]
        ],
        if (widget.bottomWidget != null) ...[
          const SizedBox(height: DimensV2.d8),
          widget.bottomWidget!,
        ],
        if (widget.isEnableConfirmButton || widget.customBottomButton != null) ...[
          const SizedBox(height: DimensV2.d20),
          if (widget.customBottomButton != null)
            widget.customBottomButton!
          else
            _buildConfirmButton(),
        ],
      ],
    );
  }

  Widget _buildMonthHeader(String? monthLabel) {
    if (monthLabel == null || monthLabel.isEmpty) return const SizedBox.shrink();

    final canGoPrev = currentMonthIndex > 0;
    final canGoNext = _shouldShowNextButton();
    return Row(
      children: [
        if (canGoPrev)
          _ArrowButton(
            icon: Assets.icons.icArrowLeft,
            onTap: _previousMonth,
          )
        else
          const SizedBox(width: DimensV2.d28),
        Expanded(
          child: Text(
            monthLabel,
            textAlign: TextAlign.center,
            style: AppTextStylesV2.text16Medium.copyWith(
              color: context.mayColors.txContentPrimaryDefault,
            ),
          ),
        ),
        if (canGoNext)
          _ArrowButton(
            icon: Assets.icons.icArrowRight,
            onTap: _nextMonth,
          )
        else
          const SizedBox(width: DimensV2.d28),
      ],
    );
  }

  Widget _buildWeekdayHeader() {
    final List<dynamic> data =
        (widget.months[currentMonthIndex] as dynamic).dayOfMonth as List<dynamic>;
    final labels = data
        .take(7)
        .map<String>((c) => ((c as dynamic).content ?? '') as String)
        .toList(growable: false);

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
                    color: context.mayColors.txContentSecondaryDefault,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildCalendarPager() {
    const double estimatedMonthHeight = DimensV2.d56 * 6 + DimensV2.d12 * 4;
    return AppExpandablePageViewV2.builder(
      controller: _pageController,
      itemCount: widget.months.length,
      estimatedPageSize: estimatedMonthHeight,
      onPageChanged: (index) {
        setState(() {
          currentMonthIndex = index;
        });
      },
      itemBuilder: (BuildContext context, int index) {
        return buildCalendarGrid(index);
      },
    );
  }

  Widget _buildValueSection() {
    if (widget.mode == QuickPickerMode.single) {
      if (widget.isHalfDay) {
        return _buildHalfDayValueRows();
      } else {
        return _buildSingleDayValueRows();
      }
    }
    return _buildRangeValueRows();
  }

  Widget _buildHalfDayValueRows() {
    final dateText = _selectedDate == null ? '--' : _formatDateWithWeekday(_selectedDate!);
    final daysText = _selectedDate == null ? '--' : '0.5 ngày';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(child: _valueItem('Ca nghỉ', widget.selectedShiftName ?? '--')),
            const SizedBox(width: DimensV2.d12),
            Expanded(child: _valueItem('Ngày nghỉ', dateText)),
          ],
        ),
        const SizedBox(height: DimensV2.d12),
        _valueItem('Số ngày nghỉ', daysText),
      ],
    );
  }

  Widget _buildSingleDayValueRows() {
    final dateText = _selectedDate == null ? '--' : _formatDateWithWeekday(_selectedDate!);
    final daysText = _selectedDate == null ? '--' : _formatSingleDaysCount(_selectedDate!);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(child: _valueItem('Ngày nghỉ', dateText)),
            const SizedBox(width: DimensV2.d12),
            Expanded(child: _valueItem('Số ngày nghỉ', daysText)),
          ],
        ),
      ],
    );
  }

  Widget _buildRangeValueRows() {
    final startText = selectedStartDate == null ? '--' : _formatDateWithWeekday(selectedStartDate!);

    final bool isRangeSelected = selectedStartDate != null &&
        selectedEndDate != null &&
        selectedStartDate != selectedEndDate;

    final endText = isRangeSelected ? _formatDateWithWeekday(selectedEndDate!) : '--';
    final daysText =
        isRangeSelected ? _formatDaysCount(selectedStartDate!, selectedEndDate!) : '--';

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

  /// `1` for a full-day cell, `0.5` for half-day, `0` for an off-day / null.
  String _formatSingleDaysCount(String dateStr) {
    final cell = _findCellByDate(dateStr);
    if (cell == null) return '0 ngày';
    final bool isActive = cell.active == true;
    final bool isFullDay = cell.isFullDay == true;
    final bool isHalfDay = cell.isHalfDay == true;
    if (!isActive || isFullDay) return '0 ngày';
    final double total = isHalfDay ? 0.5 : 1;
    return '${_formatDayTotal(total)} ngày';
  }

  Widget _valueItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: AppTextStylesV2.text13Medium.copyWith(
            color: context.mayColors.txContentSecondaryDefault,
          ),
        ),
        const SizedBox(height: DimensV2.d8),
        Text(
          value,
          style: AppTextStylesV2.text14Semibold.copyWith(
            color: context.mayColors.txContentPrimaryDefault,
          ),
        ),
      ],
    );
  }

  /// Formats `dd/MM/yyyy` with a Vietnamese weekday prefix. e.g. `T4, 08/08/2026`.
  String _formatDateWithWeekday(String ddMmYyyy) {
    if (ddMmYyyy.isEmpty) return '--';
    final DateTime? d = parseDate(ddMmYyyy);
    if (d == null) return '--';
    final wd = _getWeekdayLabel(d.weekday);
    return '$wd, $ddMmYyyy';
  }

  String _getWeekdayLabel(int weekday) {
    switch (weekday) {
      case 1:
        return 'T2';
      case 2:
        return 'T3';
      case 3:
        return 'T4';
      case 4:
        return 'T5';
      case 5:
        return 'T6';
      case 6:
        return 'T7';
      case 7:
        return 'CN';
      default:
        return '';
    }
  }

  String _formatDaysCount(String start, String end) {
    final total = _countLeaveDays(start, end);
    return '${_formatDayTotal(total)} ngày';
  }

  /// Drops `.0` on whole numbers: `1.0 → "1"`, `1.5 → "1.5"`.
  String _formatDayTotal(double n) {
    if (n == n.truncateToDouble()) return n.toInt().toString();
    return n.toString();
  }

  Widget _buildConfirmButton() {
    final bool hasSelection = widget.mode == QuickPickerMode.single
        ? _selectedDate != null
        : selectedStartDate != null && selectedEndDate != null;
    final bool isConfirmEnabled = hasSelection && widget.isEnableConfirmButton;

    if (widget.isInBottomSheet) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CommonButtonV2(
            label: widget.submitText ?? 'Xác nhận',
            variant: CommonButtonVariant.primary,
            isEnabled: isConfirmEnabled,
            size: CommonButtonSize.large,
            loading: _isConfirming,
            onTap: isConfirmEnabled ? _onConfirmTap : null,
          ),
          SizedBox(height: AppSpacingV2.lg),
        ],
      );
    }

    return CommonButtonV2(
      label: widget.submitText ?? 'Xác nhận',
      variant: CommonButtonVariant.primary,
      isEnabled: isConfirmEnabled,
      loading: _isConfirming,
      onTap: isConfirmEnabled ? _onConfirmTap : null,
    );
  }

  Future<void> _onConfirmTap() async {
    setState(() {
      _isConfirming = true;
    });
    if (widget.mode == QuickPickerMode.single) {
      if (_selectedDate != null) {
        final cell = _findCellByDate(_selectedDate!);
        final dateToCallApi = (cell?.dateToCallApi as String?) ?? '';
        if (widget.onConfirmSingle != null) {
          widget.onConfirmSingle!.call(_selectedDate!, dateToCallApi);
        } else {
          widget.onTapSingleButton?.call(_selectedDate!, dateToCallApi);
        }
      }
    } else {
      final startCell = _findCellByDate(selectedStartDate ?? '');
      final endCell = _findCellByDate(selectedEndDate ?? '');
      if (widget.onConfirmRange != null) {
        widget.onConfirmRange!.call(
          selectedStartDate,
          selectedEndDate,
          (startCell?.dateToCallApi as String?) ?? '',
          (endCell?.dateToCallApi as String?) ?? '',
        );
      } else {
        widget.onTapButton?.call(
          selectedStartDate,
          selectedEndDate,
          (startCell?.dateToCallApi as String?) ?? '',
          (endCell?.dateToCallApi as String?) ?? '',
        );
      }
    }
    if (mounted) {
      setState(() {
        _isConfirming = false;
      });
      if (widget.isInBottomSheet) {
        Navigator.maybePop(context);
      }
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class CalendarGenerator {
  static final DateTime minDateLimit = DateTime(2023, 1, 1);

  static String _formatDayName(DateTime day) {
    switch (day.weekday) {
      case 1:
        return 'T2';
      case 2:
        return 'T3';
      case 3:
        return 'T4';
      case 4:
        return 'T5';
      case 5:
        return 'T6';
      case 6:
        return 'T7';
      case 7:
        return 'CN';
      default:
        return '';
    }
  }

  static String _capitalizeFirstLetter(String s) {
    if (s.isEmpty) return s;
    final String lower = s.toLowerCase();
    return lower[0].toUpperCase() + lower.substring(1);
  }

  static List<DayModel> _getDayOfWeekHeader(DateTime referenceDate) {
    final DateTime startOfWeek = referenceDate.subtract(Duration(days: referenceDate.weekday - 1));

    return List.generate(7, (index) {
      final day = startOfWeek.add(Duration(days: index));
      final dayName = _formatDayName(day);

      return DayModel(
        date: '',
        content: dayName,
        type: 'DAY_OF_WEEK',
        active: true,
        isPast: false,
        isWeekend: day.weekday >= 6,
        dayOfWeek: dayName,
      );
    });
  }

  static List<MonthModel> generateMonths({bool fullRange = false}) {
    final List<MonthModel> months = [];
    final DateTime today = DateTime.now();
    final DateTime todayTrunc = DateTime(today.year, today.month, today.day);

    if (!fullRange) {
      return [];
    } else {
      DateTime currentMonth = DateTime(minDateLimit.year, minDateLimit.month);
      final DateTime endMonth = DateTime(today.year, today.month);
      final List<DayModel> dayOfWeekHeader = _getDayOfWeekHeader(currentMonth);

      while (!currentMonth.isAfter(endMonth)) {
        final List<DayModel> days = [];
        final int firstDayOfWeek = currentMonth.weekday;
        final int leadingDays = (firstDayOfWeek - 1 + 7) % 7;

        for (int i = 0; i < leadingDays; i++) {
          days.add(DayModel(
            date: '',
            content: '',
            type: 'DAY',
            active: false,
            isPast: false,
            isWeekend: false,
            dayOfWeek: '',
          ));
        }

        final int daysInMonth = DateTime(currentMonth.year, currentMonth.month + 1, 0).day;
        for (int i = 1; i <= daysInMonth; i++) {
          final day = DateTime(currentMonth.year, currentMonth.month, i);
          final bool isDayPast = day.isBefore(todayTrunc);
          final bool isHalfDay = day.weekday == DateTime.wednesday;

          days.add(DayModel(
            date:
                '${day.day.toString().padLeft(2, '0')}/${day.month.toString().padLeft(2, '0')}/${day.year}',
            content: day.day.toString(),
            type: 'DAY',
            active: true,
            isPast: isDayPast,
            isWeekend: day.weekday >= 6,
            dayOfWeek: _formatDayName(day),
            isHalfDay: isHalfDay,
          ));
        }

        final int trailingDaysNeeded = (42 - (leadingDays + daysInMonth)) % 7;
        for (int i = 0; i < trailingDaysNeeded; i++) {
          days.add(DayModel(
            date: '',
            content: '',
            type: 'DAY',
            active: false,
            isPast: false,
            isWeekend: false,
            dayOfWeek: '',
          ));
        }

        months.add(MonthModel(
          month: _capitalizeFirstLetter(DateFormat('MMMM yyyy', 'vi_VN').format(currentMonth)),
          dayOfMonth: [...dayOfWeekHeader, ...days],
        ));

        currentMonth = DateTime(currentMonth.year, currentMonth.month + 1);
      }
    }

    return months;
  }
}

/// Data model for the calendar legend item.
class QuickCalendarLegend {
  const QuickCalendarLegend({
    required this.title,
    this.status,
  });

  final String title;
  final String? status;

  Color get resolvedColor => mapStatusColorCode(status);

  /// Maps the given [statusStr] to a corresponding [Color].
  static Color mapStatusColorCode(String? statusStr) {
    if (statusStr == null || statusStr.isEmpty) return AppColorsV2.genericWhite;
    final lower = statusStr.toLowerCase();
    if (lower == 'green' || lower == 'da_su_dung') return AppColorsV2.greenTheme500;
    if (lower == 'red' || lower == 'nghi_khong_phep') {
      return AppColorsV2.semanticCritical500;
    }
    if (lower == 'gray' || lower == 'nghi_co_phep') return AppColorsV2.neutral300;
    return AppColorsV2.genericWhite;
  }
}

class DayModel {
  final String date;
  final String content;
  final String type;
  final bool active;

  /// True when the day is strictly before today. The picker dims the cell
  /// and excludes it from the day count.
  final bool isPast;

  /// True when the day is a Saturday / Sunday. Drives the dim weekend
  /// visual; the backend can override tap-ability via [active].
  final bool isWeekend;
  final String dayOfWeek;

  /// True when the student only attends half a day. The cell stays
  /// tappable and contributes `0.5` to the day count.
  final bool isHalfDay;

  /// True for a full-day leave. The cell is dimmed and contributes `0`.
  final bool isFullDay;

  /// Wire-format date for the cell, sourced from
  /// `CalendarItem.dateToCallApi`. Callers forward this straight to the
  /// server so the picker never has to re-format dates. Empty when the
  /// backend did not return a wire-format value for this day.
  final String dateToCallApi;
  final String? status;

  DayModel({
    required this.date,
    required this.content,
    required this.type,
    required this.active,
    required this.isPast,
    required this.isWeekend,
    required this.dayOfWeek,
    this.isHalfDay = false,
    this.isFullDay = false,
    this.dateToCallApi = '',
    this.status,
  });
}

class MonthModel {
  final String? month;
  final List<DayModel> dayOfMonth;

  MonthModel({
    this.month,
    required this.dayOfMonth,
  });
}

// -----------------------------------------------------------------------------
// Public helper
// -----------------------------------------------------------------------------
/// Shows the [QuickCalendarPicker] inside a titled bottom sheet.
///
/// [onConfirmRange] fires when the user clicks the confirm button in range mode.
/// [onConfirmSingle] fires when the user clicks the confirm button in single mode.
void showQuickCalendarPicker<T, E>({
  required BuildContext context,
  required List<T> months,
  QuickPickerMode mode = QuickPickerMode.range,
  String? initStartDate,
  String? initEndDate,
  String? initialDate,
  bool isSelectingEndDate = false,
  Function(String)? onCheckDuplicate,
  VoidCallback? onCloseBottomSheet,
  bool isHalfDay = false,
  String? selectedShiftName,
  Widget? topWidget,
  Widget? bottomWidget,
  Widget? customBottomButton,
  bool isEnableConfirmButton = true,
  double borderRadius = DimensV2.d28,
  EdgeInsetsGeometry? margin,
  EdgeInsetsGeometry? padding,
  Function(String?, String?, String?, String?)? onTapButton,

  /// Callback when a single date is selected.
  void Function(String date, String dateToCallApi)? onTapSingleButton,

  /// Callback when the range selection is confirmed.
  Function(String?, String?, String?, String?)? onConfirmRange,

  /// Callback when the single selection is confirmed.
  void Function(String date, String dateToCallApi)? onConfirmSingle,
  String? customSelectingStarDateButtonName,
  String? customSelectingEndDateButtonName,
  int timeSwipePage = 500,
  bool isLoading = false,
  String? submitText,
  String? title,
  bool allowPastDates = false,
}) {
  showTitledBottomSheetV2(
    context: context,
    title: title ?? (mode == QuickPickerMode.single ? 'Chọn ngày' : 'Khoảng thời gian'),
    child: (titleWidget) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          titleWidget,
          QuickCalendarPicker<T, E>(
            months: months,
            mode: mode,
            initStartDate: initStartDate,
            initEndDate: initEndDate,
            initialDate: initialDate,
            isSelectingEndDate: isSelectingEndDate,
            onCheckDuplicate: onCheckDuplicate,
            onCloseBottomSheet: onCloseBottomSheet,
            isHalfDay: isHalfDay,
            selectedShiftName: selectedShiftName,
            topWidget: topWidget,
            bottomWidget: bottomWidget,
            customBottomButton: customBottomButton,
            isEnableConfirmButton: isEnableConfirmButton,
            borderRadius: borderRadius,
            margin: margin,
            padding: padding,
            onTapButton: onTapButton,
            onTapSingleButton: onTapSingleButton,
            onConfirmRange: onConfirmRange,
            onConfirmSingle: onConfirmSingle,
            customSelectingStarDateButtonName: customSelectingStarDateButtonName,
            customSelectingEndDateButtonName: customSelectingEndDateButtonName,
            timeSwipePage: timeSwipePage,
            isLoading: isLoading,
            submitText: submitText,
            isInBottomSheet: true,
            allowPastDates: allowPastDates,
          ),
        ],
      );
    },
  );
}
