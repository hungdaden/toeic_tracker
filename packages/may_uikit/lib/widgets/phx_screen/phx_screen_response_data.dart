// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'phx_screen_response_data.freezed.dart';
part 'phx_screen_response_data.g.dart';

/// Data model representing the root of the server-driven UI response.
@freezed
sealed class PHXScreenResponseData with _$PHXScreenResponseData {
  /// JsonSerializable constructor configuration.
  @JsonSerializable(explicitToJson: true)
  const factory PHXScreenResponseData({@JsonKey(name: 'data') PHXScreenDataData? data}) =
      _PHXScreenResponseData;

  /// Creates a [PHXScreenResponseData] from a JSON map.
  factory PHXScreenResponseData.fromJson(Map<String, dynamic> json) =>
      _$PHXScreenResponseDataFromJson(json);
}

/// Data model payload class inside [PHXScreenResponseData] that holds all components.
@freezed
sealed class PHXScreenDataData with _$PHXScreenDataData {
  /// JsonSerializable constructor configuration.
  @JsonSerializable(explicitToJson: true)
  const factory PHXScreenDataData({
    @JsonKey(name: 'app_bar') PHXAppBarData? appBar,
    @JsonKey(name: 'header_info') PHXHeaderInfoData? headerInfo,
    @JsonKey(name: 'tabs') List<PHXTabData>? tabs,
    @JsonKey(name: 'sections') List<PHXSectionData>? sections,
    @JsonKey(name: 'sections_bottom_sheet') List<PHXSectionData>? sectionsBottomSheet,
    @JsonKey(name: 'list_options') List<PHXListOptionData>? listOptions,
    @JsonKey(name: 'bottom_actions') List<PHXBottomActionData>? bottomActions,
    @JsonKey(name: 'table') PHXTableData? table,
    @JsonKey(name: 'empty_state') PHXEmptyStateData? emptyState,
  }) = _PHXScreenDataData;

  /// Creates a [PHXScreenDataData] from a JSON map.
  factory PHXScreenDataData.fromJson(Map<String, dynamic> json) =>
      _$PHXScreenDataDataFromJson(json);
}

/// Header information data model holding title, content, and avatar.
@freezed
sealed class PHXHeaderInfoData with _$PHXHeaderInfoData {
  /// Constructor for [PHXHeaderInfoData].
  const factory PHXHeaderInfoData({
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'content') String? content,
    @JsonKey(name: 'avatar') String? avatar,
  }) = _PHXHeaderInfoData;

  /// Creates a [PHXHeaderInfoData] from a JSON map.
  factory PHXHeaderInfoData.fromJson(Map<String, dynamic> json) =>
      _$PHXHeaderInfoDataFromJson(json);
}

/// AppBar information data model holding title and subTitle.
@freezed
sealed class PHXAppBarData with _$PHXAppBarData {
  /// Constructor for [PHXAppBarData].
  const factory PHXAppBarData({
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'sub_title') String? subTitle,
  }) = _PHXAppBarData;

  /// Creates a [PHXAppBarData] from a JSON map.
  factory PHXAppBarData.fromJson(Map<String, dynamic> json) => _$PHXAppBarDataFromJson(json);
}

/// Tab data model containing attributes to control tab behavior and display.
@freezed
sealed class PHXTabData with _$PHXTabData {
  /// Constructor for [PHXTabData].
  const factory PHXTabData({
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'code') String? code,
    @JsonKey(name: 'content') String? content,
    @JsonKey(name: 'is_target') bool? isTarget,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'count') int? count,
    @JsonKey(name: 'extra') PHXExtraData? extra,
  }) = _PHXTabData;

  /// Creates a [PHXTabData] from a JSON map.
  factory PHXTabData.fromJson(Map<String, dynamic> json) => _$PHXTabDataFromJson(json);
}

