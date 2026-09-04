// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../may_uikit.dart';

part 'phx_screen_response.freezed.dart';

/// Response class representing the root of the server-driven UI response.
@freezed
sealed class PHXScreenResponseEntity with _$PHXScreenResponseEntity {
  /// Private constructor for [PHXScreenResponseEntity].
  const PHXScreenResponseEntity._();

  /// Constructor for [PHXScreenResponseEntity].
  const factory PHXScreenResponseEntity({PHXScreenDataEntity? data}) = _PHXScreenResponseEntity;
}

/// Data payload class inside [PHXScreenResponseEntity] that holds all UI components.
@freezed
sealed class PHXScreenDataEntity with _$PHXScreenDataEntity {
  /// Private constructor for [PHXScreenDataEntity].
  const PHXScreenDataEntity._();

  /// Constructor for [PHXScreenDataEntity].
  const factory PHXScreenDataEntity({
    PHXAppBarEntity? appBar,
    PHXHeaderInfoEntity? headerInfo,
    @Default([]) List<PHXTabEntity>? tabs,
    @Default([]) List<PHXSectionEntity>? sections,
    @Default([]) List<PHXSectionEntity>? sectionsBottomSheet,
    @Default([]) List<PHXListOptionEntity>? listOptions,
    @Default([]) List<PHXBottomActionEntity>? bottomActions,
    @Default(PHXTableEntity()) PHXTableEntity? table,
    PHXEmptyStateEntity? emptyState,
  }) = _PHXScreenDataEntity;
}

/// Header information entity holding title, content, and avatar.
@freezed
sealed class PHXHeaderInfoEntity with _$PHXHeaderInfoEntity {
  /// Private constructor for [PHXHeaderInfoEntity].
  const PHXHeaderInfoEntity._();

  /// Constructor for [PHXHeaderInfoEntity].
  const factory PHXHeaderInfoEntity({
    @Default('') String? title,
    @Default('') String? content,
    @Default('') String? avatar,
  }) = _PHXHeaderInfoEntity;
}

/// AppBar information entity holding title and subTitle.
@freezed
sealed class PHXAppBarEntity with _$PHXAppBarEntity {
  /// Private constructor for [PHXAppBarEntity].
  const PHXAppBarEntity._();

  /// Constructor for [PHXAppBarEntity].
  const factory PHXAppBarEntity({
    @Default('') String? title,
    @Default('') String? subTitle,
  }) = _PHXAppBarEntity;
}

/// Tab entity containing attributes to control tab behavior and display.
@freezed
sealed class PHXTabEntity with _$PHXTabEntity {
  /// Private constructor for [PHXTabEntity].
  const PHXTabEntity._();

  /// Constructor for [PHXTabEntity].
  const factory PHXTabEntity({
    @Default('') String? title,
    @Default(0) int? id,
    @Default('') String? code,
    @Default('') String? content,
    @Default(false) bool? isTarget,
    @Default(false) bool? isActive,
    @Default(null) int? count,
    @Default(null) PHXExtraEntity? extra,
  }) = _PHXTabEntity;
}

/// Section entity grouping items together with a title.
@freezed
sealed class PHXSectionEntity with _$PHXSectionEntity {
  /// Private constructor for [PHXSectionEntity].
  const PHXSectionEntity._();

  /// Constructor for [PHXSectionEntity].
  const factory PHXSectionEntity({
    @Default('') String? title,
    @Default('') String? heading,
    @Default('') String? iconUrl,
    @Default([]) List<PHXSectionEntity>? bottomSheet,
    @Default([]) List<PHXSectionItemEntity>? items,
    @Default(null) PHXExtraEntity? extra,
  }) = _PHXSectionEntity;
}

