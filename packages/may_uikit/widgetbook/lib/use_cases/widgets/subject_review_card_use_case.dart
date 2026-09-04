import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

const _avatarUrl = 'https://i.pravatar.cc/150?img=47';

const _defaultDescriptions = [
  'Điểm khảo sát đầu năm học của con là: 7.0.',
  'Kiến thức đọc hiểu thể loại của con tương đối tốt. '
      'Con cần chú ý hơn trong '
      'cách diễn đạt khi trả lời những câu hỏi ngắn.',
  'Chú ý viết câu gọn và rõ về nghĩa. Dạng bài nghị luận về một tác phẩm '
      'truyện của con còn sa đà vào việc kể lại nội dung.',
  'Con cần chú ý sử dụng các thao tác lập luận, phân tích, đánh giá, so sánh '
      'để làm sáng tỏ vấn đề.',
  'Con chịu khó đọc thêm sách tham khảo để học cách viết văn sâu '
      'và sắc vấn '
      'đề hơn nhé.',
];

@UseCase(
  name: 'Playground',
  type: SubjectReviewCardV2,
)
/// Builds the interactive [SubjectReviewCardV2] playground.
Widget subjectReviewCardUseCase(BuildContext context) {
  final colors = context.mayColors;
  final descriptions = context.knobs
      .string(
        label: 'Descriptions',
        initialValue: _defaultDescriptions.join('\n'),
      )
      .split('\n')
      .where((description) => description.trim().isNotEmpty)
      .toList();
  final isInteractive = context.knobs.boolean(
    label: 'Is Interactive (onTap)',
    initialValue: true,
  );

  return Scaffold(
    backgroundColor: colors.background,
    body: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacingV2.xl),
        child: SizedBox(
          width: 351,
          child: SubjectReviewCardV2(
            title: context.knobs.string(
              label: 'Title',
              initialValue: 'Nhận xét môn Toán học',
            ),
            subtitle: context.knobs.string(
              label: 'Subtitle',
              initialValue: '15/08/2026 09:00',
            ),
            descriptions: descriptions,
            reviewerName: context.knobs.string(
              label: 'Reviewer Name',
              initialValue: 'Nguyễn Thuỳ Linh',
            ),
            reviewerRole: context.knobs.string(
              label: 'Reviewer Role',
              initialValue: 'Giáo viên bộ môn',
            ),
            reviewerAvatarUrl: context.knobs.string(
              label: 'Reviewer Avatar URL',
              initialValue: _avatarUrl,
            ),
            onTap: isInteractive ? () {} : null,
          ),
        ),
      ),
    ),
  );
}

@UseCase(
  name: 'Gallery',
  type: SubjectReviewCardV2,
)
/// Builds the [SubjectReviewCardV2] gallery.
Widget subjectReviewCardGalleryUseCase(BuildContext context) {
  final colors = context.mayColors;

  return Scaffold(
    backgroundColor: colors.background,
    body: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacingV2.xl),
        child: const SizedBox(
          width: 351,
          child: SubjectReviewCardV2(
            title: 'Nhận xét môn Toán học',
            subtitle: '15/08/2026 09:00',
            descriptions: _defaultDescriptions,
            reviewerName: 'Nguyễn Thuỳ Linh',
            reviewerRole: 'Giáo viên bộ môn',
            reviewerAvatarUrl: _avatarUrl,
          ),
        ),
      ),
    ),
  );
}
