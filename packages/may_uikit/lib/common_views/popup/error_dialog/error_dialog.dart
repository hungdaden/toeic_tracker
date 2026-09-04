import 'package:flutter/material.dart';

import '../../../resources/generated/l10n.dart';
import '../../../utils/extenstion.dart';
import '../../common_text/common_text.dart';
import '../base_popup.dart';

/// Error dialog that can optionally expose a retry action.
class ErrorDialogV2 extends BasePopupV2 {
  const ErrorDialogV2._({
    super.key,
    required super.popupId,
    required this.message,
    this.onRetryPressed,
  });

  /// Factory constructor for simple error dialog with OK button only
  factory ErrorDialogV2.error({
    Key? key,
    required String message,
  }) {
    return ErrorDialogV2._(
      key: key,
      popupId: 'ErrorDialogV2.error_$message'.hardcoded,
      message: message,
    );
  }

  /// Factory constructor for error dialog with Retry button
  factory ErrorDialogV2.errorWithRetry({
    Key? key,
    required String message,
    required VoidCallback onRetryPressed,
  }) {
    return ErrorDialogV2._(
      key: key,
      popupId: 'ErrorDialogV2.errorWithRetry_$message'.hardcoded,
      message: message,
      onRetryPressed: onRetryPressed,
    );
  }

  final String message;
  final VoidCallback? onRetryPressed;

  bool get _hasRetry => onRetryPressed != null;

  @override
  Widget buildPopup(BuildContext context) {
    return AlertDialog.adaptive(
      actions: [
        if (_hasRetry)
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: CommonTextV2(
              S.current.cancel,
              style: null,
            ),
          ),
        TextButton(
          onPressed: _hasRetry
              ? () {
                  Navigator.of(context).pop();
                  onRetryPressed?.call();
                }
              : () => Navigator.of(context).pop(),
          child: CommonTextV2(
            _hasRetry ? S.current.retry : S.current.ok,
            style: null,
          ),
        ),
      ],
      content: CommonTextV2(
        message,
        style: null,
      ),
    );
  }
}
