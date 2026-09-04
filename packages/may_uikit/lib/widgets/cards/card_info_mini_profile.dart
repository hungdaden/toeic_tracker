import 'package:flutter/material.dart';

import '../../may_uikit.dart';

/// Card hiển thị thông tin tóm tắt của một học sinh / người dùng.
///
/// Bố cục: tên + subtitle bên trái, avatar tròn bên phải.
///
/// ### Ví dụ
/// ```dart
/// CardInfoMiniProfileV2(
///   name: 'Lê Quỳnh Như',
///   subtitle: 'Lớp 11D2 - PS01092007',
///   avatar: Image.network('https://...', fit: BoxFit.cover),
/// )
/// ```
class CardInfoMiniProfileV2 extends StatelessWidget {
  const CardInfoMiniProfileV2({
    super.key,
    required this.name,
    required this.subtitle,
    this.avatar,
    this.avatarUrl,
    this.avatarSize = DimensV2.d62,
    this.onTap,
  });

  /// Tên hiển thị (Text 20/SemiBold).
  final String name;

  /// Dòng phụ dưới tên (Text 14/Medium).
  final String subtitle;

  /// Avatar tuỳ chỉnh. Ưu tiên dùng [avatar] nếu được truyền.
  final Widget? avatar;

  /// Đường dẫn ảnh đại diện. Nếu null hoặc rỗng sẽ hiển thị placeholder.
  final String? avatarUrl;

  /// Kích thước avatar (chiều rộng = chiều cao). Mặc định 74.
  final double avatarSize;

  /// Callback khi nhấn vào card.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    return Padding(
      padding: const EdgeInsets.only(left: DimensV2.d16, right: DimensV2.d16, bottom: DimensV2.d16),
      child: CardV2(
        onTap: onTap,
        padding: const EdgeInsets.symmetric(
          horizontal: DimensV2.d20,
          vertical: DimensV2.d16,
        ),
        borderRadius: AppRadiusV2.x3l,
        child: Row(
          children: [
            // ── Body ──────────────────────────────────────────────────────
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    style: AppTextStylesV2.title20SemiBold.copyWith(
                      color: colors.txContentPrimaryDefault,
                    ),
                  ),
                  const SizedBox(height: DimensV2.d2),
                  Text(
                    subtitle,
                    style: AppTextStylesV2.labelMedium.copyWith(
                      color: colors.txContentSecondaryDefault,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: DimensV2.d10),
            // ── Avatar ────────────────────────────────────────────────────
            ClipOval(
              child: SizedBox(
                width: avatarSize,
                height: avatarSize,
                child: avatar ??
                    CommonAvatarV2(
                      imageUrl: avatarUrl ?? '',
                      radius: avatarSize,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
