import 'package:flutter/material.dart';

import '../../may_uikit.dart';

/// Shared divider widget for horizontal and vertical separators.
class CommonDividerV2 extends StatelessWidget {
  const CommonDividerV2({
    super.key,
    this.direction = DividerDirection.horizontal,
    this.dividerColor = AppColorsV2.neutral200,
    this.thickness = DimensV2.d_05,
    this.indent,
    this.endIndent,
  });

  final DividerDirection direction;
  final Color? dividerColor;
  final double? thickness;
  final double? indent;
  final double? endIndent;

  @override
  Widget build(BuildContext context) {
    return direction == DividerDirection.horizontal
        ? SizedBox(
            height: 1,
            // ignore: prefer_common_widgets
            child: Divider(
              thickness: thickness,
              color: dividerColor,
              indent: indent,
              endIndent: endIndent,
            ),
          )
        : SizedBox(
            width: 1,
            // ignore: prefer_common_widgets
            child: VerticalDivider(
              thickness: thickness,
              color: dividerColor,
              indent: indent,
              endIndent: endIndent,
            ),
          );
  }
}

/// Divider orientation options for [CommonDividerV2].
enum DividerDirection {
  vertical,
  horizontal,
}
