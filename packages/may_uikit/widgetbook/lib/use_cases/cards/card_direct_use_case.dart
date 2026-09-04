import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

const _avatarUrl = 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200&q=80';

class _TeacherEntry {
  const _TeacherEntry({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;
}

const _defaultEntries = <_TeacherEntry>[
  _TeacherEntry(
    title: 'Nguyễn Thuỳ Linh',
    description: 'Giáo viên bộ môn',
  ),
  _TeacherEntry(
    title: 'Trần Minh Anh',
    description: 'Giáo viên chủ nhiệm',
  ),
  _TeacherEntry(
    title: 'Lê Hoàng Phúc',
    description: 'Trợ giảng',
  ),
];

@UseCase(
  name: 'Playground',
  type: CardDirectV2,
)

/// Builds the interactive [CardDirectV2] playground.
Widget cardDirectV2UseCase(BuildContext context) {
  final colors = context.mayColors;
  final itemCount = context.knobs.int.slider(
    label: 'Item count',
    initialValue: 2,
    min: 1,
    max: 5,
  );
  final showDescription = context.knobs.boolean(
    label: 'Show description',
    initialValue: true,
  );

  return Scaffold(
    backgroundColor: colors.background,
    body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacingV2.xl),
        child: CardDirectV2(
          items: [
            for (int i = 0; i < itemCount; i++)
              CardDirectItemV2(
                avatarUrl: _avatarUrl,
                title: _defaultEntries[i % _defaultEntries.length].title,
                description: showDescription
                    ? _defaultEntries[i % _defaultEntries.length].description
                    : null,
              ),
          ],
        ),
      ),
    ),
  );
}

@UseCase(
  name: 'Gallery',
  type: CardDirectV2,
)

/// Builds the [CardDirectV2] gallery showcasing common states.
Widget cardDirectV2GalleryUseCase(BuildContext context) {
  final colors = context.mayColors;

  /// Renders a labeled gallery section: a bold [label] header followed by
  /// [child] with the standard gallery spacing.
  Widget section({required String label, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacingV2.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacingV2.lg,
              vertical: AppSpacingV2.sm,
            ),
            child: Text(
              label,
              style: AppTextStylesV2.bodySemiBold.copyWith(
                color: colors.primaryText,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }

  return Scaffold(
    backgroundColor: colors.background,
    body: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacingV2.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          section(
            label: 'Default (Figma reference)',
            child: CardDirectV2(
              items: _defaultEntries
                  .take(2)
                  .map(
                    (entry) => CardDirectItemV2(
                      avatarUrl: _avatarUrl,
                      title: entry.title,
                      description: entry.description,
                    ),
                  )
                  .toList(),
            ),
          ),
          section(
            label: 'Multiple items (5)',
            child: CardDirectV2(
              items: List.generate(
                5,
                (i) => CardDirectItemV2(
                  avatarUrl: _avatarUrl,
                  title: _defaultEntries[i % _defaultEntries.length].title,
                  description: _defaultEntries[i % _defaultEntries.length].description,
                ),
              ),
            ),
          ),
          section(
            label: 'Item with border',
            child: CardDirectV2(
              items: _defaultEntries
                  .take(2)
                  .map(
                    (entry) => CardDirectItemV2(
                      avatarUrl: _avatarUrl,
                      title: entry.title,
                      description: entry.description,
                    ),
                  )
                  .toList(),
            ),
          ),
          section(
            label: 'Item with shadow',
            child: CardDirectV2(
              items: _defaultEntries
                  .take(2)
                  .map(
                    (entry) => CardDirectItemV2(
                      avatarUrl: _avatarUrl,
                      title: entry.title,
                      description: entry.description,
                    ),
                  )
                  .toList(),
            ),
          ),
          section(
            label: 'Mixed (border + shadow)',
            child: CardDirectV2(
              items: [
                CardDirectItemV2(
                  avatarUrl: _avatarUrl,
                  title: _defaultEntries[0].title,
                  description: _defaultEntries[0].description,
                ),
                CardDirectItemV2(
                  avatarUrl: _avatarUrl,
                  title: _defaultEntries[1].title,
                  description: _defaultEntries[1].description,
                ),
                CardDirectItemV2(
                  avatarUrl: _avatarUrl,
                  title: _defaultEntries[2].title,
                  description: _defaultEntries[2].description,
                ),
              ],
            ),
          ),
          section(
            label: 'No outer border',
            child: CardDirectV2(
              items: _defaultEntries
                  .take(2)
                  .map(
                    (entry) => CardDirectItemV2(
                      avatarUrl: _avatarUrl,
                      title: entry.title,
                      description: entry.description,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    ),
  );
}
