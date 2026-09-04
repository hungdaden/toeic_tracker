import 'package:flutter/material.dart';

import 'package:may_uikit/resources/spacing.dart';
import 'package:may_uikit/resources/styles/app_color.dart';
import 'package:may_uikit/resources/styles/app_text_style.dart';
import 'package:may_uikit/common_views/common_divider/common_divider.dart';

/// Data model đại diện cho một mục nội dung trong [ReviewContentListV2].
///
/// Ví dụ:
/// ```dart
/// ReviewContentItemDataV2(
///   title: 'ĂN',
///   content: 'Con ăn ngon miệng.',
///   titleColor: '#5C5C5C',
///   showDivider: true,
///   isItalics: true,
/// )
/// ```
class ReviewContentItemDataV2 {
  /// Tiêu đề của mục (ví dụ: ĂN, NGỦ, VỆ SINH, NỀ NẾP).
  final String title;

  /// Nội dung mô tả của mục.
  final String content;

  /// Màu hex của tiêu đề từ BE (ví dụ: '#5C5C5C'). Nếu null thì dùng màu mặc định.
  final String? titleColor;

  /// Có hiển thị đường kẻ phân cách phía trên mục này không.
  final bool showDivider;

  /// Tiêu đề có in nghiêng không.
  final bool isItalics;

  const ReviewContentItemDataV2({
    required this.title,
    required this.content,
    this.titleColor,
    this.showDivider = false,
    this.isItalics = true,
  });
}

/// Widget hiển thị danh sách các mục nội dung nhận xét theo Figma.
///
/// Mỗi mục bao gồm:
/// - **title** (text in đậm nghiêng, màu lấy từ BE hoặc tertiary mặc định)
/// - **content** (text thường, màu primary): nội dung mô tả
/// - Đường phân cách mỏng được điều khiển bởi [ReviewContentItemDataV2.showDivider].
///
/// Ví dụ sử dụng:
/// ```dart
/// ReviewContentListV2(
///   items: [
///     ReviewContentItemDataV2(title: 'ĂN', content: 'Con ăn ngon miệng.', showDivider: false),
///     ReviewContentItemDataV2(title: 'NGỦ', content: 'Con ngủ ngoan.', showDivider: true),
///   ],
/// )
/// ```
class ReviewContentListV2 extends StatelessWidget {
  /// Danh sách các mục nội dung cần hiển thị.
  final List<ReviewContentItemDataV2> items;

  /// Khoảng cách giữa tiêu đề và nội dung bên trong mỗi mục.
  final double innerSpacing;

  /// Khoảng cách giữa các mục với nhau (và quanh divider).
  final double itemSpacing;

  const ReviewContentListV2({
    super.key,
    required this.items,
    this.innerSpacing = AppSpacingV2.xs,
    this.itemSpacing = AppSpacingV2.sm,
  });

  /// Xây dựng giao diện danh sách các mục nội dung.
  ///
  /// Tham số [context] được sử dụng để build cây widget.
  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < items.length; i++) ...[
          // Hiển thị divider phía trên mục nếu có cờ showDivider (từ BE)
          if (items[i].showDivider) ...[
            SizedBox(height: itemSpacing),
            const CommonDividerV2(),
            SizedBox(height: itemSpacing),
          ] else if (i > 0)
            SizedBox(height: itemSpacing),
          _ReviewContentItemV2(
            item: items[i],
            innerSpacing: innerSpacing,
          ),
        ],
      ],
    );
  }
}

/// Widget nội bộ hiển thị một mục nhận xét đơn lẻ.
class _ReviewContentItemV2 extends StatelessWidget {
  const _ReviewContentItemV2({
    required this.item,
    required this.innerSpacing,
  });

  final ReviewContentItemDataV2 item;
  final double innerSpacing;

  /// Parse màu hex từ string BE (ví dụ '#5C5C5C' hoặc '5C5C5C').
  Color? _parseTitleColor() {
    final raw = item.titleColor;
    if (raw == null || raw.isEmpty) return null;
    final hex = raw.startsWith('#') ? raw.substring(1) : raw;
    if (hex.length != 6 && hex.length != 8) return null;
    final value = int.tryParse(hex.length == 6 ? 'FF$hex' : hex, radix: 16);
    return value != null ? Color(value) : null;
  }

  /// Xây dựng giao diện của một mục nội dung nhận xét.
  ///
  /// Tham số [context] được sử dụng để build cây widget.
  @override
  Widget build(BuildContext context) {
    final titleColor = _parseTitleColor() ?? AppColorsV2.neutral500;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          item.title.toUpperCase(),
          style: AppTextStylesV2.text16Semibold.copyWith(
            color: titleColor,
            fontStyle: item.isItalics ? FontStyle.italic : FontStyle.normal,
          ),
        ),
        SizedBox(height: innerSpacing),
        Text(
          item.content,
          style: AppTextStylesV2.text16Medium.copyWith(
            color: AppColorsV2.neutral900,
          ),
        ),
      ],
    );
  }
}
