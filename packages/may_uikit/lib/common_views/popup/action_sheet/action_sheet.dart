import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit_internal.dart';

/// Các loại hành động có thể hiển thị trong [MayActionSheet].
enum MayActionSheetActionTypeV2 {
  confirm,
  cancelConfirm(isDestructive: true),
  edit,
  share,
  delete(isDestructive: true),
  logout(isDestructive: true),
  close,
  understand,
  /// Đưa người dùng sang phần cài đặt hệ thống của ứng dụng.
  ///
  /// Dùng khi một quyền đã bị từ chối và chỉ có thể cấp lại thủ công.
  settings;

  const MayActionSheetActionTypeV2({
    this.isDestructive = false,
  });

  final bool isDestructive;

  String get title {
    switch (this) {
      case MayActionSheetActionTypeV2.confirm:
        return S.current.actionConfirm;
      case MayActionSheetActionTypeV2.cancelConfirm:
        return S.current.actionConfirm;
      case MayActionSheetActionTypeV2.edit:
        return S.current.actionEdit;
      case MayActionSheetActionTypeV2.share:
        return S.current.actionShare;
      case MayActionSheetActionTypeV2.delete:
        return S.current.actionDelete;
      case MayActionSheetActionTypeV2.logout:
        return S.current.actionLogout;
      case MayActionSheetActionTypeV2.close:
        return S.current.actionClose;
      case MayActionSheetActionTypeV2.understand:
        return S.current.actionUnderstand;
      case MayActionSheetActionTypeV2.settings:
        return S.current.actionSettings;
    }
  }
}

/// Callback được gọi khi người dùng chọn một hành động trong [MayActionSheet].
/// Tham số [type] là loại hành động được chọn.
typedef MayActionSheetActionCallback = void Function(MayActionSheetActionTypeV2 type);

/// Bottom sheet dạng action sheet theo phong cách iOS.
///
/// Hiển thị danh sách [actions] và tuỳ chọn [cancelAction] dưới dạng
/// các nút bấm trong một modal bottom sheet.
class MayActionSheet extends BasePopupV2 {
  const MayActionSheet({
    super.key,
    this.title,
    this.description,
    this.content,
    this.actions = const [
      MayActionSheetActionTypeV2.edit,
      MayActionSheetActionTypeV2.share,
      MayActionSheetActionTypeV2.delete,
    ],
    this.cancelAction = MayActionSheetActionTypeV2.close,
    this.onActionPressed,
    this.onActionEdit,
    this.onActionShare,
    this.onActionDelete,
    this.onActionLogout,
    this.onActionConfirm,
    this.onActionClose,
    this.onActionCancelConfirm,
    this.onActionSettings,
    this.showCancelAction = true,
    this.padding = const EdgeInsets.fromLTRB(
      AppSpacingV2.sm,
      AppSpacingV2.none,
      AppSpacingV2.sm,
      AppSpacingV2.md,
    ),
    this.sheetRadius = AppRadiusV2.x3l,
    this.backgroundColor,
    this.cancelBackgroundColor,
    this.dividerColor,
    this.actionTextStyle,
    this.titleTextStyle,
    this.descriptionTextStyle,
    this.cancelTextStyle,
  }) : super(popupId: 'MayActionSheet_${title ?? ''}_${actions.length}_$cancelAction');

  final String? title;
  final String? description;
  final Widget? content;
  final List<MayActionSheetActionTypeV2> actions;
  final MayActionSheetActionTypeV2 cancelAction;
  final MayActionSheetActionCallback? onActionPressed;
  final VoidCallback? onActionEdit;
  final VoidCallback? onActionShare;
  final VoidCallback? onActionDelete;
  final VoidCallback? onActionLogout;
  final VoidCallback? onActionConfirm;
  final VoidCallback? onActionClose;
  final VoidCallback? onActionCancelConfirm;

