import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../avatar_view/common_avatar.dart';

import '../../may_uikit_internal.dart';
import '../../resources/generated/assets.gen.dart';
import '_internal/field_decoration.dart';
import '_internal/field_text_styles.dart';

/// K12 mobile field — single source of truth for the `common_text_field`
/// family.
///
/// [CommonTextField] is one [StatefulWidget] that renders all three K12 field
/// presentations — single-line input, non-editable dropdown, and multi-line
/// text area — selected via [variant]. Every concern that the variants
/// share is implemented exactly once here:
///
/// * Focus / controller lifecycle
/// * [MayFieldState] resolution
/// * [FieldDecoration] resolution + active accent
/// * Outer layout (container, padding, hint message, focus ink)
/// * Clear button, trailing icon, chevron, active-cursor row
///
/// The only code that branches on [variant] is the inner content (a
/// single-line [EditableText], a non-editable [Text], or a multi-line
/// [EditableText] with a placeholder overlay) and the trailing widget.
class CommonTextField extends StatefulWidget {
  /// Creates a field whose typography can be overridden with [textStyle] and
  /// [placeholderStyle] while semantic state colors remain controlled by May.
  const CommonTextField({
    super.key,
    required this.variant,
    this.shape,
    this.label,
    this.hintOrErrorMessage,
    this.placeholder,
    this.textStyle,
    this.placeholderStyle,
    this.value,
    this.controller,
    this.debounceDuration = const Duration(milliseconds: 550),
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.focusNode,
    this.state,
    this.hasError = false,
    this.isReadOnly = false,
    this.isEnabled = true,
    this.showLabel = true,
    this.showHintOrErrorMessage = true,
    this.showClearButton = true,
    this.showTrailingIcon = true,
    this.prefixIcon,
    this.trailingIcon = MayFieldTrailingIcon.none,
    this.swapIcon,
    this.showChevron = true,
    this.keyboardType,
    this.textInputAction,
    this.minLines,
    this.maxLines,
    this.obscureText = false,
    this.autofocus = false,
    this.width,
    this.isSearch = false,
    this.dropdownTitle,
    this.dropdownEmptyTitle,
    this.dropdownEmptyDescription,
    this.dropdownItems,
    this.dropdownItemLabel,
    this.dropdownSelectedValue,
    this.dropdownIsLoading = false,
    this.dropdownAutoSelectFirst = true,
    this.dropdownLoadingHeightFactor = 0.5,
    this.onDropdownSearchChanged,
    this.onDropdownItemSelected,
    this.onDropdownItemIndexSelected,
  })  : assert(
          swapIcon == null || trailingIcon == MayFieldTrailingIcon.custom,
          'swapIcon requires MayFieldTrailingIcon.custom',
        ),
        assert(
          variant != CommonTextFieldVariant.textArea ||
              (maxLines == null || minLines == null || maxLines >= minLines),
          'maxLines must be greater than or equal to minLines',
        );

  /// Which presentation to render. Drives inner content, trailing
  /// affordance, and the default values for [keyboardType],
  /// [textInputAction], [minLines], [maxLines] and [shape].
  final CommonTextFieldVariant variant;

  /// Container shape. When `null`, defaults to [MayFieldShape.pill] for
  /// input and dropdown, and [MayFieldShape.rounded] for textArea.
  final MayFieldShape? shape;

  /// Optional text rendered above the field (floating label).
  final String? label;

  /// Text shown beneath the field — hint by default, error message when
  /// [hasError] (or [state]) is in an error variant.
  final String? hintOrErrorMessage;

  /// Placeholder shown inside the field when it is empty.
  final String? placeholder;

  /// Optional typography override for committed values.
  ///
  /// State-driven semantic colors always take precedence over the color in
  /// this style. When omitted, the field keeps its existing default style.
  final TextStyle? textStyle;

  /// Optional typography override for placeholder values.
  ///
  /// State-driven semantic colors always take precedence over the color in
  /// this style. When omitted, the field keeps its existing default style.
  final TextStyle? placeholderStyle;

  /// Display value for non-editable variants. Ignored for
  /// [CommonTextFieldVariant.input] and [CommonTextFieldVariant.textArea], which
  /// read from [controller].
  final String? value;