/// Section data model grouping items together with a title.
@freezed
sealed class PHXSectionData with _$PHXSectionData {
  /// JsonSerializable constructor configuration.
  @JsonSerializable(explicitToJson: true)
  const factory PHXSectionData({
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'heading') String? heading,
    @JsonKey(name: 'icon_url') String? iconUrl,
    @JsonKey(name: 'bottom_sheet') List<PHXSectionData>? bottomSheet,
    @JsonKey(name: 'items') List<PHXSectionItemData>? items,
    @JsonKey(name: 'extra') PHXExtraData? extra,
  }) = _PHXSectionData;

  /// Creates a [PHXSectionData] from a JSON map.
  factory PHXSectionData.fromJson(Map<String, dynamic> json) => _$PHXSectionDataFromJson(json);
}

Object? _readIdOrGroupId(Map json, String key) {
  return json['id'] ?? json['group_id'];
}

Object? _readImageUrlOrIconUrl(Map json, String key) {
  return json['image_url'] ?? json['icon_url'];
}

/// Section item data model representing a single item within a section.
@freezed
sealed class PHXSectionItemData with _$PHXSectionItemData {
  /// JsonSerializable constructor configuration.
  @JsonSerializable(explicitToJson: true)
  const factory PHXSectionItemData({
    @JsonKey(name: 'id', readValue: _readIdOrGroupId) int? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'content') String? content,
    @JsonKey(name: 'sub_title') String? subTitle,
    @JsonKey(name: 'description') List<String>? description,
    @JsonKey(name: 'image_url', readValue: _readImageUrlOrIconUrl) String? imageUrl,
    @JsonKey(name: 'is_next') bool? isNext,
    @JsonKey(name: 'show_divider') bool? showDivider,
    @JsonKey(name: 'has_avatar') bool? hasAvatar,
    @JsonKey(name: 'details') List<PHXSectionItemDetailData>? details,
    @JsonKey(name: 'badge') PHXSectionItemBadgeData? badge,
    @JsonKey(name: 'bottom_info') PHXSectionItemBottomInfoData? bottomInfo,
    @JsonKey(name: 'extra') PHXExtraData? extra,
    @JsonKey(name: 'avatar_name') String? avatarName,
    @JsonKey(name: 'avatar_subtitle') String? avatarSubtitle,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'students') List<PHXStudentData>? students,
    @JsonKey(name: 'student_id') int? studentId,
    @JsonKey(name: 'red_dot') bool? redDot,
    @JsonKey(name: 'uuid') String? uuid,
    @JsonKey(name: 'multi_badge') List<PHXMultiBadgeData>? multiBadge,
    @JsonKey(name: 'payload') PHXPayloadData? payload,
  }) = _PHXSectionItemData;

  /// Creates a [PHXSectionItemData] from a JSON map.
  factory PHXSectionItemData.fromJson(Map<String, dynamic> json) =>
      _$PHXSectionItemDataFromJson(json);
}

Object? _readString(Map json, String key) {
  final val = json[key];
  if (val == null) return null;
  return val.toString();
}

