import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';

/// Card component for displaying section items like events or articles.
///
/// Uses [entity] to display image, title, content, badge and avatars.
/// Triggers [onTap] when the card is pressed.
class CommonSectionItemCardV2 extends StatelessWidget {
  const CommonSectionItemCardV2({
    super.key,
    required this.entity,
    this.onTap,
    this.fallbackImage,
  });

  final PHXSectionItemEntity entity;
  final VoidCallback? onTap;
  final Widget? fallbackImage;

  /// Builds the visual representation of the card using the provided [context].
  @override
  Widget build(BuildContext context) {
    final badge = entity.details?.firstWhere(
      (element) => element.title?.isNotEmpty ?? false,
      orElse: () => const PHXSectionItemDetailEntity(),
    );
    final badgeStatus = AppBadgeStatus.fromCode(badge?.badgeType ?? 'DEFAULT');
    final badgeTitle = badge?.title ?? '';
    final students = entity.students ?? [];
    final colors = context.mayColors;

    return PressableCardContainerV2(
      onTap: onTap,
      color: colors.bgTabInactive,
      borderRadius: AppRadiusV2.x3l,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: DimensV2.d116,
              child: (entity.imageUrl?.isEmpty ?? true) && fallbackImage != null
                  ? fallbackImage!
                  : CommonImageV2.network(
                      url: entity.imageUrl ?? '',
                      fit: BoxFit.cover,
                      enableCache: true,
                    ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(DimensV2.d12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (entity.title?.isNotEmpty == true)
                      Text(
                        entity.title!,
                        style: AppTextStylesV2.text15Semibold
                            .copyWith(color: colors.txContentPrimaryDefault),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    if (entity.subTitle?.isNotEmpty == true) ...[
                      const SizedBox(height: DimensV2.d4),
                      Text(
                        entity.subTitle!,
                        style: AppTextStylesV2.text12Medium.copyWith(
                          color: colors.txContentTertiary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    if (entity.content?.isNotEmpty == true) ...[
                      const SizedBox(height: DimensV2.d4),
                      Text(
                        entity.content!,
                        style: AppTextStylesV2.text13Medium.copyWith(
                          color: colors.txContentSecondaryDefault,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    if (badgeTitle.isNotEmpty) ...[
                      const SizedBox(height: DimensV2.d8),
                      AppBadgeV2(
                        status: badgeStatus,
                        label: badgeTitle,
                      ),
                    ],
                    if (students.isNotEmpty) ...[
                      const SizedBox(height: DimensV2.d8),
                      Row(
                        children: [
                          if (students.length == 1) ...[
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: _buildAvatar(students.first),
                              ),
                            ),
                          ] else ...[
                            Builder(
                              builder: (context) {
                                const maxVisible = 4;
                                final isOverflow = students.length > maxVisible;
                                final visibleCount = isOverflow ? maxVisible : students.length;
                                final visibleStudents = students.take(visibleCount).toList();

                                return Expanded(
                                  child: SizedBox(
                                    height: DimensV2.d24,
                                    child: Stack(
                                      children: visibleStudents
                                          .asMap()
                                          .entries
                                          .toList()
                                          .reversed
                                          .map((e) {
                                        final isLast = isOverflow && e.key == maxVisible - 1;
                                        return Positioned(
                                          left: e.key * DimensV2.d18,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Container(
                                                width: DimensV2.d24,
                                                height: DimensV2.d24,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: _buildAvatar(e.value),
                                              ),
                                              if (isLast)
                                                Container(
                                                  width: DimensV2.d24,
                                                  height: DimensV2.d24,
                                                  decoration: BoxDecoration(
                                                    color: AppColorsV2.neutral400.withOpacity(0.8),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    ' +${students.length - 3}',
                                                    style: AppTextStylesV2.text11Medium.copyWith(
                                                        color: AppColorsV2.genericWhite,
                                                        fontWeight: FontWeight.w700),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                          if (entity.redDot == true) ...[
                            const SizedBox(width: DimensV2.d8),
                            Container(
                              width: DimensV2.d16,
                              height: DimensV2.d16,
                              margin: EdgeInsets.only(right: DimensV2.d4),
                              decoration: const BoxDecoration(
                                color: AppColorsV2.semanticCritical600,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(PHXStudentEntity student) {
    return SizedBox(
      width: DimensV2.d24,
      height: DimensV2.d24,
      child: CommonAvatarV2(
        imageUrl: student.avatarUrl ?? '',
        radius: DimensV2.d24,
      ),
    );
  }
}
