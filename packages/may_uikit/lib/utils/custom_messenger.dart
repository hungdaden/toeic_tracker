import 'package:flutter/material.dart';

import '../may_uikit.dart';

class CustomMessenger {
  CustomMessenger._({
    required this.context,
  });

  factory CustomMessenger.of(BuildContext context) => CustomMessenger._(context: context);
  BuildContext context;

  /// Regular snackbar.
  void snackbar(
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // put it above the keyboard
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        closeIconColor: AppColorsV2.genericWhite,
        content: Text(message),
        dismissDirection: DismissDirection.startToEnd,
      ),
    );
  }

  /// Snackbar with action and icon.
  void snackbarWithAction(
    String message, {
    required String actionLabel,
    required VoidCallback action,
    Widget? child,
    TextStyle? contentStyle,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // put it above the keyboard
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        closeIconColor: AppColorsV2.genericWhite,
        content: child ??
            Text(
              message,
              style: contentStyle,
            ),
        dismissDirection: DismissDirection.startToEnd,
        action: SnackBarAction(
          label: actionLabel,
          onPressed: action,
        ),
      ),
    );
  }

  /// Regular toast.
  void toast(
    String message, {
    required BuildContext context,
    Duration duration = const Duration(seconds: 3),
    ToastType type = ToastType.info,
  }) {
    showCustomToast(
      message,
      context: context,
      duration: duration,
      type: type,
    );
  }

  void showCustomToash(
    String message, {
    required BuildContext context,
    Duration duration = const Duration(seconds: 3),
    ToastType type = ToastType.info,
    double? top,
    double? bottom,
  }) {
    final overlay = Overlay.maybeOf(context);
    if (overlay == null) return;

    final overlayEntry = OverlayEntry(
      builder: (context) {
        final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
        final targetBottom = keyboardHeight + DimensV2.d16;
        final defaultBottom =
            targetBottom > DimensV2.d64 ? targetBottom : DimensV2.d64;

        Color backgroundColor;
        Color textColor;

        switch (type) {
          case ToastType.success:
            backgroundColor = context.mayColors.bgToastMsgDefault;
            textColor = context.mayColors.txToastMsgDefault;
            break;
          case ToastType.error:
            backgroundColor = AppColorsV2.criticalColor;
            textColor = AppColorsV2.genericWhite;
            break;
          case ToastType.info:
            backgroundColor = AppColorsV2.primaryText900;
            textColor = AppColorsV2.genericWhite;
            break;
        }

        return Positioned(
          top: (bottom == null && top != null) ? top : null,
          bottom: bottom ?? (top == null ? defaultBottom : null),
          left: DimensV2.d17,
          right: DimensV2.d17,
          child: Center(
            // 👈 căn giữa ngang
            child: Material(
              color: AppColorsV2.transparent,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: DimensV2.d12,
                  vertical: DimensV2.d8,
                ),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(AppRadiusV2.md),
                ),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: AppTextStylesV2.labelSemiBold.copyWith(color: textColor),
                ),
              ),
            ),
          ),
        );
      },
    );

    overlay.insert(overlayEntry);

    Future.delayed(duration).then((_) {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });
  }

  ///
  void showCustomToast(
    String message, {
    required BuildContext context,
    Duration duration = const Duration(seconds: 3),
    ToastType type = ToastType.info,
    double? top,
    double? bottom,
  }) =>
      showCustomToash(
        message,
        context: context,
        duration: duration,
        type: type,
        top: top,
        bottom: bottom,
      );
}

/// Default black background with white text is "info" type.
enum ToastType {
  success,
  error,
  info,
}
