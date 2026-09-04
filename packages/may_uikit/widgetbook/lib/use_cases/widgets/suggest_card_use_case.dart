import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

const _avatarUrl = 'https://i.pravatar.cc/150?img=47';

/// Sample section with response content (both suggestion and school response).
PHXSectionEntity _buildSectionWithResponse({
  required String suggestTitle,
  required String suggestSubTitle,
  required String suggestDescription,
  required String suggestAvatarName,
  required String suggestAvatarSubtitle,
  required String suggestSubLable,
  required String responseTitle,
  required String responseSubTitle,
  required String responseDescription,
  required String responseAvatarName,
  required String responseAvatarSubtitle,
  required String responseSubLable,
}) {
  return PHXSectionEntity(
    items: [
      PHXSectionItemEntity(
        id: 405,
        title: suggestTitle,
        subTitle: suggestSubTitle,
        description: [suggestDescription],
        showDivider: true,
        avatarName: suggestAvatarName,
        avatarSubtitle: suggestAvatarSubtitle,
        avatarUrl: _avatarUrl,
        extra: PHXExtraEntity(subLable: suggestSubLable),
      ),
      PHXSectionItemEntity(
        id: 274,
        title: responseTitle,
        subTitle: responseSubTitle,
        description: [responseDescription],
        showDivider: true,
        avatarName: responseAvatarName,
        avatarSubtitle: responseAvatarSubtitle,
        extra: PHXExtraEntity(subLable: responseSubLable),
      ),
    ],
  );
}

/// Sample section without response (badge only).
PHXSectionEntity _buildSectionWithBadge({
  required String suggestTitle,
  required String suggestSubTitle,
  required String suggestDescription,
  required String suggestAvatarName,
  required String suggestAvatarSubtitle,
  required String suggestSubLable,
  required String responseTitle,
  required String badgeType,
  required String badgeContent,
}) {
  return PHXSectionEntity(
    items: [
      PHXSectionItemEntity(
        id: 366,
        title: suggestTitle,
        subTitle: suggestSubTitle,
        description: [suggestDescription],
        showDivider: true,
        avatarName: suggestAvatarName,
        avatarSubtitle: suggestAvatarSubtitle,
        avatarUrl: _avatarUrl,
        extra: PHXExtraEntity(subLable: suggestSubLable),
      ),
      PHXSectionItemEntity(
        title: responseTitle,
        badge: PHXSectionItemBadgeEntity(
          badgeType: badgeType,
          content: badgeContent,
        ),
      ),
    ],
  );
}

@UseCase(name: 'Playground', type: SuggestCardV2)

/// Builds the interactive [SuggestCardV2] playground.
Widget suggestCardUseCase(BuildContext context) {
  final colors = context.mayColors;
  final hasResponse = context.knobs.boolean(
    label: 'Has Response',
    initialValue: true,
  );
  final isInteractive = context.knobs.boolean(
    label: 'Is Interactive (onTap)',
    initialValue: false,
  );

  final suggestTitle = context.knobs.string(
    label: 'Suggest Title',
    initialValue: 'Nội dung góp ý',
  );
  final suggestSubTitle = context.knobs.string(
    label: 'Suggest SubTitle',
    initialValue: 'T5, 06/08/2026 15:41',
  );
  final suggestDescription = context.knobs.string(
    label: 'Suggest Description',
    initialValue:
        'Tôi mong muốn nhà trường cải thiện và đa dạng hóa các hoạt động ngoại khóa, '
        'giúp con phát triển kỹ năng mềm và sự tự tin.',
  );
  final suggestAvatarName = context.knobs.string(
    label: 'Suggest Avatar Name',
    initialValue: 'PH. Hồ Ngọc Trang (Demo)',
  );
  final suggestAvatarSubtitle = context.knobs.string(
    label: 'Suggest Avatar Subtitle',
    initialValue: '0362501459',
  );
  final suggestSubLable = context.knobs.string(
    label: 'Suggest SubLable',
    initialValue: 'SĐT: ',
  );

  final responseTitle = context.knobs.string(
    label: 'Response Title',
    initialValue: 'Phản hồi của nhà trường',
  );

  final PHXSectionEntity section;

  if (hasResponse) {
    final responseSubTitle = context.knobs.string(
      label: 'Response SubTitle',
      initialValue: 'T2, 10/08/2026 16:40',
    );
    final responseDescription = context.knobs.string(
      label: 'Response Description',
      initialValue: 'Nhà trường ghi nhận góp ý và sẽ update độ khó của đề.',
    );
    final responseAvatarName = context.knobs.string(
      label: 'Response Avatar Name',
      initialValue: 'GV. Hoàng Thị Hường',
    );
    final responseAvatarSubtitle = context.knobs.string(
      label: 'Response Avatar Subtitle',
      initialValue: 'PHX8386',
    );
    final responseSubLable = context.knobs.string(
      label: 'Response SubLable',
      initialValue: 'Mã giáo viên: ',
    );

    section = _buildSectionWithResponse(
      suggestTitle: suggestTitle,
      suggestSubTitle: suggestSubTitle,
      suggestDescription: suggestDescription,
      suggestAvatarName: suggestAvatarName,
      suggestAvatarSubtitle: suggestAvatarSubtitle,
      suggestSubLable: suggestSubLable,
      responseTitle: responseTitle,
      responseSubTitle: responseSubTitle,
      responseDescription: responseDescription,
      responseAvatarName: responseAvatarName,
      responseAvatarSubtitle: responseAvatarSubtitle,
      responseSubLable: responseSubLable,
    );
  } else {
    final badgeType = context.knobs.string(
      label: 'Badge Type',
      initialValue: 'INFO',
    );
    final badgeContent = context.knobs.string(
      label: 'Badge Content',
      initialValue: 'Chưa có phản hồi',
    );

    section = _buildSectionWithBadge(
      suggestTitle: suggestTitle,
      suggestSubTitle: suggestSubTitle,
      suggestDescription: suggestDescription,
      suggestAvatarName: suggestAvatarName,
      suggestAvatarSubtitle: suggestAvatarSubtitle,
      suggestSubLable: suggestSubLable,
      responseTitle: responseTitle,
      badgeType: badgeType,
      badgeContent: badgeContent,
    );
  }

  return Scaffold(
    backgroundColor: colors.background,
    body: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacingV2.xl),
        child: SizedBox(
          width: 359,
          child: SuggestCardV2(
            section: section,
            onTap: isInteractive ? () {} : null,
          ),
        ),
      ),
    ),
  );
}

