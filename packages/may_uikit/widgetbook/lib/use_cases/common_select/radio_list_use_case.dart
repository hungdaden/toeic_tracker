import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// Interactive playground for [RadioListV2] built on top of
/// [PressableCardContainerV2].
@UseCase(
  name: 'Playground',
  type: RadioListV2,
)

/// Builds the interactive playground for [RadioListV2], exposing the
/// loading, height, and initial-selection knobs.
Widget radioListV2UseCase(BuildContext context) {
  final colors = context.mayColors;
  final isLoading = context.knobs.boolean(
    label: 'Loading',
    initialValue: false,
  );
  final equalizeElementHeight = context.knobs.boolean(
    label: 'Equalize Element Height',
    initialValue: false,
  );
  final elementMinHeight = context.knobs.double.slider(
    label: 'Element Min Height',
    initialValue: DimensV2.d50,
    min: DimensV2.d40,
    max: DimensV2.d96,
  );
  final initialSelection = context.knobs.object.dropdown<int>(
    label: 'Initial Selection',
    options: const [0, 1, 2],
    initialOption: 0,
  );

  final options = <String>['Toán', 'Tiếng Việt', 'Tiếng Anh'];

  return Scaffold(
    backgroundColor: colors.background,
    body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacingV2.xl),
        child: _RadioListStateHost(
          initialIndex: initialSelection,
          isLoading: isLoading,
          equalizeElementHeight: equalizeElementHeight,
          elementMinHeight: elementMinHeight,
          options: options,
        ),
      ),
    ),
  );
}

/// Gallery use case that showcases [RadioListV2] in common states.
@UseCase(
  name: 'Gallery',
  type: RadioListV2,
)

/// Builds the gallery view for [RadioListV2] showing default selection,
/// empty selection, and equalized-height variants.
Widget radioListV2GalleryUseCase(BuildContext context) {
  final colors = context.mayColors;
  final options = <String>['Toán', 'Tiếng Việt', 'Tiếng Anh'];

  /// Renders a labeled gallery section: a bold [label] header followed by
  /// [child] with the standard gallery spacing.
  Widget section({required String label, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacingV2.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacingV2.lg,
              vertical: AppSpacingV2.sm,
            ),
            child: Text(
              label,
              style: AppTextStylesV2.bodySemiBold.copyWith(
                color: colors.primaryText,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }

  return Scaffold(
    backgroundColor: colors.background,
    body: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacingV2.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          section(
            label: 'Single selection (default)',
            child: _RadioListStateHost(
              initialIndex: 0,
              options: options,
            ),
          ),
          section(
            label: 'No selection',
            child: _RadioListStateHost(
              initialIndex: null,
              options: options,
            ),
          ),
          section(
            label: 'Equalized element height',
            child: _RadioListStateHost(
              initialIndex: 1,
              equalizeElementHeight: true,
              options: [
                ...options,
                'Khoa học tự nhiên với mô tả dài hơn một chút',
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

/// Stateful host that owns the currently selected index and forwards it to
/// [RadioListV2] so taps in widgetbook can switch the active item.
class _RadioListStateHost extends StatefulWidget {
  const _RadioListStateHost({
    required this.options,
    this.initialIndex,
    this.isLoading = false,
    this.equalizeElementHeight = false,
    this.elementMinHeight = DimensV2.d50,
  });

  final List<String> options;
  final int? initialIndex;
  final bool isLoading;
  final bool equalizeElementHeight;
  final double elementMinHeight;

  /// Creates the mutable state that owns the currently selected index.
  @override
  State<_RadioListStateHost> createState() => _RadioListStateHostState();
}

class _RadioListStateHostState extends State<_RadioListStateHost> {
  late int? _selectedIndex;

  /// Seeds the selected index from [widget.initialIndex] on first build.
  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  /// Resyncs the local selection when widgetbook changes [widget.initialIndex]
  /// via its knobs.
  @override
  void didUpdateWidget(covariant _RadioListStateHost oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialIndex != widget.initialIndex) {
      _selectedIndex = widget.initialIndex;
    }
  }

  /// Builds the [RadioListV2] instance and forwards taps so the local
  /// selection tracks user input.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    return RadioListV2(
      selectedIndex: _selectedIndex,
      elements: widget.options,
      isLoading: widget.isLoading,
      equalizeElementHeight: widget.equalizeElementHeight,
      elementMinHeight: widget.elementMinHeight,
      elementWidget: (option) => Text(
        option,
        style: AppTextStylesV2.bodySemiBold.copyWith(
          color: colors.primaryText,
        ),
      ),
      onSelect: (value) {
        final newIndex = widget.options.indexOf(value);
        if (newIndex < 0) return;
        setState(() => _selectedIndex = newIndex);
      },
    );
  }
}
