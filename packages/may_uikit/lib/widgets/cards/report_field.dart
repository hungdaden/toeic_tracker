import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';

/// Data model representing a single field in the [ReportFieldV2] component.
class ReportFieldDataV2 {
  final String title;
  final String content;
  final bool isBadge;
  final AppBadgeStatus badgeStatus;

  const ReportFieldDataV2({
    required this.title,
    required this.content,
    this.isBadge = false,
    this.badgeStatus = AppBadgeStatus.defaultBadge,
  });
}

/// A widget that displays a list of [ReportFieldDataV2] in a grid-like layout.
class ReportFieldV2 extends StatelessWidget {
  final List<ReportFieldDataV2> items;
  final bool showDivider;

  const ReportFieldV2({
    super.key,
    required this.items,
    this.showDivider = true,
  });

  /// Builds the widget tree using the provided [context].
  @override
  Widget build(BuildContext context) {
    final activeItems =
        items.where((e) => e.title.trim().isNotEmpty || e.content.trim().isNotEmpty).toList();

    if (activeItems.isEmpty) return const SizedBox.shrink();

    final colors = context.mayColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showDivider) const CommonDividerV2(),
        const SizedBox(height: AppSpacingV2.sm),
        for (int i = 0; i < activeItems.length; i += 2)
          Padding(
            padding: EdgeInsets.only(bottom: i + 2 < activeItems.length ? AppSpacingV2.sm : 0),
            child: Row(
              children: [
                Expanded(child: _buildReportBox(activeItems[i], colors)),
                const SizedBox(width: AppSpacingV2.sm),
                if (i + 1 < activeItems.length)
                  Expanded(child: _buildReportBox(activeItems[i + 1], colors))
                else
                  const Expanded(child: SizedBox.shrink()),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildReportBox(ReportFieldDataV2 field, MayThemeColorsV2 colors) {
    return PrimaryContainerV2(
      radius: AppRadiusV2.lg,
      padding: EdgeInsets.all(AppSpacingV2.xs),
      color: colors.bgGreySurface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            field.title,
            style: AppTextStylesV2.text13Medium.copyWith(color: colors.txContentSecondaryDefault),
          ),
          SizedBox(height: DimensV2.d8),
          if (field.isBadge)
            AppBadgeV2(
              status: field.badgeStatus,
              label: field.content,
            )
          else
            CommonSelectableTextV2(
              field.content,
              style: AppTextStylesV2.text14Semibold.copyWith(color: colors.txContentPrimaryDefault),
            ),
        ],
      ),
    );
  }
}
