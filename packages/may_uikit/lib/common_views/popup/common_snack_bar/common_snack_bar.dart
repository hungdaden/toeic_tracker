import 'package:flutter/material.dart';

import '../../../resources/generated/assets.gen.dart';
import '../../../resources/radius.dart';
import '../../../resources/styles/app_color.dart';
import '../../../resources/styles/app_text_style.dart';
import '../../../utils/extenstion.dart';
import '../../common_text/common_text.dart';
import '../base_popup.dart';

/// Snack bar component that mirrors the design system states and supports
/// configurable title/message content with dismiss handling.
class CommonSnackBarV2 extends BasePopupV2 {
  const CommonSnackBarV2._({
    super.key,
    required super.popupId,
    required this.message,
    required this.backgroundColor,
  });

  /// Creates a success snack bar using the success color palette.
  factory CommonSnackBarV2.success({
    Key? key,
    required String message,
  }) {
    return CommonSnackBarV2._(
      popupId: 'CommonSnackBarV2.success_$message'.hardcoded,
      key: key,
      message: message,
      backgroundColor: AppColorsV2.semanticSuccess600,
    );
  }

  factory CommonSnackBarV2.info({
    Key? key,
    required String message,
  }) {
    return CommonSnackBarV2._(
      popupId: 'CommonSnackBarV2.info_$message'.hardcoded,
      key: key,
      message: message,
      backgroundColor: AppColorsV2.primaryText900,
    );
  }

  /// Creates an error snack bar using the error color palette.
  factory CommonSnackBarV2.error({
    Key? key,
    required String message,
  }) {
    return CommonSnackBarV2._(
      popupId: 'CommonSnackBarV2.error_$message'.hardcoded,
      key: key,
      message: message,
      backgroundColor: AppColorsV2.criticalColor,
    );
  }

  final String message;
  final Color backgroundColor;

  @override
  Widget buildPopup(BuildContext context) {
    return SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: backgroundColor,
      content: Material(
        color: AppColorsV2.transparent,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(AppRadiusV2.lg),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: _buildTexts()),
              const SizedBox(width: 12),
              _buildCloseButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTexts() {
    return CommonTextV2(
      message,
      style: AppTextStylesV2.bodyRegular.copyWith(
        color: AppColorsV2.genericWhite,
      ),
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.maybeOf(context)?.hideCurrentSnackBar();
      },
      child: Assets.icons.iconClose.svg(
        width: 24,
        height: 24,
        colorFilter: const ColorFilter.mode(
          AppColorsV2.genericWhite,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