/// Section item entity representing a single item within a section.
@freezed
sealed class PHXSectionItemEntity
    with _$PHXSectionItemEntity
    implements
        StudentSelectorEntityV2<PHXSectionItemDetailEntity>,
        CardInfoEntityV2<PHXSectionItemDetailEntity> {
  /// Private constructor for [PHXSectionItemEntity].
  const PHXSectionItemEntity._();

  @override
  String? get token => null;

  /// Constructor for [PHXSectionItemEntity].
  const factory PHXSectionItemEntity({
    @Default(0) int? id,
    @Default('') String? title,
    @Default('') String? content,
    @Default('') String? subTitle,
    @Default([]) List<String>? description,
    @Default('') String? imageUrl,
    @Default(false) bool? isNext,
    @Default(false) bool? showDivider,
    @Default(false) bool? hasAvatar,
    @Default(null) List<PHXSectionItemDetailEntity>? details,
    @Default(null) PHXSectionItemBadgeEntity? badge,
    @Default(null) PHXSectionItemBottomInfoEntity? bottomInfo,
    @Default(null) PHXExtraEntity? extra,
    @Default('') String? avatarName,
    @Default('') String? avatarSubtitle,
    @Default('') String? avatarUrl,
    @Default([]) List<PHXStudentEntity>? students,
    @Default(0) int? studentId,
    @Default(false) bool? redDot,
    @Default('') String? uuid,
    @Default(null) List<PHXMultiBadgeEntity>? multiBadge,
    @Default(null) PHXPayloadEntity? payload,
  }) = _PHXSectionItemEntity;
}

/// Typed payload entity holding notification and business action parameters.
@freezed
sealed class PHXPayloadEntity with _$PHXPayloadEntity {
  const PHXPayloadEntity._();

  const factory PHXPayloadEntity({
    @Default('') String? action,
    @Default('') String? type,
    @Default('') String? title,
    @Default('') String? content,
    @Default('') String? notificationId,
    @Default('') String? studentCode,
    @Default('') String? attendanceLessonId,
    @Default('') String? assignId,
    @Default('') String? subsystem,
    @Default('') String? status,
    @Default('') String? eventType,
    @Default('') String? classroomName,
    @Default('') String? schoolYearId,
    @Default('') String? borrowTicketState,
    @Default('') String? id,
    @Default('') String? studentId,
    @Default('') String? quickExaminationId,
    @Default('') String? orderId,
    @Default('') String? feedbackId,
    @Default('') String? typeDetail,
    @Default('') String? inappNotiId,
    @Default('') String? hasShareMessage,
    @Default('') String? monthId,
    @Default('') String? schoolTermId,
    @Default('') String? code,
    @Default('') String? requestId,
    @Default('') String? schoolId,
    @Default('') String? isCancelRequest,
  }) = _PHXPayloadEntity;

  ///
  Map<String, dynamic> toMap() => {
        'action': action,
        'type': type,
        'title': title,
        'content': content,
        'notification_id': notificationId,
        'student_code': studentCode,
        'attendance_lesson_id': attendanceLessonId,
        'assign_id': assignId,
        'subsystem': subsystem,
        'status': status,
        'event_type': eventType,
        'classroom_name': classroomName,
        'school_year_id': schoolYearId,
        'borrow_ticket_state': borrowTicketState,
        'id': id,
        'student_id': studentId,
        'quick_examination_id': quickExaminationId,
        'order_id': orderId,
        'feedback_id': feedbackId,
        'type_detail': typeDetail,
        'inapp_noti_id': inappNotiId,
        'hasShareMessage': hasShareMessage,
        'month_id': monthId,
        'school_term_id': schoolTermId,
        'request_id': requestId,
        'school_id': schoolId,
        'is_cancel_request': isCancelRequest,
      };
}

/// Multi-badge entity for notification multi-badges.
@freezed
sealed class PHXMultiBadgeEntity with _$PHXMultiBadgeEntity {
  const PHXMultiBadgeEntity._();

  const factory PHXMultiBadgeEntity({
    @Default('') String? badgeType,
    @Default('') String? content,
    @Default('') String? title,
  }) = _PHXMultiBadgeEntity;
}

/// Student entity for bottom action student lists.
@freezed
sealed class PHXStudentEntity with _$PHXStudentEntity {
  const PHXStudentEntity._();

  const factory PHXStudentEntity({
    @Default(0) int? id,
    @Default(0) int? studentId,
    @Default('') String? name,
    @Default('') String? avatarUrl,
    @Default('') String? subTitle,
  }) = _PHXStudentEntity;
}