/// Typed payload data model holding notification and business action parameters.
@freezed
sealed class PHXPayloadData with _$PHXPayloadData {
  /// JsonSerializable constructor configuration.
  @JsonSerializable(explicitToJson: true)
  const factory PHXPayloadData({
    @JsonKey(name: 'action') String? action,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'content') String? content,
    @JsonKey(name: 'notification_id', readValue: _readString) String? notificationId,
    @JsonKey(name: 'student_code') String? studentCode,
    @JsonKey(name: 'attendance_lesson_id', readValue: _readString) String? attendanceLessonId,
    @JsonKey(name: 'assign_id', readValue: _readString) String? assignId,
    @JsonKey(name: 'subsystem') String? subsystem,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'event_type') String? eventType,
    @JsonKey(name: 'classroom_name') String? classroomName,
    @JsonKey(name: 'school_year_id', readValue: _readString) String? schoolYearId,
    @JsonKey(name: 'borrow_ticket_state') String? borrowTicketState,
    @JsonKey(name: 'id', readValue: _readString) String? id,
    @JsonKey(name: 'student_id', readValue: _readString) String? studentId,
    @JsonKey(name: 'quick_examination_id', readValue: _readString) String? quickExaminationId,
    @JsonKey(name: 'order_id', readValue: _readString) String? orderId,
    @JsonKey(name: 'feedback_id', readValue: _readString) String? feedbackId,
    @JsonKey(name: 'type_detail') String? typeDetail,
    @JsonKey(name: 'inapp_noti_id', readValue: _readString) String? inappNotiId,
    @JsonKey(name: 'hasShareMessage') String? hasShareMessage,
    @JsonKey(name: 'month_id', readValue: _readString) String? monthId,
    @JsonKey(name: 'school_term_id', readValue: _readString) String? schoolTermId,
    @JsonKey(name: 'code') String? code,
    @JsonKey(name: 'request_id', readValue: _readString) String? requestId,
    @JsonKey(name: 'school_id', readValue: _readString) String? schoolId,
    @JsonKey(name: 'is_cancel_request', readValue: _readString) String? isCancelRequest,
  }) = _PHXPayloadData;

  /// Creates a [PHXPayloadData] from a JSON map.
  factory PHXPayloadData.fromJson(Map<String, dynamic> json) => _$PHXPayloadDataFromJson(json);
}

/// Multi-badge item data model for notification multi-badges.
@freezed
sealed class PHXMultiBadgeData with _$PHXMultiBadgeData {
  /// Constructor for [PHXMultiBadgeData].
  const factory PHXMultiBadgeData({
    @JsonKey(name: 'badgeType') String? badgeType,
    @JsonKey(name: 'content') String? content,
    @JsonKey(name: 'title') String? title,
  }) = _PHXMultiBadgeData;

  /// Creates a [PHXMultiBadgeData] from a JSON map.
  factory PHXMultiBadgeData.fromJson(Map<String, dynamic> json) =>
      _$PHXMultiBadgeDataFromJson(json);
}

/// Student item data model for bottom action student lists.
@freezed
sealed class PHXStudentData with _$PHXStudentData {
  /// Constructor for [PHXStudentData].
  const factory PHXStudentData({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'student_id') int? studentId,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'sub_title') String? subTitle,
  }) = _PHXStudentData;

  /// Creates a [PHXStudentData] from a JSON map.
  factory PHXStudentData.fromJson(Map<String, dynamic> json) => _$PHXStudentDataFromJson(json);
}

/// Detail item data model within a section item details list.
@freezed
sealed class PHXSectionItemDetailData with _$PHXSectionItemDetailData {
  /// JsonSerializable constructor configuration.
  @JsonSerializable(explicitToJson: true)
  const factory PHXSectionItemDetailData({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'content') String? content,
    @JsonKey(name: 'icon') List<PHXSectionItemDetailIconData>? icon,
    @JsonKey(name: 'type') List<PHXSectionContentTypeData>? type,
    @JsonKey(name: 'show_divider') bool? showDivider,
    @JsonKey(name: 'is_break_line') bool? isBreakLine,
    @JsonKey(name: 'is_justify') bool? isJustify,
    @JsonKey(name: 'badgeType') String? badgeType,
    @JsonKey(name: 'badge') PHXSectionItemBadgeData? badge,
    @JsonKey(name: 'is_action_item') bool? isActionItem,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'extra') PHXExtraData? extra,
  }) = _PHXSectionItemDetailData;

  /// Creates a [PHXSectionItemDetailData] from a JSON map.
  factory PHXSectionItemDetailData.fromJson(Map<String, dynamic> json) =>
      _$PHXSectionItemDetailDataFromJson(json);
}

/// Content type configuration data model for detail items.
@freezed
sealed class PHXSectionContentTypeData with _$PHXSectionContentTypeData {
  /// Creates a [PHXSectionContentTypeData] with content type flags.
  ///
  /// - [isDisable] : trường này bị vô hiệu hoá (chỉ đọc).
  /// - [isEnable]  : trường này được kích hoạt (có thể chỉnh sửa).
  /// - [isTextArea]: trường này hiển thị dưới dạng text area nhiều dòng.
  const factory PHXSectionContentTypeData({
    @JsonKey(name: 'is_disable') bool? isDisable,
    @JsonKey(name: 'is_enable') bool? isEnable,
    @JsonKey(name: 'is_text_area') bool? isTextArea,
  }) = _PHXSectionContentTypeData;

