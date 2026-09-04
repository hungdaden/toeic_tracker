import 'package:flutter/material.dart';
import 'package:may_uikit/resources/spacing.dart';

import '../../../resources/dimens.dart';
import '../../../resources/styles/app_color.dart';
import '../../../resources/styles/app_text_style.dart';
import '../../../themes/main_theme.dart';
import '../../../resources/generated/l10n.dart';
import '../common_empty_state/empty_state_widget_v2.dart';
import '../common_image/common_image.dart';
import '../common_loading_indicator/common_loading_indicator.dart';
import 'show_round_bottom_sheet.dart';

/// Hằng số cấu hình chung cho Bottom Sheet.
class BottomSheetCommonV2 {
  const BottomSheetCommonV2._();

  /// Padding mặc định cho bottom sheet. Mặc định là 20px.
  static const EdgeInsets commonBottomSheetPadding =
      EdgeInsets.fromLTRB(AppSpacingV2.lg, AppSpacingV2.lg, AppSpacingV2.lg, AppSpacingV2.sm);
}

/// Phần tử đại diện cho các item hiển thị trong Bottom Sheet.
class BottomSheetItemV2 extends StatelessWidget {
  /// Khởi tạo [BottomSheetItemV2].
  const BottomSheetItemV2({
    super.key,
    this.padding,
    this.widget,
    this.onTap,
    this.onClose,
  });

  /// Padding của item.
  final EdgeInsets? padding;

  /// Callback được gọi khi tap vào item.
  final void Function()? onTap;

  /// Widget nội dung của item.
  final Widget? widget;

  /// Callback được gọi khi đóng item.
  final VoidCallback? onClose;

  /// TextStyle mặc định cho tiêu đề Bottom Sheet.
  static TextStyle commonTitleTextStyle(BuildContext context) =>
      AppTextStylesV2.text16Semibold.copyWith(
        color: context.mayColors.txContentPrimaryDefault,
      );

