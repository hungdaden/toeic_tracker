import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';

/// Interface for detail items inside the student selector card.
abstract class StudentSelectorDetailEntityV2 {
  /// Header or label of the detail item.
  String? get title;

  /// Text content of the detail item.
  String? get content;

  /// Optional badge status type (e.g., critical, success).
  String? get badgeType;

  /// Optional flag indicating whether to show divider below this item.
  bool? get showDivider;

  /// Optional flag indicating whether this item should break to a new full row.
  bool? get isBreakLine;
}

/// Interface representing the student entity used in the student selector list.
abstract class StudentSelectorEntityV2<T extends StudentSelectorDetailEntityV2> {
  /// Unique identifier of the student.
  int? get id;

  /// Display name of the student.
  String? get title;

  /// Optional subtitle displayed below the student name on the card.
  String? get subTitle;

  /// Avatar image URL.
  String? get imageUrl;

  /// Session token associated with the student.
  String? get token;

  /// List of detail rows shown on the card.
  List<T>? get details;

  /// Optional flag indicating whether to show red dot on card.
  bool? get redDot => null;
}

/// Data used by student selector UIs to render one student card.
class StudentSelectorDataV2 {
  /// Creates a student card data item for shared student selector screens.
  StudentSelectorDataV2({
    required this.entity,
    String? subtitle,
    this.bottomContent,
    this.showTrailingArrow = true,
    this.isFullRowBuilder,
  }) : _subtitle = subtitle;

  /// The concrete entity model holding student properties.
  final StudentSelectorEntityV2<StudentSelectorDetailEntityV2> entity;

  /// Optional bottom content passed through to [StudentCardV2].
  final Widget? bottomContent;

  /// Whether to show the trailing navigation arrow icon.
  final bool showTrailingArrow;

  final String? _subtitle;

  /// Optional builder to determine if a detail item should take up a full row.
  final bool Function(StudentSelectorDetailEntityV2)? isFullRowBuilder;

  /// Student display name.
  String get name => entity.title ?? '';

  /// Subtitle from entity, with optional manual override via constructor.
  String? get subtitle => _subtitle ?? entity.subTitle;

  /// Optional student avatar URL.
  String? get avatarUrl => entity.imageUrl;

  /// Optional student-specific session token.
  String? get token => entity.token;

  /// Whether to show the red dot.
  bool get redDot => entity.redDot ?? false;

  /// Additional card rows mapped from the entity details.
  List<CardDataV2> get cardData {
    final detailsList = entity.details;
    if (detailsList == null) return const [];

    final dividerIndex = detailsList.indexWhere((info) => info.showDivider == true);
    final visibleList = dividerIndex != -1 ? detailsList.sublist(0, dividerIndex + 1) : detailsList;

    return visibleList.map((info) {
      return CardDataV2(
        label: info.title ?? '',
        content: info.content ?? '',
        isBadge: info.badgeType != null && info.badgeType!.isNotEmpty,
        badgeStatus: AppBadgeStatus.fromCode(info.badgeType),
        isFullRow: info.isBreakLine == true || (isFullRowBuilder?.call(info) ?? false),
      );
    }).toList();
  }

  /// List of report fields parsed from items after showDivider == true.
  List<ReportFieldDataV2>? get reportFields {
    final detailsList = entity.details;
    if (detailsList == null || detailsList.isEmpty) return null;

    final dividerIndex = detailsList.indexWhere((info) => info.showDivider == true);
    if (dividerIndex == -1 || dividerIndex == detailsList.length - 1) {
      return null;
    }

    final reportItems = detailsList.sublist(dividerIndex + 1);
    return reportItems.map((info) {
      return ReportFieldDataV2(
        title: info.title ?? '',
        content: info.content ?? '',
        isBadge: info.badgeType != null && info.badgeType!.isNotEmpty,
        badgeStatus: AppBadgeStatus.fromCode(info.badgeType),
      );
    }).toList();
  }
}

/// Shared student selector UI used across apps/packages.
class StudentSelectorViewV2 extends StatelessWidget {
  /// Global callback to trigger whenever a student's token is received.
  static Future<void> Function(String? token, int? studentId)? onGlobalTokenReceived;

  /// Creates a shared student selector from typed data.
  const StudentSelectorViewV2({
    super.key,
    required this.students,
    this.isLoading = false,
    this.isEmpty = false,
    this.title = '',
    this.subtitle = '',
    this.scrollController,
    this.isScrollable = true,
    this.padding,
    this.emptyStateTitle = 'Trống',
    this.emptyStateDescription = 'Dữ liệu đang trống',
    this.onRefresh,
    this.onStudentSelected,
  });

  /// Students shown in the list.
  final List<StudentSelectorDataV2> students;

  /// Whether to show full-view loading.
  final bool isLoading;

  /// Whether to show full-view empty state.
  final bool isEmpty;

  /// Optional section title.
  final String title;

  /// Optional section subtitle.
  final String subtitle;

  /// Optional scroll controller owned by the host app.
  final ScrollController? scrollController;

  /// Whether this widget owns scroll behavior.
  final bool isScrollable;

  /// Outer list padding.
  final EdgeInsetsGeometry? padding;

  /// Title shown in the empty state.
  final String emptyStateTitle;

  /// Description shown in the empty state.
  final String emptyStateDescription;

  /// Called when the selector is pulled to refresh.
  final RefreshCallback? onRefresh;

  /// Called when one student card is selected.
  final void Function(StudentSelectorDataV2 student, int index)? onStudentSelected;

  bool get _hasTitle => title.trim().isNotEmpty;

  bool get _showEmpty => isEmpty;

  int get _itemCount {
    var count = students.length;
    if (_hasTitle) count++;
    return count;
  }