/// Detail item entity within a section item details list.
@freezed
sealed class PHXSectionItemDetailEntity
    with _$PHXSectionItemDetailEntity
    implements StudentSelectorDetailEntityV2, CardInfoDetailEntityV2 {
  /// Private constructor for [PHXSectionItemDetailEntity].
  const PHXSectionItemDetailEntity._();

  /// Constructor for [PHXSectionItemDetailEntity].
  const factory PHXSectionItemDetailEntity({
    @Default(0) int? id,
    @Default('') String? title,
    @Default('') String? content,
    @Default([]) List<PHXSectionItemDetailIconEntity>? icon,
    @Default([]) List<PHXSectionContentTypeEntity>? type,
    @Default(false) bool? showDivider,
    @Default(false) bool? isBreakLine,
    @Default(false) bool? isJustify,
    @Default('default') String? badgeType,
    @Default(null) PHXSectionItemBadgeEntity? badge,
    @Default(false) bool? isActionItem,
    @Default('') String? imageUrl,
    @Default(null) PHXExtraEntity? extra,
  }) = _PHXSectionItemDetailEntity;
}

/// Icon and action configuration for detail items.
@freezed
sealed class PHXSectionItemDetailIconEntity
    with _$PHXSectionItemDetailIconEntity
    implements CardInfoDetailIconEntityV2 {
  /// Private constructor for [PHXSectionItemDetailIconEntity].
  const PHXSectionItemDetailIconEntity._();

  /// Constructor for [PHXSectionItemDetailIconEntity].
  const factory PHXSectionItemDetailIconEntity({
    @Default('') String? url,
    @Default('') String? action,
  }) = _PHXSectionItemDetailIconEntity;
}

/// Content type configuration entity for detail items.
///
/// Dùng để xác định kiểu hiển thị và trạng thái tương tác của một trường trong form.
@freezed
sealed class PHXSectionContentTypeEntity with _$PHXSectionContentTypeEntity {
  /// Private constructor for [PHXSectionContentTypeEntity].
  const PHXSectionContentTypeEntity._();

  /// Creates a [PHXSectionContentTypeEntity] with content type flags.
  ///
  /// - [isDisable] : trường bị vô hiệu hoá (chỉ đọc, không thể chỉnh sửa).
  /// - [isEnable]  : trường được kích hoạt (có thể chỉnh sửa).
  /// - [isTextArea]: trường hiển thị dưới dạng text area nhiều dòng.
  const factory PHXSectionContentTypeEntity({
    @Default(false) bool? isDisable,
    @Default(false) bool? isEnable,
    @Default(false) bool? isTextArea,
  }) = _PHXSectionContentTypeEntity;
}

/// Badge information for section items.
@freezed
sealed class PHXSectionItemBadgeEntity
    with _$PHXSectionItemBadgeEntity
    implements CardInfoBadgeEntityV2 {
  /// Private constructor for [PHXSectionItemBadgeEntity].
  const PHXSectionItemBadgeEntity._();

  /// Constructor for [PHXSectionItemBadgeEntity].
  const factory PHXSectionItemBadgeEntity({
    @Default('') String? title,
    @Default('') String? content,
    @Default('default') String? badgeType,
  }) = _PHXSectionItemBadgeEntity;
}

/// Bottom information for contact/avatar display on section items.
@freezed
sealed class PHXSectionItemBottomInfoEntity
    with _$PHXSectionItemBottomInfoEntity
    implements CardInfoBottomInfoEntityV2 {
  /// Private constructor for [PHXSectionItemBottomInfoEntity].
  const PHXSectionItemBottomInfoEntity._();

  /// Constructor for [PHXSectionItemBottomInfoEntity].
  const factory PHXSectionItemBottomInfoEntity({
    @Default('') String? title,
    @Default('') String? subTitle,
    @Default('') String? avatarUrl,
    @Default(false) bool? isContact,
    @Default(false) bool? showDivider,
    @Default([]) List<PHXSectionItemDetailIconEntity>? icon,
  }) = _PHXSectionItemBottomInfoEntity;
}

/// Selectable option item in list options.
@freezed
sealed class PHXListOptionEntity with _$PHXListOptionEntity {
  /// Private constructor for [PHXListOptionEntity].
  const PHXListOptionEntity._();

  /// Constructor for [PHXListOptionEntity].
  const factory PHXListOptionEntity({
    @Default(0) int? id,
    @Default('') String? code,
    @Default('') String? title,
    @Default(false) bool? isActive,
    @Default(null) PHXExtraEntity? extra,
  }) = _PHXListOptionEntity;
}

