// ignore_for_file: unused_element_parameter

import 'package:flutter/material.dart';

import '../../../resources/generated/l10n.dart';
import '../../../resources/styles/app_color.dart';
import '../../../resources/styles/app_text_style.dart';
import '../../common_text/common_text.dart';
import '../base_popup.dart';

/// Confirmation dialog with optional confirm and cancel callbacks.
class ConfirmDialogV2 extends BasePopupV2 {
  const ConfirmDialogV2({
    super.key,
    required this.message,
    this.onConfirm,
    this.onCancel,
    this.confirmButtonText,
    this.cancelButtonText,
  }) : super(popupId: 'ConfirmDialog_$message');

  final String message;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final String? confirmButtonText;
  final String? cancelButtonText;

  factory ConfirmDialogV2.deleteAccount({
    required VoidCallback doOnConfirm,
  }) {
    return ConfirmDialogV2(
      message: S.current.deleteAccountConfirm,
      onConfirm: doOnConfirm,
    );
  }

  factory ConfirmDialogV2.logOut({
    required VoidCallback doOnConfirm,
  }) {
    return ConfirmDialogV2(
      message: S.current.logoutConfirm,
      onConfirm: doOnConfirm,
    );
  }

  @override
  Widget buildPopup(BuildContext context) {
    return AlertDialog.adaptive(
      title: CommonTextV2(
        message,
        style: AppTextStylesV2.bodyRegular.copyWith(
          color: AppColorsV2.genericBlack,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
            onCancel?.call();
          },
          child: CommonTextV2(cancelButtonText ?? S.current.cancel, style: null),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
            onConfirm?.call();
          },
          child: CommonTextV2(confirmButtonText ?? S.current.ok, style: null),
        ),
      ],
    );
  }
}
