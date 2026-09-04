import 'package:flutter/material.dart';

import '../../resources/app_dimen.dart';
import '../../resources/generated/assets.gen.dart';
import '../../themes/main_theme.dart';

/// The unified background of [CommonAppBarV2].
///
/// Paints the entire screen in `greenTheme700` and overlays the
/// `imgBackground` pattern on the top 34% so the background extends
/// edge-to-edge instead of being limited to the app bar height.
class HeaderColorCurtainRevealV2 extends StatelessWidget {
  const HeaderColorCurtainRevealV2({super.key});

  @override
  Widget build(BuildContext context) {
    final patternHeight = AppDimenV2.of(context).screenHeight * 0.34;

    return SizedBox.expand(
      child: Stack(
        fit: StackFit.expand,
        children: [
          ColoredBox(color: context.mayColors.bgDefault),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: double.infinity,
              height: patternHeight,
              child: Assets.images.imgBg.image(
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