/// Bottom action item for buttons at the bottom of the screen.
@freezed
sealed class PHXBottomActionEntity with _$PHXBottomActionEntity {
  /// Private constructor for [PHXBottomActionEntity].
  const PHXBottomActionEntity._();

  /// Constructor for [PHXBottomActionEntity].
  const factory PHXBottomActionEntity({
    @Default('') String? title,
    @Default('') String? icon,
    @Default('') String? type,
    @Default(null) PHXExtraEntity? extra,
    @Default(null) PHXBottomSheetEntity? bottomSheet,
    @Default(false) bool? isHiddenAction,
    @Default(false) bool? isShowSubTitle,
    @Default('') String? subTitle,
    @Default(null) List<PHXStudentEntity>? students,
  }) = _PHXBottomActionEntity;
}

/// Bottom sheet configuration for actions.
@freezed
sealed class PHXBottomSheetEntity with _$PHXBottomSheetEntity {
  /// Private constructor for [PHXBottomSheetEntity].
  const PHXBottomSheetEntity._();

  /// Constructor for [PHXBottomSheetEntity].
  const factory PHXBottomSheetEntity({
    @Default('') String? sheetTitle,
    @Default([]) List<String>? sheetDescription,
    @Default('') String? bottomSheetType,
    @Default([]) List<PHXBottomSheetContentEntity>? sheetContent,
  }) = _PHXBottomSheetEntity;
}

@freezed

/// Content entity for bottom sheet items.
sealed class PHXBottomSheetContentEntity with _$PHXBottomSheetContentEntity {
  const PHXBottomSheetContentEntity._();
  const factory PHXBottomSheetContentEntity({
    @Default(0) int? id,
    @Default('') String? title,
    @Default('') String? subTitle,
    @Default('') String? imageUrl,
    @Default('') String? content,
  }) = _PHXBottomSheetContentEntity;
}

/// Entity cho nội dung modal dữ liệu
@freezed
sealed class PHXDataModalContentEntity with _$PHXDataModalContentEntity {
  const factory PHXDataModalContentEntity({
    String? title,
    String? titleColor,
    String? content,
    bool? showDivider,
    bool? isItalics,
  }) = _PHXDataModalContentEntity;
}

/// Entity cho modal dữ liệu
@freezed
sealed class PHXDataModalEntity with _$PHXDataModalEntity {
  const factory PHXDataModalEntity({
    String? title,
    @Default([]) List<PHXDataModalTabEntity>? tabs,
    @Default([]) List<PHXDataModalContentEntity>? content,
  }) = _PHXDataModalEntity;
}

/// Extra parameters entity model containing business-specific parameters.
@freezed
sealed class PHXExtraEntity with _$PHXExtraEntity {
  /// Private constructor for [PHXExtraEntity].
  const PHXExtraEntity._();

  /// Constructor for [PHXExtraEntity].
  const factory PHXExtraEntity({
    @Default(null) int? teacherId,
    @Default('') String? phoneNumber,
    @Default(0) int? groupId,
    @Default(false) bool? callModalData,
    @Default(null) PHXDataModalEntity? dataModal,
    @Default('') String? titlePage,
    @Default('') String? subTitlePage,
    @Default(false) bool? showDivider,
    @Default(false) bool? isItalics,
    @Default('') String? studentCode,
    @Default('') String? serviceCode,
    @Default('') String? shiftCode,
    @Default(null) BodyCancelEntity? bodyCancel,
    @Default(null) List<MonthCalendar>? listCalendar,
    @Default(null) double? totalDayOff,
    @Default(null) MessCancelFood? messCancelFood,
    @Default('') String? title,
    @Default('') String? content,
    @Default('') String? banner,
    @Default([]) List<PHXStatusLegendEntity>? status,
    @Default('') String? endCusor,
    String? infoBanner,
    String? statusCode,
    int? studentId,
    int? schoolYearId,
    int? requestId,
    int? schoolId,
    List<PHXMonth>? listMonthRegister,
    bool? isCancelRequest,
    String? educationalCode,
    int? foodSectionId,
    String? startDate,
    String? endDate,
    String? menuName,
    bool? isImageDefault,
    bool? isViewRequestCancel,
    int? requestCancelId,
    bool? hasNextPage,
    int? page,
    int? pageSize,
    int? total,
    int? totalPage,
    int? remaining,
    int? schoolTermId,
    int? monthId,
    String? registerLink,
    String? navigatorButtonName,
    int? subjectId,
    @Default('') String? subLable,
  }) = _PHXExtraEntity;
}

