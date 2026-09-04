import 'package:flutter/material.dart';

import '../../../resources/dimens.dart';
import '../../../resources/styles/app_color.dart';
import '../../../resources/styles/app_text_style.dart';
import 'show_round_bottom_sheet.dart';

/// Một Bottom Sheet UIKit có tiêu đề cố định và vùng nội dung linh hoạt.
///
/// Thiết kế theo Figma node: 40017813:162903.
///
/// Ví dụ sử dụng:
/// ```dart
/// showAppBottomSheetV2(
///   context: context,
///   title: 'Nhận xét chăm sóc học sinh',
///   child: ReviewContentListV2(items: [...]),
/// );
/// ```
void showAppBottomSheetV2({
  required BuildContext context,
  /// Tiêu đề hiển thị ở đầu bottom sheet.
  required String title,
  /// Widget nội dung bên trong bottom sheet.
  required Widget child,
  double? height,
  Color? backgroundColor = AppColorsV2.genericWhite,
  BoxConstraints? childConstraint,
  EdgeInsets? contentPadding,
  bool isScrollable = false,
  VoidCallback? onDismiss,
  /// Bật animated height — bottom sheet sẽ animate khi content thay đổi size.
  bool animatedHeight = false,
  /// Chiều cao khởi đầu (fraction of screen) khi loading. Mặc định 0.5.
  double initialHeightFactor = 0.5,
  /// Chiều cao tối đa (fraction of screen) khi có content. Mặc định 0.85.
  double maxHeightFactor = 0.85,
  /// Duration của animation height. Mặc định 300ms.
  Duration animatedHeightDuration = const Duration(milliseconds: 300),
}) {
  final mediaQuery = MediaQuery.maybeOf(context);
  final screenHeight = mediaQuery?.size.height;

  showRoundBottomSheetV2(
    context: context,
    onDismiss: onDismiss,
    height: height,
    backgroundColor: backgroundColor,
    constraint: const BoxConstraints(
      maxWidth: double.infinity,
      maxHeight: double.infinity,
      minHeight: 0,
    ),
    childFuction: () {
      final effectivePadding = contentPadding ??
          const EdgeInsets.only(
            top: DimensV2.d12,
            left: DimensV2.d20,
            right: DimensV2.d20,
            bottom: DimensV2.d20,
          );

      final contentWidget = isScrollable
          ? LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                padding: effectivePadding,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: child,
                ),
              ),
            )
          : Padding(
              padding: effectivePadding,
              child: child,
            );

      final hasMinHeight =
          childConstraint != null && childConstraint.minHeight > 0;

      final column = Column(
        mainAxisSize:
            (hasMinHeight || animatedHeight) ? MainAxisSize.max : MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty) _AppBottomSheetTitleV2(title: title),
          if (isScrollable)
            Expanded(child: contentWidget)
          else
            contentWidget,
        ],
      );

      if (animatedHeight) {
        final maxHeight = (screenHeight ?? double.infinity) * maxHeightFactor;
        return AnimatedSize(
          duration: animatedHeightDuration,
          curve: Curves.easeInOut,
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: maxHeight,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title.isNotEmpty) _AppBottomSheetTitleV2(title: title),
                Flexible(
                  child: Padding(
                    padding: effectivePadding,
                    child: child,
                  ),
                ),
              ],
            ),
          ),
        );
      }

      return ConstrainedBox(
        constraints: childConstraint ??
            BoxConstraints(
              maxHeight: (screenHeight ?? double.infinity) * 0.8,
            ),
        child: column,
      );
    },
  );
}


/// Widget tiêu đề nội bộ của [showAppBottomSheetV2].
class _AppBottomSheetTitleV2 extends StatelessWidget {
  const _AppBottomSheetTitleV2({required this.title});

  final String title;

  /// Xây dựng giao diện của tiêu đề bottom sheet.
  ///
  /// Tham số [context] được sử dụng để build cây widget.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        DimensV2.d20,
        DimensV2.d20,
        DimensV2.d20,
        DimensV2.d0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: AppTextStylesV2.text16Semibold.copyWith(
                color: AppColorsV2.neutral900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