@UseCase(name: 'Gallery', type: SuggestCardV2)

/// Builds the [SuggestCardV2] gallery showing both states.
Widget suggestCardGalleryUseCase(BuildContext context) {
  final colors = context.mayColors;

  final withResponseSection = PHXSectionEntity(
    items: [
      const PHXSectionItemEntity(
        id: 405,
        title: 'Nội dung góp ý',
        subTitle: 'T5, 06/08/2026 15:41',
        description: [
          'Tôi mong muốn nhà trường cải thiện và đa dạng hóa các hoạt động ngoại khóa, '
              'giúp con phát triển kỹ năng mềm và sự tự tin.',
        ],
        showDivider: true,
        avatarName: 'PH. Hồ Ngọc Trang (Demo)',
        avatarSubtitle: '0362501459',
        avatarUrl: _avatarUrl,
        extra: PHXExtraEntity(subLable: 'SĐT: '),
      ),
      
      const PHXSectionItemEntity(
        id: 274,
        title: 'Phản hồi của nhà trường',
        subTitle: 'T2, 10/08/2026 16:40',
        description: ['Nhà trường ghi nhận góp ý và sẽ update độ khó của đề.'],
        showDivider: true,
        avatarName: 'GV. Hoàng Thị Hường',
        avatarSubtitle: 'PHX8386',
        extra: PHXExtraEntity(subLable: 'Mã giáo viên: '),
      ),
    ],
  );

  final withBadgeSection = PHXSectionEntity(
    items: [
      const PHXSectionItemEntity(
        id: 366,
        title: 'Nội dung góp ý',
        subTitle: 'T3, 21/07/2026 16:10',
        description: ['Con học ok'],
        showDivider: true,
        avatarName: 'PH. Hồ Ngọc Trang (Demo)',
        avatarSubtitle: '0362501459',
        avatarUrl: _avatarUrl,
        extra: PHXExtraEntity(subLable: 'SĐT: '),
      ),
      const PHXSectionItemEntity(
        title: 'Phản hồi của nhà trường',
        badge: PHXSectionItemBadgeEntity(
          badgeType: 'INFO',
          content: 'Chưa có phản hồi',
        ),
      ),
    ],
  );

  return Scaffold(
    backgroundColor: colors.background,
    body: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacingV2.xl),
        child: SizedBox(
          width: 359,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'With Response',
                style: AppTextStylesV2.title3SemiBold.copyWith(color: colors.primaryText),
              ),
              const SizedBox(height: AppSpacingV2.md),
              SuggestCardV2(section: withResponseSection),
              const SizedBox(height: AppSpacingV2.x2l),
              Text(
                'Without Response (Badge)',
                style: AppTextStylesV2.title3SemiBold.copyWith(color: colors.primaryText),
              ),
              const SizedBox(height: AppSpacingV2.md),
              SuggestCardV2(section: withBadgeSection),
            ],
          ),
        ),
      ),
    ),
  );
}
