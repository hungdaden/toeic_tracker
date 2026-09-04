import 'dart:io';

import 'package:dartx/dartx.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';

import '../../../resources/generated/l10n.dart';

/// Hiển thị một Bottom Sheet bo góc tròn dạng Modal.
///
/// Các tham số:
/// * [context]: BuildContext của ứng dụng.
/// * [child]: Widget nội dung chính.
/// * [childFuction]: Hàm khởi tạo Widget nội dung chính thay thế cho [child].
/// * [childBuilder]: Hàm builder tùy chỉnh bao quanh widget nội dung.
/// * [height]: Chiều cao cố định của bottom sheet.
/// * [hasShadow]: Có đổ bóng cho bottom sheet hay không. Mặc định là false.
/// * [circularBorderRadius]: Bán kính bo góc.
///   Mặc định là [DimensV2.d28] (28px) theo Figma.
/// * [syncBottomCircularBorderRadius]: Bo tròn cả hai góc bên dưới
///   (tạo hiệu ứng floating card). Mặc định là true.
/// * [padding]: Khoảng đệm bên trong.
/// * [border]: Viền xung quanh bottom sheet.
/// * [backgroundColor]: Màu nền. Mặc định là [AppColorsV2.genericWhite].
/// * [mainAxisSize]: Kích thước chính.
/// * [margin]: Khoảng cách bên ngoài.
///   Mặc định là cách hai bên 12px và đáy 20px (floating).
/// * [constraint]: Ràng buộc kích thước của bottom sheet.
/// * [bottomSheet]: Widget đính kèm ở dưới cùng
///   (ví dụ: thanh home indicator hoặc các nút).
/// * [onDismiss]: Callback được gọi khi đóng bottom sheet.
/// * [confirmLabel]: Nhãn của nút xác nhận.
/// * [onConfirm]: Callback khi nhấn nút xác nhận.
///   Nếu truyền thì nút xác nhận mới hiển thị.
/// * [isConfirmEnabled]: Trạng thái bật/tắt của nút xác nhận. Mặc định là true.
/// * [cancelLabel]: Nhãn của nút hủy/đóng.
/// * [onCancel]: Callback khi nhấn nút hủy/đóng.
///   Nếu truyền thì nút hủy/đóng mới hiển thị.
Future<T?> showRoundBottomSheetV2<T>({
  required BuildContext context,
  Widget? child,

  /// Hàm khởi tạo Widget nội dung chính thay thế cho [child].
  Widget Function()? childFuction,

  /// Hàm builder tùy chỉnh bao quanh widget nội dung.
  Widget Function(Widget Function())? childBuilder,
  double? height,
  bool hasShadow = false,
  double circularBorderRadius = DimensV2.d28,
  bool syncBottomCircularBorderRadius = true,
  EdgeInsetsGeometry? padding,
  Border? border,
  Color? backgroundColor = AppColorsV2.genericWhite,
  MainAxisSize? mainAxisSize,
  EdgeInsetsGeometry? margin,
  BoxConstraints? constraint,
  Widget? bottomSheet = const SizedBox.shrink(),

  /// Callback được gọi khi đóng bottom sheet.
  void Function()? onDismiss,
  String? confirmLabel,
  VoidCallback? onConfirm,
  ValueNotifier<bool>? isConfirmEnabled,
  ValueNotifier<bool>? isConfirmLoading,
  bool showConfirmButton = false,
  String? cancelLabel,
  VoidCallback? onCancel,
}) {
  assert([child, childFuction].whereNotNull().isNotEmpty);
  final mediaQuery = MediaQuery.maybeOf(context);
  final size = mediaQuery?.size;

  final hasActions = (onConfirm != null && showConfirmButton) || onCancel != null;

  Widget? actionButtonsWidget;
  if (hasActions) {
    actionButtonsWidget = Padding(
      padding: const EdgeInsets.all(AppSpacingV2.lg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (onConfirm != null && showConfirmButton) ...[
            isConfirmEnabled != null
                ? ValueListenableBuilder<bool>(
                    valueListenable: isConfirmEnabled,
                    builder: (context, enabled, child) {
                      return isConfirmLoading != null
                          ? ValueListenableBuilder<bool>(
                              valueListenable: isConfirmLoading,
                              builder: (context, loading, child) {
                                return CommonButtonV2(
                                  label: confirmLabel ?? S.current.actionConfirm,
                                  isEnabled: enabled && !loading,
                                  loading: loading,
                                  variant: CommonButtonVariant.primary,
                                  size: CommonButtonSize.large,
                                  onTap: onConfirm,
                                );
                              },
                            )
                          : CommonButtonV2(
                              label: confirmLabel ?? S.current.actionConfirm,
                              isEnabled: enabled,
                              variant: CommonButtonVariant.primary,
                              size: CommonButtonSize.large,
                              onTap: onConfirm,
                            );
                    },
                  )
                : (isConfirmLoading != null
                    ? ValueListenableBuilder<bool>(
                        valueListenable: isConfirmLoading,
                        builder: (context, loading, child) {
                          return CommonButtonV2(
                            label: confirmLabel ?? S.current.actionConfirm,
                            isEnabled: !loading,
                            loading: loading,
                            variant: CommonButtonVariant.primary,
                            size: CommonButtonSize.large,
                            onTap: onConfirm,
                          );
                        },
                      )
                    : CommonButtonV2(
                        label: confirmLabel ?? S.current.actionConfirm,
                        isEnabled: true,
                        variant: CommonButtonVariant.primary,
                        size: CommonButtonSize.large,
                        onTap: onConfirm,
                      )),
            if (onCancel != null) const SizedBox(height: AppSpacingV2.xs),
          ],
          if (onCancel != null)
            CommonButtonV2(
              label: cancelLabel ?? S.current.actionClose,
              variant: CommonButtonVariant.textOnly,
              size: CommonButtonSize.large,
              onTap: onCancel,
            ),
        ],
      ),
    );
  }

  /// Hàm builder xây dựng giao diện nội dung cho bottom sheet.
  Widget builder() {
    return Builder(
      builder: (innerContext) {
        return RoundUpperCornerContainerV2(
          height: height,
          hasShadow: hasShadow,
          circularBorderRadius: circularBorderRadius,
          syncBottomCircularBorderRadius: syncBottomCircularBorderRadius,
          padding: padding,
          border: border,
          backgroundColor: backgroundColor,
          mainAxisSize: mainAxisSize,
          margin: margin ??
              EdgeInsets.all(DimensV2.d12).copyWith(
                  bottom: ((!kIsWeb && Platform.isIOS) ||
                          AppDimenV2.of(innerContext).keyboardHeight > 0)
                      ? DimensV2.d24
                      : (MediaQuery.viewPaddingOf(innerContext).bottom > 0
                          ? MediaQuery.viewPaddingOf(innerContext).bottom + DimensV2.d12
                          : DimensV2.d24)),
          constraint: constraint ??
              BoxConstraints(
                maxWidth: size?.width ?? double.infinity,
                maxHeight: (size?.height ?? double.infinity) * 0.8,
                minHeight: 0,
              ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              childFuction?.call() ?? child ?? const SizedBox.shrink(),
              if (actionButtonsWidget != null) actionButtonsWidget,
              bottomSheet == null
                  ? Container()
                  : Container(
                      margin: const EdgeInsets.only(
                        bottom: DimensV2.d0,
                      ),
                      child: bottomSheet,
                    ),
            ],
          ),
        );
      },
    );
  }

  final callerTheme = Theme.of(context);
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColorsV2.transparent,
    routeSettings: const RouteSettings(name: 'RoundBottomSheetV2'),
    builder: (BuildContext modalContext) => Theme(
      data: callerTheme,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(modalContext).viewInsets.bottom,
        ),
        child: childBuilder?.call(builder) ?? builder(),
      ),
    ),
  ).whenComplete(() => onDismiss?.call());
}