  /// Được gọi khi người dùng chọn hành động [MayActionSheetActionTypeV2.settings].
  final VoidCallback? onActionSettings;
  final bool showCancelAction;
  final EdgeInsetsGeometry padding;
  final double sheetRadius;
  final Color? backgroundColor;
  final Color? cancelBackgroundColor;
  final Color? dividerColor;
  final TextStyle? actionTextStyle;
  final TextStyle? titleTextStyle;
  final TextStyle? descriptionTextStyle;
  final TextStyle? cancelTextStyle;

  bool get _hasHeader => title != null || description != null || content != null;

  void _handleActionPressed(MayActionSheetActionTypeV2 type) {
    onActionPressed?.call(type);

    switch (type) {
      case MayActionSheetActionTypeV2.edit:
        onActionEdit?.call();
        break;
      case MayActionSheetActionTypeV2.share:
        onActionShare?.call();
        break;
      case MayActionSheetActionTypeV2.delete:
        onActionDelete?.call();
        break;
      case MayActionSheetActionTypeV2.logout:
        onActionLogout?.call();
        break;
      case MayActionSheetActionTypeV2.confirm:
        onActionConfirm?.call();
        break;
      case MayActionSheetActionTypeV2.close:
        onActionClose?.call();
        break;

      case MayActionSheetActionTypeV2.cancelConfirm:
        onActionCancelConfirm?.call();
        break;
      
      case MayActionSheetActionTypeV2.understand:
        // By default, understand acts like close
        onActionClose?.call();
        break;
      case MayActionSheetActionTypeV2.settings:
        onActionSettings?.call();
        break;
    }
  }

  @override

  /// Xây dựng nội dung popup bao gồm danh sách hành động và nút huỷ.
  Widget buildPopup(BuildContext context) {
    final colors = context.mayColors;
    final mediaQuery = MediaQuery.of(context);
    final bottomPadding = math.max(mediaQuery.padding.bottom, AppSpacingV2.md);

    return Padding(
      padding: padding.add(EdgeInsets.only(bottom: bottomPadding - AppSpacingV2.md)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(sheetRadius),
            child: Material(
              color: backgroundColor ?? colors.bgCard,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_hasHeader) _ActionSheetHeader(sheet: this),
                  for (var index = 0; index < actions.length; index++) ...[
                    if (_hasHeader || index > 0) CommonDividerV2(),
                    _ActionSheetRow(
                      action: actions[index],
                      onActionPressed: _handleActionPressed,
                      defaultTextStyle: actionTextStyle,
                    ),
                  ],
                ],
              ),
            ),
          ),
          if (showCancelAction) ...[
            const SizedBox(height: AppSpacingV2.xs + AppSpacingV2.x3s),
            ClipRRect(
              borderRadius: BorderRadius.circular(sheetRadius),
              child: Material(
                color: colors.bgCard,
                child: _CancelActionSheetRow(
                  action: cancelAction,
                  textStyle: cancelTextStyle,
                  onActionPressed: _handleActionPressed,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ActionSheetHeader extends StatelessWidget {
  const _ActionSheetHeader({required this.sheet});

  final MayActionSheet sheet;

  @override

  /// Xây dựng phần tiêu đề gồm [MayActionSheet.title], [MayActionSheet.description]
  /// và [MayActionSheet.content] nếu có.
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacingV2.x2l,
        AppSpacingV2.x2l,
        AppSpacingV2.x2l,
        AppSpacingV2.lg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (sheet.title != null)
            Text(
              sheet.title!,
              style: (sheet.titleTextStyle ?? AppTextStylesV2.title20SemiBold).copyWith(
                color: colors.txContentPrimaryDefault,
              ),
              textAlign: TextAlign.center,
            ),
          if (sheet.description != null) ...[
            const SizedBox(height: AppSpacingV2.sm),
            Text(
              sheet.description!,
              style: (sheet.descriptionTextStyle ?? AppTextStylesV2.text16Medium).copyWith(
                color: colors.txModalDescription,
              ),
              textAlign: TextAlign.center,
            ),
          ],
          if (sheet.content != null) ...[
            if (sheet.title != null || sheet.description != null)
              const SizedBox(height: AppSpacingV2.sm),
            sheet.content!,
          ],
        ],
      ),
    );
  }
}