  /// Builds the shared list UI.
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final content = isLoading
        ? _buildFullViewState(
            context,
            child: CommonLoadingIndicatorV2(
              labelColor: isDark ? null : AppColorsV2.genericWhite,
            ),
          )
        : _showEmpty
            ? EmptyStateWidgetV2(
                title: emptyStateTitle,
                description: emptyStateDescription,
              )
            : ListView.separated(
                controller: isScrollable ? scrollController : null,
                shrinkWrap: !isScrollable,
                physics: isScrollable
                    ? const AlwaysScrollableScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                padding: _effectivePadding(context),
                itemCount: _itemCount,
                separatorBuilder: (_, index) => SizedBox(
                  height: _hasTitle && index == 0 ? AppSpacingV2.lg : AppSpacingV2.sm,
                ),
                itemBuilder: _buildItem,
              );

    if (onRefresh == null) {
      return content;
    }

    return AppRefreshIndicator(
      onRefresh: onRefresh!,
      child: content,
    );
  }

  Widget _buildFullViewState(BuildContext context, {required Widget child}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView(
          controller: isScrollable ? scrollController : null,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: _effectivePadding(context),
                child: child,
              ),
            ),
          ],
        );
      },
    );
  }

  EdgeInsetsGeometry _effectivePadding(BuildContext context) {
    return padding ??
        EdgeInsets.fromLTRB(
          AppSpacingV2.screenHorizontal,
          AppDimenV2.of(context).paddingTop,
          AppSpacingV2.screenHorizontal,
          AppDimenV2.of(context).glassBottomBarHeight + AppSpacingV2.lg,
        );
  }

  Widget _buildItem(BuildContext context, int index) {
    var itemIndex = index;
    if (_hasTitle) {
      if (index == 0) return _StudentSelectorListTitle(title: title, subtitle: subtitle);
      itemIndex--;
    }

    final student = students[itemIndex];
    return _StudentSelectorListItem(
      student: student,
      onTap: student.showTrailingArrow
          ? () {
              int? sId;
              try {
                sId = (student.entity as dynamic).studentId as int?;
              } catch (_) {}
              StudentSelectorViewV2.onGlobalTokenReceived?.call(
                student.token,
                sId,
              );
              onStudentSelected?.call(student, itemIndex);
            }
          : null,
    );
  }
}

/// Shared builders for student selector UIs.
mixin StudentSelectorCommonMixin {
  /// Builds one student card from [student].
  Widget studentCardBuilder({
    required StudentSelectorDataV2 student,
    VoidCallback? onTap,
  }) {
    return StudentCardV2(
      name: student.name,
      subTitle: student.subtitle,
      avatarUrl: student.avatarUrl,
      cardData: student.cardData,
      reportFields: student.reportFields,
      onTap: onTap,
      showTrailingArrow: student.showTrailingArrow,
      redDot: student.redDot,
    );
  }
}

/// Screen-level mixin for shared student selector screens.
mixin StudentSelectorMixin<T extends StatefulWidget> on State<T> {
  /// Students shown by [buildStudentSelector].
  List<StudentSelectorDataV2> items = const [];

  /// Whether to render a full-view loading indicator.
  bool isLoading = false;

  /// Whether to render a full-view empty state.
  bool isEmpty = false;

  /// Optional section title.
  String title = '';

  /// Optional section subtitle.
  String subtitle = '';

  /// Called when a student card is tapped.
  void Function(StudentSelectorDataV2 student, int index)? onStudentSelected;

  /// Called when the selector is pulled to refresh.
  RefreshCallback? onRefresh;

  /// Optional controller owned by the host screen.
  ScrollController? scrollController;

  /// Whether the list owns its scrolling surface.
  bool isScrollable = true;

  /// Outer padding for the shared list body.
  EdgeInsetsGeometry? padding;

  /// Title shown in the empty state.
  String emptyStateTitle = 'Trống';

  /// Description shown in the empty state.
  String emptyStateDescription = 'Dữ liệu đang trống';

  /// Builds the shared student selector UI.
  Widget get buildStudentSelector {
    return StudentSelectorViewV2(
      students: items,
      isLoading: isLoading,
      isEmpty: isEmpty,
      title: title,
      subtitle: subtitle,
      scrollController: scrollController,
      isScrollable: isScrollable,
      padding: padding,
      emptyStateTitle: emptyStateTitle,
      emptyStateDescription: emptyStateDescription,
      onRefresh: onRefresh,
      onStudentSelected: onStudentSelected,
    );
  }
}

class _StudentSelectorListTitle extends StatelessWidget {
  const _StudentSelectorListTitle({
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  /// Builds the section title content.
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTextStylesV2.text20SemiBold.copyWith(
            color: AppColorsV2.genericWhite,
          ),
          textAlign: TextAlign.center,
        ),
        if (subtitle.trim().isNotEmpty) ...[
          const SizedBox(height: AppSpacingV2.x3s),
          Text(
            subtitle,
            style: AppTextStylesV2.text13Medium.copyWith(
              color: context.mayColors.txContentSecondaryDefault,
            ),
          ),
        ],
      ],
    );
  }
}

class _StudentSelectorListItem extends StatelessWidget {
  const _StudentSelectorListItem({
    required this.student,
    this.onTap,
  });

  final StudentSelectorDataV2 student;
  final VoidCallback? onTap;

  /// Builds one selectable student card.
  @override
  Widget build(BuildContext context) {
    return StudentCardV2(
      name: student.name,
      subTitle: student.subtitle,
      avatarUrl: student.avatarUrl,
      cardData: student.cardData,
      reportFields: student.reportFields,
      onTap: onTap,
      showTrailingArrow: student.showTrailingArrow,
      redDot: student.redDot,
    );
  }
}