/// Calendar item entity representing a single day in a calendar.
@freezed
sealed class CalendarItem with _$CalendarItem {
  /// Constructor for [CalendarItem].
  const factory CalendarItem({
    @Default('') String content,
    @Default('') String date,
    @Default('') String dateToCallApi,
    @Default('') String dayOfWeek,
    @Default(false) bool isCurrentMonth,
    @Default(false) bool isToday,
    @Default(false) bool active,
    @Default(false) bool isPast,
    @Default(false) bool isWeekend,
    @Default('') String type,
    @Default('') String scheduleSetting,
    @Default(false) bool? isHalfDay,
    @Default(false) bool? isFullDay,
    @Default('') String? status,
  }) = _CalendarItem;
}

/// Month calendar entity containing month title, if it's current, and its items.
@freezed
sealed class MonthCalendar with _$MonthCalendar {
  /// Constructor for [MonthCalendar].
  const factory MonthCalendar({
    @Default('') String month,
    @Default(false) bool current,
    @Default([]) List<CalendarItem> dayOfMonth,
  }) = _MonthCalendar;
}

/// Mess cancellation food notice entity.
@freezed
sealed class MessCancelFood with _$MessCancelFood {
  /// Constructor for [MessCancelFood].
  const factory MessCancelFood({
    @Default('') String? title,
    @Default('') String? content,
  }) = _MessCancelFood;
}

/// Cancellation body entity used for bus service actions.
@freezed
sealed class BodyCancelEntity with _$BodyCancelEntity {
  /// Constructor for [BodyCancelEntity].
  const factory BodyCancelEntity({
    @Default([]) List<int> registerId,
    @Default('') String type,
  }) = _BodyCancelEntity;
}

/// Month entity representing a calendar month.
@freezed
sealed class PHXMonth with _$PHXMonth {
  /// Constructor for [PHXMonth].
  const factory PHXMonth({
    @Default(0) int? id,
    @Default('-') String? name,
    @Default(false) bool? isActive,
    @Default('') String? code,
  }) = _PHXMonth;
}

/// Tab item entity within a data modal.
@freezed
sealed class PHXDataModalTabEntity with _$PHXDataModalTabEntity {
  /// Constructor for [PHXDataModalTabEntity].
  const factory PHXDataModalTabEntity({
    String? title,
    bool? isActive,
    int? id,
  }) = _PHXDataModalTabEntity;
}

/// Empty state information entity.
@freezed
sealed class PHXEmptyStateEntity with _$PHXEmptyStateEntity {
  /// Private constructor for [PHXEmptyStateEntity].
  const PHXEmptyStateEntity._();

  /// Constructor for [PHXEmptyStateEntity].
  const factory PHXEmptyStateEntity({
    @Default('') String? title,
    @Default('') String? subTitle,
    @Default(false) bool? isShowButton,
    @Default('') String? buttonLabel,
  }) = _PHXEmptyStateEntity;

  String? get sub_title => subTitle;
  bool? get is_show_button => isShowButton;
  String? get button_label => buttonLabel;
}

/// Entity representing a table.
@freezed
sealed class PHXTableEntity with _$PHXTableEntity {
  /// Private constructor for [PHXTableEntity].
  const PHXTableEntity._();

  /// Constructor for [PHXTableEntity].
  const factory PHXTableEntity({
    @Default('') String? title,
    @Default(null) PHXTableContentEntity? content,
  }) = _PHXTableEntity;
}

/// Entity representing the content of a table.
@freezed
sealed class PHXTableContentEntity with _$PHXTableContentEntity {
  /// Private constructor for [PHXTableContentEntity].
  const PHXTableContentEntity._();

  /// Constructor for [PHXTableContentEntity].
  const factory PHXTableContentEntity({
    @Default([]) List<String>? headers,
    @Default([]) List<List<String>>? rows,
  }) = _PHXTableContentEntity;
}

/// Entity representing a status legend.
@freezed
sealed class PHXStatusLegendEntity with _$PHXStatusLegendEntity {
  /// Constructor for [PHXStatusLegendEntity].
  const factory PHXStatusLegendEntity({
    @Default('') String? title,
    @Default('') String? status,
  }) = _PHXStatusLegendEntity;
}