class _ActionSheetRow extends StatelessWidget {
  const _ActionSheetRow({
    required this.action,
    this.onActionPressed,
    this.defaultTextStyle,
  });

  final MayActionSheetActionTypeV2 action;
  final MayActionSheetActionCallback? onActionPressed;
  final TextStyle? defaultTextStyle;

  @override

  /// Xây dựng một hàng hành động có thể nhấn được trong action sheet.
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    final color = action.isDestructive ? colors.txCritical : colors.txContentPrimaryDefault;

    return GestureContainerV2(
      onTap: () {
        Navigator.of(context).pop(action);
        onActionPressed?.call(action);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacingV2.x2l,
          vertical: AppSpacingV2.lg,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Text(
            action.title,
            style: (defaultTextStyle ?? AppTextStylesV2.text18Semibold).copyWith(
              color: color,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class _CancelActionSheetRow extends StatelessWidget {
  const _CancelActionSheetRow({
    required this.action,
    this.textStyle,
    this.onActionPressed,
  });

  final MayActionSheetActionTypeV2 action;
  final TextStyle? textStyle;
  final MayActionSheetActionCallback? onActionPressed;

  @override

  /// Xây dựng nút huỷ (cancel) của action sheet.
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    return GestureContainerV2(
      onTap: () {
        Navigator.of(context).pop(action);
        onActionPressed?.call(action);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacingV2.x2l,
          vertical: AppSpacingV2.lg,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Text(
            action.title,
            style: (textStyle ?? AppTextStylesV2.text18Semibold).copyWith(
              color: colors.txCancel,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

/// Hiển thị [MayActionSheet] dưới dạng modal bottom sheet.
///
/// Trả về [MayActionSheetActionTypeV2] được chọn, hoặc `null` nếu
/// người dùng đóng sheet mà không chọn hành động nào.
Future<MayActionSheetActionTypeV2?> showMayActionSheetV2({
  required BuildContext context,
  String? title,
  String? description,
  Widget? content,
  List<MayActionSheetActionTypeV2> actions = const [
    MayActionSheetActionTypeV2.edit,
    MayActionSheetActionTypeV2.share,
    MayActionSheetActionTypeV2.delete,
  ],
  MayActionSheetActionTypeV2 cancelAction = MayActionSheetActionTypeV2.close,
  MayActionSheetActionCallback? onActionPressed,
  VoidCallback? onActionEdit,
  VoidCallback? onActionShare,
  VoidCallback? onActionDelete,
  VoidCallback? onActionLogout,
  VoidCallback? onActionConfirm,
  VoidCallback? onActionClose,
  VoidCallback? onActionCancelConfirm,
  VoidCallback? onActionSettings,
  bool showCancelAction = true,
  bool useRootNavigator = false,
  bool isDismissible = true,
  bool enableDrag = true,
  Color? barrierColor,
  Color? backgroundColor,
  Color? cancelBackgroundColor,
  Color? dividerColor,
}) {
  return showModalBottomSheet<MayActionSheetActionTypeV2>(
    context: context,
    useRootNavigator: useRootNavigator,
    isScrollControlled: true,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    backgroundColor: AppColorsV2.transparent,
    barrierColor: barrierColor ?? AppColorsV2.genericBlack.withValues(alpha: 0.4),
    builder: (context) {
      return MayActionSheet(
        title: title,
        description: description,
        content: content,
        actions: actions,
        cancelAction: cancelAction,
        onActionPressed: onActionPressed,
        onActionEdit: onActionEdit,
        onActionShare: onActionShare,
        onActionDelete: onActionDelete,
        onActionLogout: onActionLogout,
        onActionConfirm: onActionConfirm,
        onActionClose: onActionClose,
        onActionCancelConfirm: onActionCancelConfirm,
        onActionSettings: onActionSettings,
        showCancelAction: showCancelAction,
        backgroundColor: backgroundColor,
        cancelBackgroundColor: cancelBackgroundColor,
        dividerColor: dividerColor,
      );
    },
  );
}