  /// External controller. Required for non-null text editing. When
  /// `null` and the [variant] supports editing, the widget creates and
  /// owns an internal controller seeded with [value].
  final TextEditingController? controller;

  /// Debounce time for [onChanged]. Default is 0.
  final Duration debounceDuration;

  /// Called whenever the user types. Ignored for
  /// [CommonTextFieldVariant.dropdown].
  final ValueChanged<String>? onChanged;

  /// Called when the search text inside the dropdown changes.
  final ValueChanged<String>? onDropdownSearchChanged;

  /// Called when the user submits the field. Ignored for
  /// [CommonTextFieldVariant.dropdown].
  final ValueChanged<String>? onSubmitted;

  /// Called when the user taps the field. Used by
  /// [CommonTextFieldVariant.dropdown]; ignored for editable variants.
  final VoidCallback? onTap;

  /// External focus node. When `null`, the widget creates and owns one.
  final FocusNode? focusNode;

  /// Explicit state override. When `null` the state is resolved from
  /// [hasError] / [isReadOnly] / [isEnabled] and the current controller
  /// text.
  final MayFieldState? state;

  /// Convenience flag equivalent to `state == errorUnfilled | errorFilled`.
  final bool hasError;

  /// Convenience flag equivalent to `state == readOnly`. Ignored for
  /// [CommonTextFieldVariant.dropdown].
  final bool isReadOnly;

  /// Convenience flag equivalent to `state == disabled`.
  final bool isEnabled;

  /// Whether the floating label should be shown.
  final bool showLabel;

  /// Whether the hint / error message beneath the field should be shown.
  final bool showHintOrErrorMessage;

  /// Whether the leading "X" clear button is shown when the editable
  /// field has a committed value and is focused.
  final bool showClearButton;

  /// Whether the trailing icon (default: calendar) is rendered.
  final bool showTrailingIcon;

  /// Custom widget to be displayed at the beginning of the text field.
  final Widget? prefixIcon;

  /// Which trailing icon to render.
  final MayFieldTrailingIcon trailingIcon;

  /// Custom trailing widget used when [trailingIcon] is
  /// [MayFieldTrailingIcon.custom]. Takes precedence over the default
  /// calendar icon.
  final Widget? swapIcon;

  /// Whether the trailing chevron is rendered. Used by
  /// [CommonTextFieldVariant.dropdown].
  final bool showChevron;

  /// Soft keyboard type. Defaults to `text` for input, `multiline` for
  /// textArea, ignored for dropdown.
  final TextInputType? keyboardType;

  /// Soft keyboard action button. Defaults to `done` for input,
  /// `newline` for textArea, ignored for dropdown.
  final TextInputAction? textInputAction;

  /// Initial / minimum number of visible lines. Defaults to `1` for
  /// input, `3` for textArea, ignored for dropdown.
  final int? minLines;

  /// Maximum number of visible lines before the field starts scrolling.
  /// Defaults to `1` for input, `5` for textArea, ignored for dropdown.
  final int? maxLines;

  /// Hides the typed text. Ignored for non-editable variants.
  final bool obscureText;

  /// Whether the field should autofocus.
  final bool autofocus;

  /// Whether this field is a search field (affects inactive background color).
  final bool isSearch;

  /// Optional fixed width; the field stretches to fill its parent by
  /// default.
  final double? width;

  /// Title shown in the bottom sheet header when [dropdownItems] is provided.
  /// Title of the dropdown bottom sheet.
  final String? dropdownTitle;

  /// Title of the empty state in the dropdown bottom sheet.
  final String? dropdownEmptyTitle;

  /// Description of the empty state in the dropdown bottom sheet.
  final String? dropdownEmptyDescription;

  /// Items to render in the dropdown bottom sheet.
  final List<dynamic>? dropdownItems;

  /// Function to extract the label from a dynamic dropdown item.
  final String Function(dynamic)? dropdownItemLabel;

  /// The currently selected value for the dropdown list, used to determine the active selection.
  /// Used if `dropdownItems` contains non-String objects.
  final dynamic dropdownSelectedValue;

  /// Whether the dropdown items are currently loading.
  final bool dropdownIsLoading;

