import 'package:dartx/dartx.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:flutter/material.dart';

double commonRadioSizeBox = DimensV2.d20;

/// A radio-style list that renders a vertical stack of selectable rows.
///
/// Each row uses [PressableCardContainerV2] for the press feedback and shows
/// a leading custom widget (built via [elementWidget] or
/// [modifiedElementWidget]) and a trailing selection indicator. Exactly one
/// of [elementWidget] or [modifiedElementWidget] must be provided.
class RadioListV2 extends StatefulWidget {
  /// Creates a radio list. Provide either [elementWidget] or
  /// [modifiedElementWidget] — the constructor asserts that at least one is
  /// non-null.
  const RadioListV2({
    super.key,
    this.selectedIndex,
    this.unableToSelectIndexes,
    this.elements = const [],
    this.onSelect,
    this.elementWidget,
    this.isLoading = false,
    this.modifiedElementWidget,
    this.elementWidgetPadding,
    this.elementMinHeight = DimensV2.d50,
    this.equalizeElementHeight = false,
    this.margin,
    this.pressedOffset = DimensV2.d4,
  }) : assert(elementWidget != null || modifiedElementWidget != null);

  /// Index of the currently selected element. `null` means nothing is
  /// selected.
  final int? selectedIndex;

  /// Indices that should be rendered as non-selectable (dimmed and ignored
  /// by taps).
  final List<int?>? unableToSelectIndexes;

  /// Source list of values that back the rows.
  final List<dynamic> elements;

  /// Invoked with the tapped element's value when the user selects a row.
  final void Function(dynamic)? onSelect;

  /// Builds the leading widget for a row given the element value.
  final Widget Function(dynamic)? elementWidget;

  /// Builds the entire row (receives the element value and the trailing
  /// selection indicator) when full control of the row layout is needed.
  final Widget Function(dynamic, Widget)? modifiedElementWidget;

  /// Inner padding applied to each [elementWidget].
  final EdgeInsets? elementWidgetPadding;

  /// Minimum height of every row in the list.
  final double elementMinHeight;

  /// When `true`, all rows are forced to share the height of the tallest
  /// row on the next frame.
  final bool equalizeElementHeight;

  /// Outer margin around each row. When null, a sensible default is used.
  final EdgeInsets? margin;

  /// When `true`, tapping a row swaps the selected index but the row
  /// renders a spinner until [onSelect] completes.
  final bool? isLoading;

  /// The distance each card shifts down when pressed. Set to `0` to disable
  /// the press animation (e.g. inside a bottom sheet scroll view).
  final double pressedOffset;

