import 'package:flutter/material.dart';

import '../../../resources/generated/assets.gen.dart';
import '../../../resources/generated/l10n.dart';
import '../../../resources/styles/app_color.dart';
import '../../../resources/styles/app_text_style.dart';
import '../../common_scaffold/common_scaffold.dart';
import '../../common_text/common_text.dart';
import '../base_popup.dart';

/// Full-screen maintenance dialog used when the app is temporarily unavailable.
class MaintenanceModeDialogV2 extends BasePopupV2 {
  const MaintenanceModeDialogV2({
    super.key,
    required this.message,
  }) : super(popupId: 'MaintenanceModeDialogV2');

  final String message;

  @override
  Widget buildPopup(BuildContext context) {
    return CommonScaffoldV2(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Align(
            //   alignment: Alignment.topCenter,
            //   child: Assets.images.imageAppIcon.image(
            //     width: 128,
            //     height: 128,
            //   ),
            // ),
            const SizedBox(height: 32),
            CommonTextV2(
              S.current.maintenanceTitle,
              style: AppTextStylesV2.title16SemiBold.copyWith(
                color: AppColorsV2.genericBlack,
              ),
            ),
            const SizedBox(height: 8),
            CommonTextV2(
              message,
              style: AppTextStylesV2.bodyRegular.copyWith(
                color: AppColorsV2.genericBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
