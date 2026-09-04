import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';

/// Renders the detail content for a PHX section.
class PHXSectionDetailContentV2 extends StatelessWidget {
  final List<PHXSectionItemEntity> items;
  final Widget? fallbackImage;
  final void Function(String url)? onExtraButtonTap;
  final void Function(String url)? onLinkTap;

  const PHXSectionDetailContentV2({
    super.key,
    required this.items,
    this.fallbackImage,
    this.onExtraButtonTap,
    this.onLinkTap,
  });

  /// Builds the section detail content widget tree.
  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const SizedBox();
    }

    final extraBtn = items.last.extra;
    final hasExtraButton = _hasExtraButton(extraBtn);
    final contentItems = hasExtraButton ? items.sublist(0, items.length - 1) : items;
    final item0 = contentItems.isNotEmpty ? contentItems[0] : null;
    final item1 = contentItems.length > 1 ? contentItems[1] : null;
    final htmlContent = _htmlContent(item0);
    final hasMainCard = item0 != null && _hasMainCardContent(item0, htmlContent);
    final hasInfoCard = item1 != null && _hasInfoCardContent(item1);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (hasMainCard) ...[
                  _buildMainCard(context, item0, htmlContent),
                  const SizedBox(height: DimensV2.d8),
                ],
                if (hasInfoCard)
                  Padding(
                    padding: EdgeInsets.only(bottom: hasExtraButton ? DimensV2.d8 : DimensV2.d0),
                    child: CardInfoV2(
                      entity: item1,
                      hasShadow: false,
                      colorBackground: AppColorsV2.transparent,
                    ),
                  ),
                if (hasExtraButton)
                  Padding(
                    padding: const EdgeInsets.only(top: DimensV2.d12),
                    child: CommonButtonV2(
                      label: extraBtn?.navigatorButtonName?.isNotEmpty == true
                          ? extraBtn!.navigatorButtonName!
                          : extraBtn?.title ?? '',
                      onTap: () {
                        if (extraBtn?.registerLink?.isNotEmpty == true) {
                          onExtraButtonTap?.call(extraBtn!.registerLink!);
                        }
                      },
                    ),
                  ),
                const SizedBox(height: DimensV2.d20),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMainCard(
    BuildContext context,
    PHXSectionItemEntity item,
    String htmlContent,
  ) {
    final students = item.students;

    return CardV2(
      padding: EdgeInsets.zero,
      shadowColor: AppColorsV2.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppRadiusV2.xl),
            ),
            child: SizedBox(
              width: double.infinity,
              child: item.imageUrl?.isNotEmpty == true
                  ? CommonImageV2.network(
                      url: item.imageUrl!,
                      fit: BoxFit.cover,
                      height: DimensV2.d225,
                      enableCache: true,
                      fadeInDuration: Duration.zero,
                    )
                  : Container(
                      height: DimensV2.d225,
                      color: AppColorsV2.neutral100,
                      child: Center(
                        child: fallbackImage ?? const SizedBox(),
                      ),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(DimensV2.d16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (item.title?.isNotEmpty == true)
                  Text(
                    item.title!,
                    style: AppTextStylesV2.text16Semibold.copyWith(
                      color: context.mayColors.txContentPrimaryDefault,
                    ),
                  ),
                if (item.subTitle?.isNotEmpty == true) ...[
                  const SizedBox(height: DimensV2.d8),
                  Text(
                    item.subTitle!,
                    style: AppTextStylesV2.text13Medium.copyWith(
                      color: context.mayColors.txContentTertiary,
                    ),
                  ),
                ],
                if (item.badge != null)
                  Padding(
                    padding: const EdgeInsets.only(top: DimensV2.d8),
                    child: AppBadgeV2(
                      label: item.badge?.title ?? item.badge?.content ?? '',
                      status: AppBadgeStatus.fromCode(item.badge?.badgeType ?? ''),
                    ),
                  ),
                if (students != null && students.isNotEmpty) ...[
                  const SizedBox(height: DimensV2.d8),
                  _buildStudents(context, students),
                ],
                if (htmlContent.isNotEmpty) ...[
                  const SizedBox(height: DimensV2.d16),
                  _buildHtml(item, htmlContent),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStudents(BuildContext context, List<PHXStudentEntity> students) {
    return Column(
      children: [
        for (int i = 0; i < students.length; i += 2)
          Padding(
            padding: EdgeInsets.only(
              bottom: (i + 2 < students.length) ? DimensV2.d8 : 0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(child: _buildStudent(context, students[i])),
                if (i + 1 < students.length) ...[
                  const SizedBox(width: DimensV2.d12),
                  Expanded(child: _buildStudent(context, students[i + 1])),
                ] else if (students.length > 1) ...[
                  const SizedBox(width: DimensV2.d12),
                  const Expanded(child: SizedBox()),
                ],
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildStudent(BuildContext context, PHXStudentEntity student) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildAvatar(student),
        const SizedBox(width: DimensV2.d8),
        Flexible(
          child: Text(
            student.name ?? '',
            style: AppTextStylesV2.text13Medium.copyWith(
              color: context.mayColors.txContentSecondaryDefault,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }

  Widget _buildHtml(
    PHXSectionItemEntity item,
    String htmlContent,
  ) {
    return Text(
      htmlContent,
      style: AppTextStylesV2.text14Regular.copyWith(
        color: AppColorsV2.neutral700,
      ),
    );
  }

  String _htmlContent(PHXSectionItemEntity? item) {
    final description = item?.description;
    if (description == null || description.isEmpty) {
      return '';
    }

    final content = description.length > 1 ? description[1] : description[0];
    return content.replaceAll('\n', '<br>');
  }

  bool _hasMainCardContent(PHXSectionItemEntity item, String htmlContent) {
    return item.imageUrl?.isNotEmpty == true ||
        item.title?.isNotEmpty == true ||
        item.subTitle?.isNotEmpty == true ||
        item.badge != null ||
        item.students?.isNotEmpty == true ||
        htmlContent.isNotEmpty;
  }

  bool _hasInfoCardContent(PHXSectionItemEntity item) {
    return item.title?.isNotEmpty == true ||
        item.subTitle?.isNotEmpty == true ||
        item.content?.isNotEmpty == true ||
        item.imageUrl?.isNotEmpty == true ||
        item.details?.isNotEmpty == true ||
        item.badge != null ||
        item.bottomInfo != null ||
        item.avatarUrl?.isNotEmpty == true ||
        item.avatarName?.isNotEmpty == true;
  }

  bool _hasExtraButton(PHXExtraEntity? extra) {
    return extra != null &&
        (extra.navigatorButtonName?.isNotEmpty == true || extra.title?.isNotEmpty == true);
  }

  Widget _buildAvatar(PHXStudentEntity student) {
    return SizedBox(
      width: DimensV2.d24,
      height: DimensV2.d24,
      child: CommonAvatarV2(
        imageUrl: student.avatarUrl ?? '',
      ),
    );
  }
}
