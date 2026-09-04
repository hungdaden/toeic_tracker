import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Color Picker Card',
  type: AppColorPickerCardV2,
)
/// Builds the interactive [AppColorPickerCardV2] playground.
Widget appColorPickerCardUseCase(BuildContext context) {
  final colors = context.mayColors;
  final title = context.knobs.string(
    label: 'Title',
    initialValue: 'Màu ứng dụng',
  );

  return _AppearancePickerScaffold(
    backgroundColor: colors.background,
    child: _AppColorPickerCardDemo(title: title),
  );
}

@UseCase(
  name: 'Theme Picker Card',
  type: AppThemePickerCardV2,
)
/// Builds the interactive [AppThemePickerCardV2] playground.
Widget appThemePickerCardUseCase(BuildContext context) {
  final colors = context.mayColors;
  final title = context.knobs.string(
    label: 'Title',
    initialValue: 'Giao diện',
  );
  final colorId = context.knobs.object.dropdown<AppColorId>(
    label: 'Color ID',
    options: AppColorId.values,
    initialOption: AppColorId.green,
  );

  return _AppearancePickerScaffold(
    backgroundColor: colors.background,
    child: _AppThemePickerCardDemo(
      title: title,
      colorId: colorId,
    ),
  );
}

@UseCase(
  name: 'Gallery',
  type: AppColorPickerCardV2,
)
/// Builds the app appearance picker card gallery.
Widget appAppearancePickersGalleryUseCase(BuildContext context) {
  final colors = context.mayColors;

  return _AppearancePickerScaffold(
    backgroundColor: colors.background,
    child: const _AppAppearancePickersGallery(),
  );
}

class _AppColorPickerCardDemo extends StatefulWidget {
  const _AppColorPickerCardDemo({
    required this.title,
  });

  final String title;

  /// Creates state that stores the selected app color.
  @override
  State<_AppColorPickerCardDemo> createState() => _AppColorPickerCardDemoState();
}

class _AppColorPickerCardDemoState extends State<_AppColorPickerCardDemo> {
  AppColorId _selectedId = AppColorId.green;

  /// Builds the color picker card demo.
  @override
  Widget build(BuildContext context) {
    return AppColorPickerCardV2(
      title: widget.title,
      selectedId: _selectedId,
      onSelected: (id) => setState(() => _selectedId = id),
    );
  }
}

class _AppThemePickerCardDemo extends StatefulWidget {
  const _AppThemePickerCardDemo({
    required this.title,
    required this.colorId,
  });

  final String title;
  final AppColorId colorId;

  /// Creates state that stores the selected app theme mode.
  @override
  State<_AppThemePickerCardDemo> createState() => _AppThemePickerCardDemoState();
}

class _AppThemePickerCardDemoState extends State<_AppThemePickerCardDemo> {
  AppThemeMode _selectedMode = AppThemeMode.light;

  /// Builds the theme picker card demo.
  @override
  Widget build(BuildContext context) {
    return AppThemePickerCardV2(
      title: widget.title,
      selectedMode: _selectedMode,
      colorId: widget.colorId,
      onModeSelected: (mode) => setState(() => _selectedMode = mode),
    );
  }
}

class _AppAppearancePickersGallery extends StatefulWidget {
  const _AppAppearancePickersGallery();

  /// Creates state that stores gallery selections.
  @override
  State<_AppAppearancePickersGallery> createState() => _AppAppearancePickersGalleryState();
}

class _AppAppearancePickersGalleryState extends State<_AppAppearancePickersGallery> {
  AppColorId _selectedColorId = AppColorId.green;
  AppThemeMode _selectedThemeMode = AppThemeMode.light;

  /// Builds both app appearance picker cards.
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppColorPickerCardV2(
          title: 'Màu ứng dụng',
          selectedId: _selectedColorId,
          onSelected: (id) => setState(() => _selectedColorId = id),
        ),
        const SizedBox(height: AppSpacingV2.x2l),
        AppThemePickerCardV2(
          title: 'Giao diện',
          selectedMode: _selectedThemeMode,
          colorId: _selectedColorId,
          onModeSelected: (mode) => setState(() => _selectedThemeMode = mode),
        ),
      ],
    );
  }
}

class _AppearancePickerScaffold extends StatelessWidget {
  const _AppearancePickerScaffold({
    required this.child,
    required this.backgroundColor,
  });

  final Widget child;
  final Color backgroundColor;

  /// Builds the constrained Widgetbook preview shell.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacingV2.xl),
          child: SizedBox(
            width: 359,
            child: child,
          ),
        ),
      ),
    );
  }
}