  /// Creates a [PHXSectionContentTypeData] from a JSON map.
  factory PHXSectionContentTypeData.fromJson(Map<String, dynamic> json) =>
      _$PHXSectionContentTypeDataFromJson(json);
}

/// Icon and action configuration for detail items.
@freezed
sealed class PHXSectionItemDetailIconData with _$PHXSectionItemDetailIconData {
  /// Constructor for [PHXSectionItemDetailIconData].
  const factory PHXSectionItemDetailIconData({
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'action') String? action,
  }) = _PHXSectionItemDetailIconData;

  /// Creates a [PHXSectionItemDetailIconData] from a JSON map.
  factory PHXSectionItemDetailIconData.fromJson(Map<String, dynamic> json) =>
      _$PHXSectionItemDetailIconDataFromJson(json);
}

/// Badge information data model for section items.
@freezed
sealed class PHXSectionItemBadgeData with _$PHXSectionItemBadgeData {
  /// Constructor for [PHXSectionItemBadgeData].
  const factory PHXSectionItemBadgeData({
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'content') String? content,
    @JsonKey(name: 'badgeType') String? badgeType,
  }) = _PHXSectionItemBadgeData;

  /// Creates a [PHXSectionItemBadgeData] from a JSON map.
  factory PHXSectionItemBadgeData.fromJson(Map<String, dynamic> json) =>
      _$PHXSectionItemBadgeDataFromJson(json);
}

/// Bottom information data model for contact/avatar display on section items.
@freezed
sealed class PHXSectionItemBottomInfoData with _$PHXSectionItemBottomInfoData {
  /// Constructor for [PHXSectionItemBottomInfoData].
  const factory PHXSectionItemBottomInfoData({
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'sub_title') String? subTitle,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'is_contact') bool? isContact,
    @JsonKey(name: 'show_divider') bool? showDivider,
    @JsonKey(name: 'icon') List<PHXSectionItemDetailIconData>? icon,
  }) = _PHXSectionItemBottomInfoData;

  /// Creates a [PHXSectionItemBottomInfoData] from a JSON map.
  factory PHXSectionItemBottomInfoData.fromJson(Map<String, dynamic> json) =>
      _$PHXSectionItemBottomInfoDataFromJson(json);
}

/// Selectable option item in list options.
@freezed
sealed class PHXListOptionData with _$PHXListOptionData {
  /// Constructor for [PHXListOptionData].
  const factory PHXListOptionData({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'code') String? code,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'extra') PHXExtraData? extra,
  }) = _PHXListOptionData;

  /// Creates a [PHXListOptionData] from a JSON map.
  factory PHXListOptionData.fromJson(Map<String, dynamic> json) =>
      _$PHXListOptionDataFromJson(json);
}

/// Bottom action item for buttons at the bottom of the screen.
@freezed
sealed class PHXBottomActionData with _$PHXBottomActionData {
  /// JsonSerializable constructor configuration.
  @JsonSerializable(explicitToJson: true)
  const factory PHXBottomActionData({
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'extra') PHXExtraData? extra,
    @JsonKey(name: 'bottom_sheet') PHXBottomSheetData? bottomSheet,
    @JsonKey(name: 'is_hidden_action') bool? isHiddenAction,
    @JsonKey(name: 'is_show_sub_title') bool? isShowSubTitle,
    @JsonKey(name: 'sub_title') String? subTitle,
    @JsonKey(name: 'students') List<PHXStudentData>? students,
  }) = _PHXBottomActionData;

  /// Creates a [PHXBottomActionData] from a JSON map.
  factory PHXBottomActionData.fromJson(Map<String, dynamic> json) =>
      _$PHXBottomActionDataFromJson(json);
}

