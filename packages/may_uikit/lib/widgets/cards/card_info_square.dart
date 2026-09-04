import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';

/// Small info card displaying an icon, title, and a large value.
/// Typically used in a grid layout (e.g., academic scores, behavior evaluations).
class CardInfoSquareV2 extends StatelessWidget {
  const CardInfoSquareV2({
    super.key,
    required this.title,
    required this.value,
    this.iconUrl,
    this.iconPath,
    this.width,
  });

  /// The description title, e.g. "Điểm TB kỳ".
  final String title;

  /// The large bold value, e.g. "100" or "Tốt".
  final String value;

  /// Network URL of the icon image.
  final String? iconUrl;

  /// Local asset path of the SVG icon.
  final String? iconPath;

  /// Optional width of the card.
  final double? width;

  @override
  /// Builds the square info card widget displaying icon, title and value.
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    return CardV2(
      width: width,
      borderRadius: AppRadiusV2.x3l,
      padding: const EdgeInsets.all(AppSpacingV2.cardLg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ThemedIconCircleV2(
            variant: ThemedIconCircleVariant.icon,
            url: iconUrl,
            svgPath: iconPath,
            width: DimensV2.d36,
            height: DimensV2.d36,
            iconSize: DimensV2.d20,
          ),
          const SizedBox(height: AppSpacingV2.xs),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStylesV2.text13Medium.copyWith(
              color: colors.txContentTertiary,
            ),
          ),
          const SizedBox(height: AppSpacingV2.x2s),
          CommonSelectableTextV2(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStylesV2.text20SemiBold.copyWith(
              color: colors.txContentPrimaryDefault,
            ),
          ),
        ],
      ),
    );
  }
}