  /// Whether to auto-select the first item in the list if nothing is selected.
  final bool dropdownAutoSelectFirst;

  /// The height factor for the loading indicator in the dropdown bottom sheet.
  final double dropdownLoadingHeightFactor;

  /// Called with the selected item when the user confirms a selection
  /// from the built-in bottom sheet.
  final ValueChanged<dynamic>? onDropdownItemSelected;

  /// Called with the index of the selected item when the user confirms a selection
  /// from the built-in bottom sheet.
  final ValueChanged<int>? onDropdownItemIndexSelected;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  late FocusNode _focusNode;
  bool _ownsFocusNode = false;
  bool _focused = false;

  late ValueNotifier<List<dynamic>> _dropdownItemsNotifier;
  late ValueNotifier<bool> _dropdownIsLoadingNotifier;

  // Only created when the variant supports editing. Stays null for
  // dropdown so we never allocate a TextEditingController we don't use.
  TextEditingController? _controller;
  bool _ownsController = false;

  Timer? _debounceTimer;

  bool get _isEditable => widget.variant != CommonTextFieldVariant.dropdown;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _ownsFocusNode = widget.focusNode == null;
    _focusNode.addListener(_handleFocusChange);

    _dropdownItemsNotifier = ValueNotifier(widget.dropdownItems ?? []);
    _dropdownIsLoadingNotifier = ValueNotifier(widget.dropdownIsLoading);