/// Content model within data modal.
@freezed
sealed class PHXDataModalContentData with _$PHXDataModalContentData {
  const factory PHXDataModalContentData({
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'title_color') String? titleColor,
    @JsonKey(name: 'content') String? content,
    @JsonKey(name: 'show_divider') bool? showDivider,
    @JsonKey(name: 'is_italics') bool? isItalics,
  }) = _PHXDataModalContentData;

  factory PHXDataModalContentData.fromJson(Map<String, dynamic> json) =>
      _$PHXDataModalContentDataFromJson(json);
}

/// Tab item model within data modal.
@freezed
sealed class PHXDataModalTabData with _$PHXDataModalTabData {
  const factory PHXDataModalTabData({
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'id') int? id,
  }) = _PHXDataModalTabData;

  factory PHXDataModalTabData.fromJson(Map<String, dynamic> json) =>
      _$PHXDataModalTabDataFromJson(json);
}

/// Data modal parameters model.
@freezed
sealed class PHXDataModalData with _$PHXDataModalData {
  const factory PHXDataModalData({
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'tabs') List<PHXDataModalTabData>? tabs,
    @JsonKey(name: 'content') List<PHXDataModalContentData>? content,
  }) = _PHXDataModalData;

  factory PHXDataModalData.fromJson(Map<String, dynamic> json) => _$PHXDataModalDataFromJson(json);
}

/// Bottom sheet configuration for actions.
@freezed
sealed class PHXBottomSheetData with _$PHXBottomSheetData {
  /// Constructor for [PHXBottomSheetData].
  const factory PHXBottomSheetData({
    @JsonKey(name: 'sheet_title') String? sheetTitle,
    @JsonKey(name: 'sheet_description') List<String>? sheetDescription,
    @JsonKey(name: 'bottom_sheet_type') String? bottomSheetType,
    @JsonKey(name: 'sheet_content') List<PHXBottomSheetContentData>? sheetContent,
  }) = _PHXBottomSheetData;

  /// Creates a [PHXBottomSheetData] from a JSON map.
  factory PHXBottomSheetData.fromJson(Map<String, dynamic> json) =>
      _$PHXBottomSheetDataFromJson(json);
}

/// Data model for bottom sheet content items.
@freezed
sealed class PHXBottomSheetContentData with _$PHXBottomSheetContentData {
  /// Constructor for [PHXBottomSheetContentData].
  const factory PHXBottomSheetContentData({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'sub_title') String? subTitle,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'content') String? content,
  }) = _PHXBottomSheetContentData;

  /// Creates a [PHXBottomSheetContentData] from a JSON map.
  factory PHXBottomSheetContentData.fromJson(Map<String, dynamic> json) =>
      _$PHXBottomSheetContentDataFromJson(json);
}

