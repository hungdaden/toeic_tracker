import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';

/// Card for displaying an action status, e.g. "Xe đang di chuyển" - "16:01"
class ActionStatusCardV2 extends StatelessWidget {
  /// Creates a card that displays an action status [title] and [content].
  const ActionStatusCardV2({
    super.key,
    required this.title,
    required this.content,
    this.subtitle,
    this.imageUrl,
    this.onTap,
  });

  /// The main text (e.g., "Xe đang di chuyển")
  final String title;

  /// The trailing text (e.g., "16:01")
  final String content;

  /// Optional subtitle below title (e.g., "Lý do: học sinh ốm")
  final String? subtitle;

  /// Optional icon URL on the left
  final String? imageUrl;

  /// Tap callback
  final VoidCallback? onTap;

  @override

  /// Builds the action status card layout for [context].
  Widget build(BuildContext context) {
    return CardV2(
      borderRadius: AppRadiusV2.md,
      borderColor: AppColorsV2.transparent,
      onTap: onTap,
      padding: const EdgeInsets.all(
        AppSpacingV2.sm,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (imageUrl != null && imageUrl!.isNotEmpty) ...[
            CommonImageV2.network(
              url: imageUrl!,
              width: DimensV2.d8,
              height: DimensV2.d8,
            ),
            const SizedBox(width: AppSpacingV2.sm),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStylesV2.text14Medium.copyWith(
                    color: context.mayColors.txContentPrimaryDefault,
                  ),
                ),
                if (subtitle != null && subtitle!.isNotEmpty) ...[
                  const SizedBox(height: AppSpacingV2.x3s),
                  Text(
                    subtitle!,
                    style: AppTextStylesV2.text14Medium.copyWith(
                      color: context.mayColors.txContentTertiary,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: AppSpacingV2.sm),
          Text(
            content,
            style: AppTextStylesV2.text12Medium.copyWith(
              color: context.mayColors.txContentTertiary,
            ),
          ),
        ],
      ),
    );
  }
}
