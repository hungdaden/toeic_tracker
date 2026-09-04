// ignore_for_file: invalid_use_of_protected_member, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/dimens.dart';
import '../../../resources/generated/assets.gen.dart';
import '../../../resources/styles/app_color.dart';
import '../app_page_view/animated_step_page_view.dart';
import '../containers/gesture_container.dart';
import 'show_titled_bottom_sheet.dart';

/// Hiển thị một Bottom Sheet phức hợp gồm nhiều bước
/// chuyển trang động dạng Modal.
///
/// Các tham số:
/// * [context]: BuildContext của ứng dụng.
/// * [childBuilder]: Hàm builder tạo phần tử [TitledManyBottomSheetItemV2]
///   cho mỗi bước theo chỉ mục và PageController.
/// * [itemCount]: Tổng số bước chuyển trang.
/// * [height]: Chiều cao cố định của bottom sheet.
/// * [hasShadow]: Có đổ bóng cho bottom sheet hay không. Mặc định là false.
/// * [circularBorderRadius]: Bán kính bo góc. Mặc định là [DimensV2.d28] (28px).
/// * [padding]: Khoảng đệm nội dung mặc định.
/// * [customPadding]: Padding tùy chỉnh cho tiêu đề.
/// * [border]: Viền xung quanh bottom sheet.
/// * [backgroundColor]: Màu nền. Mặc định là [AppColorsV2.genericWhite].
/// * [mainAxisSize]: Kích thước chính.
/// * [margin]: Khoảng cách bên ngoài.
/// * [constraint]: Ràng buộc kích thước.
/// * [childConstraint]: Ràng buộc kích thước cho nội dung con.
/// * [bottomSheet]: Widget đính kèm ở dưới cùng.
/// * [onDismiss]: Callback được gọi khi đóng.
/// * [physics]: Scroll physics dùng cho việc chuyển trang.
/// * [pageTransitionType]: Kiểu hiệu ứng chuyển trang.
///   Mặc định là [PageTransitionTypeV2.scaleFade].
/// * [showBackButton]: Có hiển thị nút quay lại trên tiêu đề bước hay không.
///   Mặc định là true.
/// * [pageAnimationDuration]: Khoảng thời gian chuyển tiếp khi vuốt trang.
///   Mặc định là 250ms.
/// * [customBackButton]: Widget nút quay lại tự chỉnh.
/// * [onBackPressed]: Callback khi nhấn nút quay lại.
void showTitledManyBottomSheetV2({
  required BuildContext context,
  required TitledManyBottomSheetItemV2 Function(int, PageController) childBuilder,
  required int itemCount,
  double? height,
  bool hasShadow = false,
  double circularBorderRadius = DimensV2.d28,
  EdgeInsets? padding = BottomSheetCommonV2.commonBottomSheetPadding,
  EdgeInsets? customPadding,
  Border? border,
  Color? backgroundColor = AppColorsV2.genericWhite,
  MainAxisSize? mainAxisSize,
  EdgeInsets? margin,
  BoxConstraints? constraint,
  BoxConstraints? childConstraint,
  Widget? bottomSheet = const SizedBox.shrink(),
  /// Callback được gọi khi đóng bottom sheet.
  void Function()? onDismiss,
  ScrollPhysics? physics,
  PageTransitionTypeV2 pageTransitionType = PageTransitionTypeV2.scaleFade,
  bool showBackButton = true,
  Duration pageAnimationDuration = const Duration(milliseconds: 250),
  Widget? customBackButton,
  /// Callback được gọi khi nhấn nút quay lại.
  void Function(int currentStep)? onBackPressed,
}) {
  TitledManyBottomSheetItemIndexV2.reset(itemCount);
  final pageController = PageController();
  showTitledBottomSheetV2(
    context: context,
    titleWidgetFunction: () {
      TitledManyBottomSheetItemIndexV2.step += 1;
      if (TitledManyBottomSheetItemIndexV2.step >= itemCount) {
        TitledManyBottomSheetItemIndexV2.step = TitledManyBottomSheetItemIndexV2.step - itemCount;
      }

      final currentStep = TitledManyBottomSheetItemIndexV2.step;
      final item = childBuilder.call(currentStep, pageController);
      final titleContent = item.titleWidget ??
          Text(
            item.title ?? '',
            style: BottomSheetItemV2.commonTitleTextStyle(context),
          );

      final shouldShowBack = showBackButton && currentStep > 0;
      final titlePadding = customPadding ?? EdgeInsets.all(padding?.right ?? DimensV2.d0);

      return Padding(
        padding: EdgeInsets.only(
          left: shouldShowBack ? DimensV2.d4 : DimensV2.d8,
          top: shouldShowBack ? titlePadding.top - DimensV2.d12 : titlePadding.top,
          bottom: titlePadding.bottom + DimensV2.d7,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (shouldShowBack)
              GestureContainerV2(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(DimensV2.d99)),
                ),
                onTap: () {
                  onBackPressed?.call(currentStep);
                  pageController.previousPage(
                    duration: pageAnimationDuration,
                    curve: Curves.easeInOut,
                  );
                },
                child: Container(
                  color: AppColorsV2.transparent,
                  padding: const EdgeInsets.all(DimensV2.d12),
                  alignment: Alignment.center,
                  child: customBackButton ??
                      SvgPicture.asset(
                        Assets.icons.icArrowBackStep.path,
                        width: DimensV2.d22,
                        height: DimensV2.d22,
                      ),
                ),
              )
            else
              SizedBox(width: titlePadding.left),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  left: DimensV2.d0,
                  right: titlePadding.right,
                  bottom: DimensV2.d1,
                ),
                alignment: Alignment.centerLeft,
                child: titleContent,
              ),
            ),
          ],
        ),
      );
    },
    child: (title) {
      final step = TitledManyBottomSheetItemIndexV2.step;
      final item = step < itemCount ? childBuilder.call(step, pageController) : null;
      final bodyContent = item != null ? item.body : const SizedBox.shrink();

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          title,
          Flexible(
            child: (item?.isScrollable ?? true)
                ? SingleChildScrollView(child: bodyContent)
                : bodyContent,
          )
        ],
      );
    },
    childBuilder: (builder) => AnimatedStepPageViewV2(
      controller: pageController,
      physics: physics,
      pageTransitionType: pageTransitionType,
      children: List.generate(
        itemCount,
        (index) => GestureContainerV2(
          onTap: () => Navigator.of(context).pop(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureContainerV2(
                onTap: () {},
                child: builder.call(),
              )
            ],
          ),
        ),
      ),
    ),
    height: height,
    hasShadow: hasShadow,
    circularBorderRadius: circularBorderRadius,
    border: border,
    backgroundColor: backgroundColor,
    mainAxisSize: mainAxisSize,
    margin: margin,
    constraint: constraint ?? BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
    childConstraint: childConstraint,
    bottomSheet: bottomSheet,
    onDismiss: onDismiss,
    padding: padding,
    customPadding: EdgeInsets.zero,
  );
}