/// Extra parameters data model containing business-specific parameters.
@freezed
sealed class PHXExtraData with _$PHXExtraData {
  @JsonSerializable(explicitToJson: true)
  const factory PHXExtraData({
    @JsonKey(name: 'teacher_id') int? teacherId,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'group_id') int? groupId,
    @JsonKey(name: 'call_modal_data') bool? callModalData,
    @JsonKey(name: 'data_modal') PHXDataModalData? dataModal,
    @JsonKey(name: 'title_page') String? titlePage,
    @JsonKey(name: 'sub_title_page') String? subTitlePage,
    @JsonKey(name: 'show_divider') bool? showDivider,
    @JsonKey(name: 'is_italics') bool? isItalics,
    @JsonKey(name: 'student_code') String? studentCode,
    @JsonKey(name: 'service_code') String? serviceCode,
    @JsonKey(name: 'shift_code') String? shiftCode,
    @JsonKey(name: 'body_cancel') BodyCancelData? bodyCancel,
    @JsonKey(name: 'list_calendar') List<MonthCalendarData>? listCalendar,
    @JsonKey(name: 'total_day_off') double? totalDayOff,
    @JsonKey(name: 'mess_cancel_food') MessCancelFoodData? messCancelFood,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'content') String? content,
    @JsonKey(name: 'banner') String? banner,
    @JsonKey(name: 'status') List<PHXStatusLegendData>? status,
    @JsonKey(name: 'info_banner') String? infoBanner,
    @JsonKey(name: 'status_code') String? statusCode,
    @JsonKey(name: 'student_id') int? studentId,
    @JsonKey(name: 'school_year_id') int? schoolYearId,
    @JsonKey(name: 'request_id') int? requestId,
    @JsonKey(name: 'school_id') int? schoolId,
    @JsonKey(name: 'list_month_register') List<PHXMonthData>? listMonthRegister,
    @JsonKey(name: 'is_cancel_request') bool? isCancelRequest,
    @JsonKey(name: 'educational_code') String? educationalCode,
    @JsonKey(name: 'food_section_id') int? foodSectionId,
    @JsonKey(name: 'start_date') String? startDate,
    @JsonKey(name: 'end_date') String? endDate,
    @JsonKey(name: 'menu_name') String? menuName,
    @JsonKey(name: 'is_image_default') bool? isImageDefault,
    @JsonKey(name: 'is_view_request_cancel') bool? isViewRequestCancel,
    @JsonKey(name: 'request_cancel_id') int? requestCancelId,
    @JsonKey(name: 'has_next_page') bool? hasNextPage,
    @JsonKey(name: 'endCusor') String? endCusor,
    @JsonKey(name: 'page') int? page,
    @JsonKey(name: 'page_size') int? pageSize,
    @JsonKey(name: 'school_term_id') int? schoolTermId,
    @JsonKey(name: 'month_id') int? monthId,
    @JsonKey(name: 'total') int? total,
    @JsonKey(name: 'totalPage') int? totalPage,
    @JsonKey(name: 'remaining') int? remaining,
    @JsonKey(name: 'register_link') String? registerLink,
    @JsonKey(name: 'navigator_button_name') String? navigatorButtonName,
    @JsonKey(name: 'subject_id') int? subjectId,
    @JsonKey(name: 'sub_lable') String? subLable,
  }) = _PHXExtraData;

  /// Creates a [PHXExtraData] from a JSON map.
  factory PHXExtraData.fromJson(Map<String, dynamic> json) => _$PHXExtraDataFromJson(json);
}

/// Empty state information data model.
@freezed
sealed class PHXEmptyStateData with _$PHXEmptyStateData {
  /// Constructor for [PHXEmptyStateData].
  const factory PHXEmptyStateData({
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'sub_title') String? subTitle,
    @JsonKey(name: 'is_show_button') bool? isShowButton,
    @JsonKey(name: 'button_label') String? buttonLabel,
  }) = _PHXEmptyStateData;

  /// Creates a [PHXEmptyStateData] from a JSON map.
  factory PHXEmptyStateData.fromJson(Map<String, dynamic> json) =>
      _$PHXEmptyStateDataFromJson(json);
}

/// Data model representing a table.
@freezed
sealed class PHXTableData with _$PHXTableData {
  /// Constructor for [PHXTableData].
  const factory PHXTableData({
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'content') PHXTableContentData? content,
  }) = _PHXTableData;

  /// Creates a [PHXTableData] from a JSON map.
  factory PHXTableData.fromJson(Map<String, dynamic> json) => _$PHXTableDataFromJson(json);
}

/// Data model representing the content of a table.
@freezed
sealed class PHXTableContentData with _$PHXTableContentData {
  /// Constructor for [PHXTableContentData].
  const factory PHXTableContentData({
    @JsonKey(name: 'headers') List<String>? headers,
    @JsonKey(name: 'rows') List<List<String>>? rows,
  }) = _PHXTableContentData;

  /// Creates a [PHXTableContentData] from a JSON map.
  factory PHXTableContentData.fromJson(Map<String, dynamic> json) =>
      _$PHXTableContentDataFromJson(json);
}