  /// Creates the mutable state for this widget.
  @override
  State<RadioListV2> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioListV2> {
  List<GlobalKey>? keys;

  double? maxHeight;

  /// Initializes state. Currently a no-op kept for future hooks; super's
  /// implementation is invoked.
  @override
  void initState() {
    super.initState();
    if (widget.selectedIndex != null &&
        widget.selectedIndex! >= 0 &&
        widget.selectedIndex! < widget.elements.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final currentContext = keys?[widget.selectedIndex!].currentContext;
        if (currentContext != null) {
          Scrollable.ensureVisible(
            currentContext,
            alignment: 0.5,
          );
        }
      });
    }
  }

  int? _clickingIndex;

  /// Marks [index] as the currently-clicking row, triggers a rebuild, and
  /// forwards [value] to [RadioListV2.onSelect] when supplied.
  void setSelected(dynamic value, int index) {
    setState(() {
      _clickingIndex = index;
    });
    widget.onSelect?.call(value);
  }

  Widget _buildTrailing({
    required bool isSelected,
    required bool isLoading,
  }) {
    if (isLoading) {
      return SizedBox(
        width: AppSpacingV2.md,
        height: AppSpacingV2.md,
        child: CircularProgressIndicator(
          strokeWidth: 1.5,
          color: context.mayColors.icColor,
        ),
      );
    }

    final colors = context.mayColors;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: commonRadioSizeBox,
      height: commonRadioSizeBox,
      decoration: BoxDecoration(
        color: isSelected ? colors.bdCard : colors.bgCard,
        borderRadius: BorderRadius.circular(DimensV2.d100),
        border: Border.all(
          color: isSelected ? colors.bdCard : colors.bdDefault,
          width: isSelected ? 0 : DimensV2.d1,
        ),
      ),
      child: isSelected
          ? Icon(
              Icons.check_rounded,
              size: DimensV2.d14,
              color: colors.bgIcon,
            )
          : null,
    );
  }

  double _trailingGap() {
    final padding = widget.elementWidgetPadding;
    if (padding == null) return AppSpacingV2.md;
    return padding.left > 0 ? padding.left : AppSpacingV2.md;
  }

  /// Builds the radio list, lazily allocating a [GlobalKey] per element and
  /// (when [RadioListV2.equalizeElementHeight] is set) recomputing the
  /// shared row height on every frame.
  @override
  Widget build(BuildContext context) {
    if (keys == null || keys!.length != widget.elements.length) {
      keys = List.generate(widget.elements.length, (i) => GlobalKey(debugLabel: 'radio_item_$i'));
    }

    if (widget.equalizeElementHeight) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        var mH = 0.0;
        for (var k in keys!) {
          final RenderBox? renderBox = k.currentContext?.findRenderObject() as RenderBox?;
          if (renderBox != null && (mH) < renderBox.size.height) {
            mH = renderBox.size.height;
          }
        }
        if (maxHeight != mH) {
          setState(() {
            maxHeight = mH;
          });
        }
      });
    }

    final colors = context.mayColors;

    return Column(
      children: <Widget>[
        ...widget.elements.mapIndexed((index, e) {
          final isDisabled = widget.unableToSelectIndexes?.contains(index) == true;
          final isLastItem = index == widget.elements.length - 1;
          final isThisItemLoading = widget.isLoading == true && _clickingIndex == index;
          final isEffectivelySelected =
              widget.isLoading == true ? _clickingIndex == index : index == widget.selectedIndex;
          final itemMargin = widget.margin ??
              const EdgeInsets.only(
                bottom: AppSpacingV2.md,
              );
          final trailing = _buildTrailing(
            isSelected: isEffectivelySelected,
            isLoading: isThisItemLoading,
          );

          return Padding(
            padding: itemMargin.copyWith(
              bottom: isLastItem ? AppSpacingV2.xs : itemMargin.bottom,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: widget.elementMinHeight),
              child: Opacity(
                opacity: isDisabled ? 0.4 : 1,
                child: PressableCardContainerV2(
                  key: keys?[index],
                  color: isEffectivelySelected ? colors.bgSurface : colors.bgCard,
                  borderColor: isEffectivelySelected ? colors.bdRadio : colors.bdDefault,
                  borderWidth: DimensV2.d_05,
                  shadowColor: widget.pressedOffset == DimensV2.d0
                      ? AppColorsV2.transparent
                      : (isEffectivelySelected ? colors.sdRadio : colors.sdDefault),
                  pressedOffset: widget.pressedOffset,
                  onTap:
                      (isDisabled || widget.isLoading == true) ? null : () => setSelected(e, index),
                  padding: const EdgeInsets.all(AppSpacingV2.md),
                  child: SizedBox(
                    height: maxHeight,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: () {
                        final list = [
                          Expanded(
                            child: widget.elementWidget?.call(e) ?? const SizedBox.shrink(),
                          ),
                          if (widget.elementWidget != null) SizedBox(width: _trailingGap()),
                          trailing,
                        ];

                        if (widget.modifiedElementWidget != null) {
                          return [
                            widget.modifiedElementWidget?.call(e, trailing) ??
                                const SizedBox.shrink()
                          ];
                        }
                        return list;
                      }(),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
