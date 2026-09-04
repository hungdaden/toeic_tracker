import 'package:flutter/material.dart';
import 'package:may_uikit/common_views/common_image/common_image.dart';
import 'package:may_uikit/resources/dimens.dart';
import 'package:may_uikit/resources/styles/app_color.dart';
import 'package:may_uikit/resources/styles/app_text_style.dart';
import 'package:may_uikit/themes/main_theme.dart';

/// Data model ánh xạ từ BE cho 1 icon.
class ContentBottomSheetIconV2 {
  const ContentBottomSheetIconV2({required this.url});

  final String url;

  factory ContentBottomSheetIconV2.fromJson(Map<String, dynamic> json) {
    return ContentBottomSheetIconV2(url: json['url'] as String? ?? '');
  }
}

/// Data model ánh xạ từ BE cho 1 detail item bên trong group.
class ContentBottomSheetDetailV2 {
  const ContentBottomSheetDetailV2({
    required this.title,
    required this.content,
    this.icons = const <ContentBottomSheetIconV2>[],
    this.showDivider = false,
  });

  final String title;
  final String content;

  /// Danh sách icon từ BE. Nếu rỗng → không hiển thị icon phía trước content.
  final List<ContentBottomSheetIconV2> icons;

  /// Khi `show_divider == true`, sẽ hiển thị đường kẻ ngang phía dưới item.
  final bool showDivider;

  factory ContentBottomSheetDetailV2.fromJson(Map<String, dynamic> json) {
    final rawIcons = json['icon'] as List<dynamic>? ?? [];
    return ContentBottomSheetDetailV2(
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
      icons: rawIcons
          .map((e) => ContentBottomSheetIconV2.fromJson(e as Map<String, dynamic>))
          .toList(),
      showDivider: json['show_divider'] as bool? ?? false,
    );
  }
}

/// Data model ánh xạ từ BE cho 1 nhóm (group).
class ContentBottomSheetGroupV2 {
  const ContentBottomSheetGroupV2({
    required this.title,
    required this.details,
  });

  final String title;
  final List<ContentBottomSheetDetailV2> details;

  factory ContentBottomSheetGroupV2.fromJson(Map<String, dynamic> json) {
    final rawDetails = json['details'] as List<dynamic>? ?? [];
    return ContentBottomSheetGroupV2(
      title: json['title'] as String? ?? '',
      details: rawDetails
          .map((e) => ContentBottomSheetDetailV2.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Widget nội dung cho BottomSheet theo Figma:
/// - Nhận [groups] là danh sách [ContentBottomSheetGroupV2] từ BE.
/// - Phần title của bottomSheet đã được gọi riêng bên ngoài → widget này
///   chỉ render phần body (list groups & detail items).
///
/// Icon từ BE:
/// - Có icon (`icons` không rỗng, `url` không rỗng) → hiển thị icon phía trước content.
/// - Không có icon → không hiển thị icon, chỉ hiển thị content text.
///
/// Layout mỗi group:
/// ```
/// [Group title]              ← text15Semibold / primary
///   [Item title]             ← text13Medium / secondary  (bỏ qua nếu rỗng)
///   [icon] [Content text]    ← icon từ BE + bodySemiBold / primary
///   [icon] [Content text]
///   ...
/// ─────────────────────      ← divider khi show_divider == true
/// [Group title]
/// ...
/// ```
class ContentBottomSheetV2 extends StatelessWidget {
  const ContentBottomSheetV2({
    super.key,
    required this.groups,
  });

  final List<ContentBottomSheetGroupV2> groups;

  /// Hàm tiện ích: parse danh sách group từ JSON BE.
  static List<ContentBottomSheetGroupV2> parseGroups(List<dynamic> json) {
    return json
        .map((e) => ContentBottomSheetGroupV2.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Builds a scrollable [Column] of group titles and their detail items.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: groups.asMap().entries.expand((groupEntry) {
          final group = groupEntry.value;
          return <Widget>[
            // ── Group title ──────────────────────────────────
            if (group.title.trim().isNotEmpty) ...[
              Text(
                group.title,
                style: AppTextStylesV2.text15Semibold.copyWith(
                  color: colors.txContentPrimaryDefault,
                ),
              ),
              const SizedBox(height: DimensV2.d8),
            ],

            // ── Detail items ─────────────────────────────────
            ...group.details.map(
              (detail) => _DetailItemV2(detail: detail, colors: colors),
            ),
          ];
        }).toList(),
      ),
    );
  }
}

/// Widget con hiển thị 1 detail item gồm:
/// - title (label mức độ) — bỏ qua nếu rỗng
/// - [icon] [content]  hoặc chỉ [content] nếu không có icon từ BE
/// - divider phía dưới nếu [detail.showDivider] == true
class _DetailItemV2 extends StatelessWidget {
  const _DetailItemV2({
    required this.detail,
    required this.colors,
  });

  final ContentBottomSheetDetailV2 detail;
  final MayThemeColorsV2 colors;

  /// Lấy icon đầu tiên có URL hợp lệ từ BE, null nếu không có.
  ContentBottomSheetIconV2? get _icon {
    for (final icon in detail.icons) {
      if (icon.url.trim().isNotEmpty) return icon;
    }
    return null;
  }

  /// Builds the [Column] layout for this detail item, including optional
  /// [title] label, [icon] + [content] row, and optional [Divider].
  @override
  Widget build(BuildContext context) {
    final icon = _icon;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Item title (label mức độ), chỉ hiển thị khi không rỗng
        if (detail.title.trim().isNotEmpty) ...[
          Text(
            detail.title,
            style: AppTextStylesV2.text13Medium.copyWith(
              color: colors.txContentSecondaryDefault,
            ),
          ),
          const SizedBox(height: DimensV2.d4),
        ],

        // Content (có hoặc không có icon phía trước)
        if (detail.content.trim().isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: DimensV2.d8),
            child: icon != null
                // Có icon từ BE → hiển thị icon + content cạnh nhau
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: DimensV2.d4,
                        height: DimensV2.d20,
                        child: Center(
                          child: CommonImageV2.network(
                            url: icon.url,
                            width: DimensV2.d4,
                            height: DimensV2.d4,
                            fit: BoxFit.contain,
                            foregroundColor: colors.txContentPrimaryDefault,
                          ),
                        ),
                      ),
                      const SizedBox(width: DimensV2.d6),
                      Expanded(child: _contentText(colors)),
                    ],
                  )
                // Không có icon → chỉ hiển thị content
                : _contentText(colors),
          ),

        // Divider sau item khi show_divider == true
        if (detail.showDivider) ...[
          const SizedBox(height: DimensV2.d4),
          const Divider(
            height: DimensV2.d1,
            thickness: DimensV2.d_05,
            color: AppColorsV2.neutral200,
          ),
          const SizedBox(height: DimensV2.d12),
        ],
      ],
    );
  }

  /// Returns the [Text] widget displaying [detail.content] with [bodySemiBold] style.
  Widget _contentText(MayThemeColorsV2 colors) {
    return Text(
      detail.content,
      style: AppTextStylesV2.bodySemiBold.copyWith(
        color: colors.txContentPrimaryDefault,
        height: DimensV2.d22 / DimensV2.d14,
      ),
    );
  }
}