/// Data model for a calendar item.
@freezed
sealed class CalendarItemData with _$CalendarItemData {
  /// Constructor for [CalendarItemData].
  @JsonSerializable(explicitToJson: true)
  const factory CalendarItemData({
    @JsonKey(name: 'content') String? content,
    @JsonKey(name: 'date') String? date,
    @JsonKey(name: 'date_to_call_api') String? dateToCallApi,
    @JsonKey(name: 'dayOfWeek') String? dayOfWeek,
    @JsonKey(name: 'isCurrentMonth') bool? isCurrentMonth,
    @JsonKey(name: 'isToday') bool? isToday,
    @JsonKey(name: 'active') bool? active,
    @JsonKey(name: 'isPast') bool? isPast,
    @JsonKey(name: 'isWeekend') bool? isWeekend,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'schedule_setting') String? scheduleSetting,
    @JsonKey(name: 'is_half_day') bool? isHalfDay,
    @JsonKey(name: 'is_full_day') bool? isFullDay,
    @JsonKey(name: 'status') String? status,
  }) = _CalendarItemData;

  /// Creates a [CalendarItemData] from a JSON map.
  factory CalendarItemData.fromJson(Map<String, dynamic> json) => _$CalendarItemDataFromJson(json);
}

/// Data model for a month calendar.
@freezed
sealed class MonthCalendarData with _$MonthCalendarData {
  /// Constructor for [MonthCalendarData].
  @JsonSerializable(explicitToJson: true)
  const factory MonthCalendarData({
    @JsonKey(name: 'month') String? month,
    @JsonKey(name: 'current') bool? current,
    @JsonKey(name: 'day_of_month') List<CalendarItemData>? dayOfMonth,
  }) = _MonthCalendarData;

  /// Creates a [MonthCalendarData] from a JSON map.
  factory MonthCalendarData.fromJson(Map<String, dynamic> json) =>
      _$MonthCalendarDataFromJson(json);
}

/// Data model for food cancel messages.
@freezed
sealed class MessCancelFoodData with _$MessCancelFoodData {
  /// Constructor for [MessCancelFoodData].
  @JsonSerializable(explicitToJson: true)
  const factory MessCancelFoodData({
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'content') String? content,
  }) = _MessCancelFoodData;

  /// Creates a [MessCancelFoodData] from a JSON map.
  factory MessCancelFoodData.fromJson(Map<String, dynamic> json) =>
      _$MessCancelFoodDataFromJson(json);
}

/// Data model for body cancellation parameters.
@freezed
sealed class BodyCancelData with _$BodyCancelData {
  /// Constructor for [BodyCancelData].
  @JsonSerializable(explicitToJson: true)
  const factory BodyCancelData({
    @JsonKey(name: 'register_id') List<int>? registerId,
    @JsonKey(name: 'type') String? type,
  }) = _BodyCancelData;

  /// Creates a [BodyCancelData] from a JSON map.
  factory BodyCancelData.fromJson(Map<String, dynamic> json) => _$BodyCancelDataFromJson(json);
}

/// Data model for a calendar month.
@freezed
sealed class PHXMonthData with _$PHXMonthData {
  /// Constructor for [PHXMonthData].
  @JsonSerializable(explicitToJson: true)
  const factory PHXMonthData({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'code') String? code,
  }) = _PHXMonthData;

  /// Creates a [PHXMonthData] from a JSON map.
  factory PHXMonthData.fromJson(Map<String, dynamic> json) => _$PHXMonthDataFromJson(json);
}

/// Data model for status legend items.
@freezed
sealed class PHXStatusLegendData with _$PHXStatusLegendData {
  /// Constructor for [PHXStatusLegendData].
  @JsonSerializable(explicitToJson: true)
  const factory PHXStatusLegendData({
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'status') String? status,
  }) = _PHXStatusLegendData;

  /// Creates a [PHXStatusLegendData] from a JSON map.
  factory PHXStatusLegendData.fromJson(Map<String, dynamic> json) =>
      _$PHXStatusLegendDataFromJson(json);
}