/// Lớp lưu trữ trạng thái chỉ mục bước hiện tại của bottom sheet.
class TitledManyBottomSheetItemIndexV2 {
  /// Chỉ mục bước hiện tại.
  static int step = 0;

  /// Đặt lại chỉ mục bước về mặc định (-1).
  static void reset(int itemCount) {
    TitledManyBottomSheetItemIndexV2.step = -1;
  }
}

/// Dữ liệu biểu diễn một bước hiển thị trong [showTitledManyBottomSheetV2].
class TitledManyBottomSheetItemV2 {
  /// Khởi tạo [TitledManyBottomSheetItemV2].
  TitledManyBottomSheetItemV2({
    this.title,
    this.titleWidget,
    required this.body,
    this.onClose,
    this.isScrollable = true,
  }) : assert(
          title != null || titleWidget != null,
          'Phải cung cấp title hoặc titleWidget',
        );

  /// Tiêu đề của bước dạng chuỗi ký tự.
  final String? title;

  /// Widget tiêu đề tùy biến.
  final Widget? titleWidget;

  /// Widget nội dung hiển thị trong bước này.
  final Widget body;

  /// Callback được gọi khi nhấn nút đóng.
  final VoidCallback? onClose;

  /// Cho phép cuộn trang nội dung bước này hay không. Mặc định là true.
  final bool isScrollable;
}