  /// Widget tiêu đề mặc định cho Bottom Sheet.
  static BottomSheetItemV2 commonTitleWidget({
    Key? key,
    String? title,
    Widget? titleWidget,
    required double circularBorderRadius,
    required BuildContext context,
    EdgeInsets? padding,
    TextStyle? commonTitleStyle,
    VoidCallback? onClose,
    TextStyle? customTitleStyle,
    Widget? leading,
  }) {
    return BottomSheetItemV2(
      widget: Builder(
        builder: (BuildContext builderContext) {
          final effectiveStyle = commonTitleStyle ?? commonTitleTextStyle(builderContext);
          return Material(
            type: MaterialType.transparency,
            child: Container(
              key: key,
              padding: EdgeInsets.only(
                left: padding?.left ?? DimensV2.d0,
                right: padding?.right ?? DimensV2.d0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (leading != null) ...[
                    Padding(
                      padding: EdgeInsets.only(
                        top: padding?.top ?? DimensV2.d0,
                        bottom: padding?.bottom ?? DimensV2.d0,
                      ),
                      child: leading,
                    ),
                    const SizedBox(width: AppSpacingV2.x2s),
                  ],
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        top: padding?.top ?? DimensV2.d0,
                        bottom: padding?.bottom ?? DimensV2.d0,
                      ),
                      alignment: Alignment.centerLeft,
                      child: titleWidget != null
                          ? Theme(
                              data: Theme.of(builderContext).copyWith(
                                textTheme: TextTheme(
                                  displayLarge: effectiveStyle,
                                  displayMedium: effectiveStyle,
                                  displaySmall: effectiveStyle,
                                  headlineMedium: effectiveStyle,
                                  headlineSmall: effectiveStyle,
                                  titleLarge: effectiveStyle,
                                  titleMedium: effectiveStyle,
                                  titleSmall: effectiveStyle,
                                  bodyLarge: effectiveStyle,
                                  bodyMedium: effectiveStyle,
                                  bodySmall: effectiveStyle,
                                  labelLarge: effectiveStyle,
                                  labelMedium: effectiveStyle,
                                  labelSmall: effectiveStyle,
                                ),
                              ),
                              child: DefaultTextStyle(
                                style: effectiveStyle,
                                child: titleWidget,
                              ),
                            )
                          : Text(
                              title ?? '',
                              style: customTitleStyle ?? commonTitleTextStyle(builderContext),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override

  /// Xây dựng giao diện cho phần tử bottom sheet item.
  Widget build(BuildContext context) {
    return widget ?? const SizedBox.shrink();
  }
}

/// Hiển thị một Bottom Sheet bo góc tròn có tiêu đề dạng Modal.
///
/// Các tham số:
/// * [context]: BuildContext của ứng dụng.
/// * [child]: Hàm builder nhận widget tiêu đề và trả về một [Column].
/// * [childBuilder]: Hàm builder tùy chỉnh bao quanh widget nội dung.
/// * [height]: Chiều cao cố định của bottom sheet.
/// * [hasShadow]: Có đổ bóng cho bottom sheet hay không. Mặc định là false.
/// * [circularBorderRadius]: Bán kính bo góc. Mặc định là [DimensV2.d28] (28px).
/// * [padding]: Khoảng đệm bên trong.
/// * [customPadding]: Padding tùy chỉnh cho tiêu đề.
/// * [border]: Viền xung quanh bottom sheet.
/// * [backgroundColor]: Màu nền. Mặc định là [AppColorsV2.genericWhite].
/// * [mainAxisSize]: Kích thước chính.
/// * [margin]: Khoảng cách bên ngoài.
/// * [constraint]: Ràng buộc kích thước của bottom sheet.
/// * [childConstraint]: Ràng buộc kích thước cho cột con bên trong.
/// * [bottomSheet]: Widget đính kèm ở dưới cùng.
/// * [onDismiss]: Callback được gọi khi đóng bottom sheet.
/// * [title]: Tiêu đề bằng chuỗi ký tự.
/// * [titleWidget]: Widget tiêu đề tùy chỉnh (nếu có sẽ thay thế [title]).
/// * [titleWidgetFunction]: Hàm tạo widget tiêu đề động.
/// * [confirmLabel]: Nhãn của nút xác nhận.
/// * [onConfirm]: Callback khi nhấn nút xác nhận.
///   Nếu truyền thì nút xác nhận mới hiển thị.
/// * [isConfirmEnabled]: Trạng thái bật/tắt của nút xác nhận. Mặc định là true.
/// * [cancelLabel]: Nhãn của nút hủy/đóng.
/// * [onCancel]: Callback khi nhấn nút hủy/đóng.
///   Nếu truyền thì nút hủy/đóng mới hiển thị.
Future<T?> showTitledBottomSheetV2<T>({
  required BuildContext context,
  required Column Function(Widget) child,

  /// Hàm builder tùy chỉnh bao quanh widget nội dung.
  Widget Function(Widget Function())? childBuilder,
  double? height,
  bool hasShadow = false,
  double circularBorderRadius = DimensV2.d28,
  EdgeInsets? padding = BottomSheetCommonV2.commonBottomSheetPadding,
  EdgeInsets? customPadding,
  Border? border,
  Color? backgroundColor,
  MainAxisSize? mainAxisSize,
  EdgeInsets? margin,
  BoxConstraints? constraint = const BoxConstraints(
    maxWidth: double.infinity,
    maxHeight: double.infinity,
    minHeight: 0,
  ),
  BoxConstraints? childConstraint,
  Widget? bottomSheet = const SizedBox.shrink(),

  /// Callback được gọi khi đóng bottom sheet.
  void Function()? onDismiss,
  String? title,
  Widget? titleWidget,

  /// Hàm tạo widget tiêu đề động.
  Widget Function()? titleWidgetFunction,
  String? confirmLabel,
  VoidCallback? onConfirm,
  ValueNotifier<bool>? isConfirmEnabled,
  ValueNotifier<bool>? isConfirmLoading,
  bool showConfirmButton = false,
  ValueNotifier<bool>? isLoading,
  ValueNotifier<bool>? isEmpty,
  String? emptyTitle,
  String? emptyDescription,
  String? cancelLabel,
  VoidCallback? onCancel,
  Widget? titleLeading,
  String? titleLeadingIconUrl,
}) {
  backgroundColor ??= context.mayColors.bgCard;
  final mediaQuery = MediaQuery.maybeOf(context);
  final screenHeight = mediaQuery?.size.height;

  /// Hàm xây dựng widget tiêu đề chung.
  Widget commonTitleWidget() {
    Widget? titleWidgetValue = titleWidget ?? titleWidgetFunction?.call();
    Widget? leading = titleLeading;
    if (leading == null && titleLeadingIconUrl != null && titleLeadingIconUrl.isNotEmpty) {
      leading = CommonImageV2.network(
        url: titleLeadingIconUrl,
        width: DimensV2.d16,
        height: DimensV2.d16,
      );
    }
    return BottomSheetItemV2.commonTitleWidget(
      key: Key('$BottomSheetItemV2'),
      padding: customPadding ?? padding ?? EdgeInsets.zero,
      circularBorderRadius: circularBorderRadius,
      context: context,
      title: title,
      titleWidget: titleWidgetValue,
      leading: leading,
    );
  }

  return showRoundBottomSheetV2<T>(
    context: context,
    childFuction: () {
      return Theme(
        data: Theme.of(context),
        child: ConstrainedBox(
          constraints: childConstraint ??
              BoxConstraints(
                maxHeight: (screenHeight ?? double.infinity) * 0.86,
              ),
          child: Builder(
            builder: (context) {
              final column = child.call(commonTitleWidget());
              final extractedTitleWidget = column.children.firstOrNull;
              final otherChildren = column.children.skip(1).toList();

              /// Wraps a given [item] with appropriate padding, while preserving
              /// its [Expanded], [Flexible], or [BottomSheetItemV2] behavior.
              Widget wrapChild(Widget item) {
                return item is Expanded
                    ? Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: padding?.left ?? DimensV2.d0,
                            right: padding?.right ?? DimensV2.d0,
                          ),
                          child: item.child,
                        ),
                      )
                    : item is Flexible
                        ? Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: padding?.left ?? DimensV2.d0,
                                right: padding?.right ?? DimensV2.d0,
                              ),
                              child: item.child,
                            ),
                          )
                        : item is BottomSheetItemV2
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: DimensV2.d4),
                                child: item,
                              )
                            : Padding(
                                padding: EdgeInsets.only(
                                  left: padding?.left ?? DimensV2.d0,
                                  right: padding?.right ?? DimensV2.d0,
                                ),
                                child: item,
                              );
              }

              final headerTitleWidget = extractedTitleWidget != null
                  ? wrapChild(extractedTitleWidget)
                  : const SizedBox.shrink();

              /// Builds the body content based on the [loading] and [empty] state,
              /// constrained by the maximum [availableHeight].
              Widget buildBodyContent(bool loading, bool empty, double availableHeight) {
                if (loading) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Offstage(
                        offstage: true,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: otherChildren.map(wrapChild).toList(),
                        ),
                      ),
                      SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: availableHeight * 0.5,
                          ),
                          child: const Center(
                            child: CommonLoadingIndicatorV2(),
                          ),
                        ),
                      ),
                    ],
                  );
                }
                if (empty) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: availableHeight * 0.5,
                      ),
                      child: Center(
                        child: EmptyStateWidgetV2(
                          title: emptyTitle ?? S.current.emptyDataTitle,
                          description: emptyDescription ?? S.current.emptyDataDescription,
                          padding: EdgeInsets.zero,
                          hasBorder: false,
                          hasShadow: false,
                        ),
                      ),
                    ),
                  );
                }
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: otherChildren.map(wrapChild).toList(),
                );
              }

              Widget body;
              if (isLoading != null || isEmpty != null) {
                body = ValueListenableBuilder<bool>(
                  valueListenable: isLoading ?? ValueNotifier<bool>(false),
                  builder: (context, loading, _) {
                    return ValueListenableBuilder<bool>(
                      valueListenable: isEmpty ?? ValueNotifier<bool>(false),
                      builder: (context, empty, _) {
                        final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
                        final availableHeight = (screenHeight ?? 800) - keyboardHeight;

                        final content = buildBodyContent(loading, empty, availableHeight);

                        return AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.fastOutSlowIn,
                          alignment: Alignment.topCenter,
                          child: content,
                        );
                      },
                    );
                  },
                );
              } else {
                body = Column(
                  mainAxisSize: MainAxisSize.min,
                  children: otherChildren.map(wrapChild).toList(),
                );
              }

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  headerTitleWidget,
                  if (body is Expanded)
                    body
                  else if (body is Flexible)
                    body
                  else
                    Flexible(child: body),
                ],
              );
            },
          ),
        ),
      );
    },
    childBuilder: childBuilder,
    height: height,
    hasShadow: hasShadow,
    circularBorderRadius: circularBorderRadius,
    border: border,
    backgroundColor: backgroundColor,
    mainAxisSize: mainAxisSize,
    margin: margin,
    constraint: constraint,
    bottomSheet: bottomSheet,
    onDismiss: onDismiss,
    confirmLabel: confirmLabel,
    onConfirm: onConfirm,
    isConfirmEnabled: isConfirmEnabled,
    isConfirmLoading: isConfirmLoading,
    showConfirmButton: showConfirmButton,
    cancelLabel: cancelLabel,
    onCancel: onCancel,
  );
}