    _initController();
  }

  void _initController() {
    if (!_isEditable) return;
    if (widget.controller != null) {
      _controller = widget.controller;
      _ownsController = false;
    } else {
      _controller = TextEditingController(text: widget.value ?? '');
      _ownsController = true;
    }
    _controller!.addListener(_handleTextChange);
  }

  @override
  void didUpdateWidget(covariant CommonTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.dropdownItems != oldWidget.dropdownItems) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _dropdownItemsNotifier.value = widget.dropdownItems ?? [];
        }
      });
    }
    if (widget.dropdownIsLoading != oldWidget.dropdownIsLoading) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _dropdownIsLoadingNotifier.value = widget.dropdownIsLoading;
        }
      });
    }
    if (widget.focusNode != null && widget.focusNode != _focusNode) {
      _focusNode.removeListener(_handleFocusChange);
      _focusNode = widget.focusNode!;
      _ownsFocusNode = false;
      _focusNode.addListener(_handleFocusChange);
    }
    if (_isEditable && widget.controller != null && widget.controller != _controller) {
      _controller?.removeListener(_handleTextChange);
      _controller = widget.controller;
      _ownsController = false;
      _controller!.addListener(_handleTextChange);
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    if (_ownsFocusNode) {
      _focusNode.dispose();
    }
    _controller?.removeListener(_handleTextChange);
    if (_ownsController) {
      _controller?.dispose();
    }
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _handleFocusChange() {
    if (!mounted) return;
    setState(() => _focused = _focusNode.hasFocus);
  }

  void _handleTextChange() {
    if (!mounted) return;
    setState(() {});
  }

  void _handleOnChanged(String value) {
    if (widget.debounceDuration == Duration.zero) {
      widget.onChanged?.call(value);
      return;
    }
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
    _debounceTimer = Timer(widget.debounceDuration, () {
      if (mounted) {
        widget.onChanged?.call(value);
      }
    });
  }

  /// Resolves the field state from explicit override / convenience flags /
  /// current value. Single source of truth across all three variants.
  MayFieldState get _resolvedState {
    if (widget.state != null) return widget.state!;
    if (!widget.isEnabled) return MayFieldState.disabled;
    if (_isEditable && widget.isReadOnly) return MayFieldState.readOnly;
    final hasValue = _currentValue.isNotEmpty;
    if (widget.hasError) {
      return hasValue ? MayFieldState.errorFilled : MayFieldState.errorUnfilled;
    }
    return hasValue ? MayFieldState.filled : MayFieldState.unfilled;
  }

  bool get _isActive => _focused;

  /// Display value used for state resolution.
  ///
  /// * Editable variants read from the (possibly internal) controller.
  /// * Dropdown reads from [CommonTextField.value].
  String get _currentValue {
    if (_isEditable) return _controller?.text ?? '';
    return widget.value ?? '';
  }

  void _handleTap() {
    if (!widget.isEnabled) return;
    if (widget.variant == CommonTextFieldVariant.dropdown) {
      widget.onTap?.call();
      if (widget.dropdownItems != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            _showDropdownBottomSheet(context);
          }
        });
      }
      return;
    }
    if (widget.isReadOnly) return;
    _focusNode.requestFocus();
  }

  void _showDropdownBottomSheet(BuildContext ctx) {
    final title = widget.dropdownTitle ?? widget.label ?? '';
    // Use the notifier's value for the initial selectedIndex check
    final initialItems = _dropdownItemsNotifier.value;
    bool hasEverHadItems = initialItems.isNotEmpty;
    dynamic selectedValue = widget.dropdownSelectedValue ?? widget.value;

    // Resolve instance mismatch if already selected
    if (selectedValue != null) {
      bool found = false;
      if (initialItems.contains(selectedValue)) {
        found = true;
      } else {
        if (widget.dropdownItemLabel != null) {
          final targetLabel =
              selectedValue is String ? selectedValue : widget.dropdownItemLabel!(selectedValue);
          if (targetLabel.toString().isNotEmpty) {
            for (final item in initialItems) {
              if (widget.dropdownItemLabel!(item) == targetLabel) {
                selectedValue = item;
                found = true;
                break;
              }
            }
          }
        } else if (selectedValue is String && selectedValue.isNotEmpty) {
          for (final item in initialItems) {
            if (item.toString() == selectedValue) {
              selectedValue = item;
              found = true;
              break;
            }
          }
        }
      }
      if (!found) {
        selectedValue = null;
      }
    }

    // Default to the first item (index 0) if nothing is selected
    if (widget.dropdownAutoSelectFirst && selectedValue == null && initialItems.isNotEmpty) {
      selectedValue = initialItems.first;
    }
    String searchText = '';

    final isConfirmEnabled = ValueNotifier<bool>(selectedValue != null);
    final colors = ctx.mayColors;

    showTitledBottomSheetV2(
      context: ctx,
      title: title,
      isConfirmEnabled: isConfirmEnabled,
      onConfirm: null,
      onDismiss: () {
        if (searchText.isNotEmpty) {
          Future.delayed(const Duration(milliseconds: 300), () {
            widget.onDropdownSearchChanged?.call('');
          });
        }
      },
      childConstraint: const BoxConstraints(
        maxHeight: double.infinity,
      ),
      child: (titleWidget) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            titleWidget,
            Flexible(
              child: ValueListenableBuilder<bool>(
                valueListenable: _dropdownIsLoadingNotifier,
                builder: (context, isLoading, _) {
                  return ValueListenableBuilder<List<dynamic>>(
                    valueListenable: _dropdownItemsNotifier,
                    builder: (context, items, _) {
                      if (items.isNotEmpty) {
                        hasEverHadItems = true;
                      }
                      return StatefulBuilder(
                        builder: (sheetCtx, setSheetState) {
                          final keyboardHeight = AppDimenV2.of(sheetCtx).keyboardHeight;
                          final availableHeight =
                              AppDimenV2.of(sheetCtx).screenHeight - keyboardHeight;

                          Widget content;
                          final filtered = widget.onDropdownSearchChanged != null
                              ? items
                              : items
                                  .where((opt) =>
                                      (widget.dropdownItemLabel?.call(opt) ?? opt.toString())
                                          .toLowerCase()
                                          .contains(searchText.toLowerCase()))
                                  .toList();

                          content = Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (widget.isSearch &&
                                  (hasEverHadItems || searchText.isNotEmpty)) ...[
                                // Search field with leading icon
                                CommonTextField(
                                  variant: CommonTextFieldVariant.input,
                                  isSearch: true,
                                  placeholder: S.current.searchPlaceholder,
                                  shape: MayFieldShape.pill,
                                  showTrailingIcon: false,
                                  prefixIcon: SvgPicture.asset(
                                    Assets.icons.icSearch.keyName,
                                    width: DimensV2.d20,
                                    height: DimensV2.d20,
                                    colorFilter:
                                        ColorFilter.mode(colors.txHelptext, BlendMode.srcIn),
                                  ),
                                  showLabel: false,
                                  debounceDuration: widget.debounceDuration,
                                  onChanged: (val) {
                                    searchText = val;
                                    widget.onDropdownSearchChanged?.call(val);
                                    if (widget.onDropdownSearchChanged == null) {
                                      final newFiltered = items
                                          .where((opt) =>
                                              opt.toLowerCase().contains(searchText.toLowerCase()))
                                          .toList();
                                      isConfirmEnabled.value = selectedValue != null &&
                                          newFiltered.contains(selectedValue!);
                                      setSheetState(() {});
                                    }
                                  },
                                ),
                                const SizedBox(height: AppSpacingV2.sm),
                              ],
                              if (isLoading)
                                Flexible(
                                  child: SingleChildScrollView(
                                    child: SizedBox(
                                      height: availableHeight * widget.dropdownLoadingHeightFactor,
                                      child: const Center(
                                        child: CommonLoadingIndicatorV2(),
                                      ),
                                    ),
                                  ),
                                )
                              else if (filtered.isEmpty)
                                Flexible(
                                  child: SingleChildScrollView(
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                        minHeight: availableHeight * 0.5,
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.symmetric(vertical: DimensV2.d24),
                                          child: EmptyStateWidgetV2(
                                            title: widget.dropdownEmptyTitle ??
                                                S.current.emptyDataTitle,
                                            description: widget.dropdownEmptyDescription ??
                                                S.current.emptyDataDescription,
                                            padding: EdgeInsets.zero,
                                            hasBorder: false,
                                            hasShadow: false,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              else
                                // Radio list
                                Flexible(
                                  child: SingleChildScrollView(
                                    padding: const EdgeInsets.only(bottom: AppSpacingV2.md),
                                    child: RadioListV2(
                                      elements: filtered,
                                      selectedIndex: selectedValue != null
                                          ? (filtered.contains(selectedValue!)
                                              ? filtered.indexOf(selectedValue!)
                                              : null)
                                          : null,
                                      elementWidget: (element) {
                                        String? title;
                                        String? subtitle;
                                        String? imageUrl;
                                        String? content;

                                        try {
                                          final dynamic d = element;
                                          title = d.title?.toString();
                                          subtitle =
                                              d.subTitle?.toString() ?? d.sub_title?.toString();
                                          imageUrl =
                                              d.imageUrl?.toString() ?? d.image_url?.toString();
                                          content = d.content?.toString();
                                        } catch (_) {}

                                        final hasCustomProperties =
                                            (title != null && title.isNotEmpty) &&
                                                (subtitle != null && subtitle.isNotEmpty) &&
                                                (imageUrl != null);

                                        if (hasCustomProperties) {
                                          return Row(
                                            children: [
                                              CommonAvatarV2(
                                                imageUrl: imageUrl,
                                                radius: DimensV2.d50,
                                              ),
                                              const SizedBox(width: AppSpacingV2.md),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      title,
                                                      style:
                                                          AppTextStylesV2.text16Semibold.copyWith(
                                                        color: colors.txContentPrimaryDefault,
                                                      ),
                                                    ),
                                                    if (subtitle.isNotEmpty) ...[
                                                      const SizedBox(height: DimensV2.d2),
                                                      Text(
                                                        subtitle,
                                                        style:
                                                            AppTextStylesV2.text14Medium.copyWith(
                                                          color: colors.txModalDescription,
                                                        ),
                                                      ),
                                                    ],
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        }

                                        final label = widget.dropdownItemLabel?.call(element) ??
                                            content ??
                                            title ??
                                            element.toString();

                                        return Text(
                                          label,
                                          style: AppTextStylesV2.text14Medium.copyWith(
                                            color: colors.txContentPrimaryDefault,
                                          ),
                                        );
                                      },
                                      onSelect: (value) {
                                        selectedValue = value;
                                        if (selectedValue != null) {
                                          widget.onDropdownItemSelected?.call(selectedValue!);
                                          final idx = items.indexOf(selectedValue!);
                                          if (idx >= 0) {
                                            widget.onDropdownItemIndexSelected?.call(idx);
                                          }
                                        }
                                        Navigator.of(ctx).pop();
                                      },
                                      pressedOffset: DimensV2.d0,
                                    ),
                                  ),
                                ),
                            ],
                          );

                          return ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: availableHeight * 0.75,
                            ),
                            child: AnimatedSize(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.fastOutSlowIn,
                              alignment: Alignment.topCenter,
                              child: content,
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  // ---------------------------------------------------------------------------
  // Per-variant defaults. Computed once per build; cheap.
  // ---------------------------------------------------------------------------

  MayFieldShape get _resolvedShape =>
      widget.shape ??
      (widget.variant == CommonTextFieldVariant.textArea
          ? MayFieldShape.rounded
          : MayFieldShape.pill);

  TextInputType get _resolvedKeyboardType =>
      widget.keyboardType ??
      (widget.variant == CommonTextFieldVariant.textArea
          ? TextInputType.multiline
          : TextInputType.text);

  TextInputAction get _resolvedTextInputAction =>
      widget.textInputAction ??
      (widget.variant == CommonTextFieldVariant.textArea
          ? TextInputAction.newline
          : TextInputAction.done);

  int get _resolvedMinLines =>
      widget.minLines ?? (widget.variant == CommonTextFieldVariant.textArea ? 3 : 1);

  int get _resolvedMaxLines =>
      widget.maxLines ?? (widget.variant == CommonTextFieldVariant.textArea ? 5 : 1);

  bool get _shouldShowClearButton {
    if (!_isEditable) return false;
    if (widget.variant == CommonTextFieldVariant.textArea) return false;
    if (!widget.showClearButton) return false;
    final s = _resolvedState;
    if (s != MayFieldState.filled && s != MayFieldState.errorFilled) {
      return false;
    }
    return _isActive;
  }

  // ---------------------------------------------------------------------------
  // Build.
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    final state = _resolvedState;
    final shape = _resolvedShape;
    final baseDecoration = FieldDecoration.resolve(
      state: state,
      shape: shape,
      colors: colors,
      isActive: _isActive,
      isSearch: widget.isSearch && widget.variant == CommonTextFieldVariant.input,
    );
    final decoration = widget.variant == CommonTextFieldVariant.textArea
        ? baseDecoration.copyWith(verticalPadding: AppSpacingV2.md)
        : baseDecoration;

    final showLabel = widget.showLabel;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: widget.width ?? double.infinity),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            decoration: decoration.boxDecoration,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: _handleTap,
                borderRadius: decoration.borderRadius,
                splashColor: AppColorsV2.transparent,
                highlightColor: AppColorsV2.transparent,
                hoverColor: AppColorsV2.transparent,
                focusColor: AppColorsV2.transparent,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: decoration.horizontalPadding,
                    vertical: decoration.verticalPadding,
                  ).copyWith(
                      left: widget.prefixIcon != null
                          ? AppSpacingV2.sm
                          : decoration.horizontalPadding,
                      right:
                          _shouldShowClearButton ? AppSpacingV2.sm : decoration.horizontalPadding),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (widget.prefixIcon != null) ...[
                        widget.prefixIcon!,
                        const SizedBox(width: AppSpacingV2.xs),
                      ],
                      Expanded(
                        child: _FieldContent(
                          variant: widget.variant,
                          decoration: decoration,
                          controller: _controller,
                          focusNode: _focusNode,
                          state: state,
                          isActive: _isActive,
                          label: showLabel ? widget.label : null,
                          placeholder: widget.placeholder,
                          textStyle: widget.textStyle,
                          placeholderStyle: widget.placeholderStyle,
                          showLabel: showLabel,
                          isEnabled: widget.isEnabled,
                          isReadOnly: widget.isReadOnly,
                          keyboardType: _resolvedKeyboardType,
                          textInputAction: _resolvedTextInputAction,
                          minLines: _resolvedMinLines,
                          maxLines: _resolvedMaxLines,
                          obscureText: widget.obscureText,
                          autofocus: widget.autofocus,
                          displayValue: widget.value,
                          onChanged: widget.onChanged != null ? _handleOnChanged : null,
                          onSubmitted: widget.onSubmitted,
                          isSearch: widget.isSearch,
                        ),
                      ),
                      _buildTrailing(decoration.placeholderColor),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (widget.showHintOrErrorMessage &&
              widget.hintOrErrorMessage != null &&
              widget.hintOrErrorMessage!.isNotEmpty) ...[
            const SizedBox(height: AppSpacingV2.xs),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacingV2.xl,
              ),
              child: _FieldHintMessage(
                message: widget.hintOrErrorMessage!,
                isError: state == MayFieldState.errorUnfilled || state == MayFieldState.errorFilled,
                color: state == MayFieldState.errorUnfilled || state == MayFieldState.errorFilled
                    ? decoration.errorColor
                    : decoration.hintColor,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTrailing(Color placeholderColor) {
    switch (widget.variant) {
      case CommonTextFieldVariant.input:
        if (_shouldShowClearButton) {
          return Padding(
            padding: const EdgeInsets.only(left: AppSpacingV2.xs),
            child: _FieldClearButton(
              onTap: () {
                _controller?.clear();
                _handleOnChanged('');
                // Hack: prevent IME from committing the composing text after clear
                Future.delayed(const Duration(milliseconds: 50), () {
                  if (_controller != null && _controller!.text.isNotEmpty) {
                    _controller!.clear();
                    _handleOnChanged('');
                  }
                });
              },
              color: placeholderColor,
            ),
          );
        }
        if (widget.showTrailingIcon) {
          return Padding(
            padding: const EdgeInsets.only(left: AppSpacingV2.sm),
            child: _buildTrailingIcon(placeholderColor),
          );
        }
        return const SizedBox.shrink();
      case CommonTextFieldVariant.dropdown:
        if (!widget.showTrailingIcon && !widget.showChevron) {
          return const SizedBox.shrink();
        }
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.showTrailingIcon && widget.trailingIcon != MayFieldTrailingIcon.none)
              Padding(
                padding: const EdgeInsets.only(left: AppSpacingV2.sm),
                child: _buildTrailingIcon(placeholderColor),
              ),
            if (widget.showChevron)
              Padding(
                padding: const EdgeInsets.only(left: DimensV2.d12),
                child: _FieldChevron(color: placeholderColor),
              ),
          ],
        );
      case CommonTextFieldVariant.textArea:
        return const SizedBox.shrink();
    }
  }

  Widget _buildTrailingIcon(Color color) {
    if (widget.swapIcon != null) return widget.swapIcon!;
    if (widget.trailingIcon == MayFieldTrailingIcon.calendar) {
      return SvgPicture.asset(
        $AssetsIconsGen().icCalendar.path,
        package: 'may_uikit',
        width: DimensV2.d16,
        height: DimensV2.d16,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      );
    }
    return const SizedBox.shrink();
  }
}

// ===========================================================================
// Private content / affordance widgets.
// ===========================================================================

/// Renders the inner content for any [CommonTextFieldVariant].
///
/// Owns the label + (placeholder | EditableText | display Text) layout.
/// The container, padding, and hint message live on [CommonTextField].
class _FieldContent extends StatelessWidget {
  const _FieldContent({
    required this.variant,
    required this.decoration,
    required this.controller,
    required this.focusNode,
    required this.state,
    required this.isActive,
    required this.label,
    required this.placeholder,
    required this.textStyle,
    required this.placeholderStyle,
    required this.showLabel,
    required this.isEnabled,
    required this.isReadOnly,
    required this.keyboardType,
    required this.textInputAction,
    required this.minLines,
    required this.maxLines,
    required this.obscureText,
    required this.autofocus,
    required this.displayValue,
    required this.onChanged,
    required this.onSubmitted,
    required this.isSearch,
  });

  final CommonTextFieldVariant variant;
  final FieldDecoration decoration;
  final TextEditingController? controller;
  final FocusNode focusNode;
  final MayFieldState state;
  final bool isActive;
  final String? label;
  final String? placeholder;
  final TextStyle? textStyle;
  final TextStyle? placeholderStyle;
  final bool showLabel;
  final bool isEnabled;
  final bool isReadOnly;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final int minLines;
  final int maxLines;
  final bool obscureText;
  final bool autofocus;
  final String? displayValue;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (showLabel) ...[
          Text(
            label ?? '',
            style: FieldTextStyles.label.copyWith(color: decoration.labelColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (decoration.interiorGap > 0) const SizedBox(height: AppSpacingV2.x2s),
        ],
        _buildInner(),
      ],
    );
  }

  Widget _buildInner() {
    switch (variant) {
      case CommonTextFieldVariant.input:
        return _buildInputInner();
      case CommonTextFieldVariant.dropdown:
        return _buildDropdownInner();
      case CommonTextFieldVariant.textArea:
        return _buildTextAreaInner();
    }
  }

  Widget _buildInputInner() {
    final valueStyle = _valueStyle;
    final resolvedPlaceholderStyle = _placeholderStyle;

    return TextField(
      controller: controller!,
      focusNode: focusNode,
      readOnly: isReadOnly || !isEnabled,
      autofocus: autofocus,
      obscureText: obscureText,
      maxLines: 1,
      minLines: 1,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      cursorColor: decoration.valueColor,
      cursorWidth: DimensV2.d2,
      cursorRadius: const Radius.circular(DimensV2.d10),
      cursorHeight: DimensV2.d20,
      enableInteractiveSelection: isEnabled,
      style: valueStyle,
      decoration: InputDecoration(
        filled: false,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        isCollapsed: true,
        contentPadding: EdgeInsets.zero,
        hintText: (placeholder?.isNotEmpty ?? false) ? placeholder : null,
        hintStyle: resolvedPlaceholderStyle,
      ),
    );
  }

  Widget _buildDropdownInner() {
    final hasValue = (displayValue ?? '').isNotEmpty;
    final style = hasValue ? _valueStyle : _placeholderStyle;
    return Text(
      hasValue ? displayValue! : (placeholder ?? ''),
      style: style,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildTextAreaInner() {
    final valueStyle = _valueStyle;
    final resolvedPlaceholderStyle = _placeholderStyle;

    return TextField(
      controller: controller!,
      focusNode: focusNode,
      readOnly: isReadOnly || !isEnabled,
      autofocus: autofocus,
      enableSuggestions: true,
      autocorrect: true,
      obscureText: false,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      cursorColor: decoration.valueColor,
      cursorWidth: DimensV2.d2,
      cursorRadius: const Radius.circular(DimensV2.d100),
      cursorHeight: DimensV2.d20,
      enableInteractiveSelection: isEnabled,
      style: valueStyle,
      decoration: InputDecoration(
        filled: false,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        isCollapsed: true,
        contentPadding: EdgeInsets.zero,
        hintText: (placeholder?.isNotEmpty ?? false) ? placeholder : null,
        hintStyle: resolvedPlaceholderStyle,
      ),
    );
  }

  TextStyle get _valueStyle =>
      (textStyle ?? FieldTextStyles.value).copyWith(color: decoration.valueColor);

  TextStyle get _placeholderStyle =>
      (placeholderStyle ?? FieldTextStyles.value).copyWith(color: decoration.placeholderColor);
}

/// Renders the hint or error message beneath a field.
class _FieldHintMessage extends StatelessWidget {
  const _FieldHintMessage({
    required this.message,
    required this.isError,
    required this.color,
  });

  final String message;
  final bool isError;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            message,
            style: FieldTextStyles.hint.copyWith(color: color),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

/// Renders the X (clear) button for an active filled input.
class _FieldClearButton extends StatelessWidget {
  const _FieldClearButton({required this.onTap, required this.color});

  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Clear',
      button: true,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: SizedBox(
          width: DimensV2.d16,
          height: DimensV2.d16,
          child: SvgPicture.asset(
            $AssetsIconsGen().icClear.path,
            package: 'may_uikit',
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}

/// Renders the dropdown chevron (arrow rotated 90°).
class _FieldChevron extends StatelessWidget {
  const _FieldChevron({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      $AssetsIconsGen().icArrowDown.path,
      package: 'may_uikit',
      width: DimensV2.d20,
      height: DimensV2.d20,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}

// Hint SystemChannels reference so analyzer does not flag the import as
// unused on hosts that strip the editing-toolbar APIs.
// ignore: unused_element
void _touchUnused() => SystemChannels.textInput;
