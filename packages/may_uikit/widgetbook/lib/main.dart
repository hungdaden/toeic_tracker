import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import 'main.directories.g.dart';
import 'widgetbook_widget.dart';

/// Starts the May UI Kit widgetbook app.
void main() {
  runApp(const MayUikitWidgetbook());
}

/// Root widget for May UI Kit widgetbook.
@App()
class MayUikitWidgetbook extends StatelessWidget {
  /// Creates the May UI Kit widgetbook root.
  const MayUikitWidgetbook({super.key});

  /// Builds widgetbook with May UI Kit themes and component directories.
  @override
  Widget build(BuildContext context) {
    return WidgetbookCustom.material(
      addons: [
        mayUikitThemeAddon(),
        ViewportAddon(
          Viewports.all,
        ),
      ],
      directories: directories,
    );
  }
}
