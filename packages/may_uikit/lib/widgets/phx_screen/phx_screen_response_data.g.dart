// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phx_screen_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PHXScreenResponseData _$PHXScreenResponseDataFromJson(
        Map<String, dynamic> json) =>
    _PHXScreenResponseData(
      data: json['data'] == null
          ? null
          : PHXScreenDataData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PHXScreenResponseDataToJson(
        _PHXScreenResponseData instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

_PHXScreenDataData _$PHXScreenDataDataFromJson(Map<String, dynamic> json) =>
    _PHXScreenDataData(
      appBar: json['app_bar'] == null
          ? null
          : PHXAppBarData.fromJson(json['app_bar'] as Map<String, dynamic>),
      headerInfo: json['header_info'] == null
          ? null
          : PHXHeaderInfoData.fromJson(
              json['header_info'] as Map<String, dynamic>),
      tabs: (json['tabs'] as List<dynamic>?)
          ?.map((e) => PHXTabData.fromJson(e as Map<String, dynamic>))
          .toList(),
      sections: (json['sections'] as List<dynamic>?)
          ?.map((e) => PHXSectionData.fromJson(e as Map<String, dynamic>))
          .toList(),
      sectionsBottomSheet: (json['sections_bottom_sheet'] as List<dynamic>?)
          ?.map((e) => PHXSectionData.fromJson(e as Map<String, dynamic>))
          .toList(),
      listOptions: (json['list_options'] as List<dynamic>?)
          ?.map((e) => PHXListOptionData.fromJson(e as Map<String, dynamic>))
          .toList(),
      bottomActions: (json['bottom_actions'] as List<dynamic>?)
          ?.map((e) => PHXBottomActionData.fromJson(e as Map<String, dynamic>))
          .toList(),
      table: json['table'] == null
          ? null
          : PHXTableData.fromJson(json['table'] as Map<String, dynamic>),
      emptyState: json['empty_state'] == null
          ? null
          : PHXEmptyStateData.fromJson(
              json['empty_state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PHXScreenDataDataToJson(_PHXScreenDataData instance) =>
    <String, dynamic>{
      'app_bar': instance.appBar?.toJson(),
      'header_info': instance.headerInfo?.toJson(),
      'tabs': instance.tabs?.map((e) => e.toJson()).toList(),
      'sections': instance.sections?.map((e) => e.toJson()).toList(),
      'sections_bottom_sheet':
          instance.sectionsBottomSheet?.map((e) => e.toJson()).toList(),
      'list_options': instance.listOptions?.map((e) => e.toJson()).toList(),
      'bottom_actions': instance.bottomActions?.map((e) => e.toJson()).toList(),
      'table': instance.table?.toJson(),
      'empty_state': instance.emptyState?.toJson(),
    };

_PHXHeaderInfoData _$PHXHeaderInfoDataFromJson(Map<String, dynamic> json) =>
    _PHXHeaderInfoData(
      title: json['title'] as String?,
      content: json['content'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$PHXHeaderInfoDataToJson(_PHXHeaderInfoData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'avatar': instance.avatar,
    };

_PHXAppBarData _$PHXAppBarDataFromJson(Map<String, dynamic> json) =>
    _PHXAppBarData(
      title: json['title'] as String?,
      subTitle: json['sub_title'] as String?,
    );

Map<String, dynamic> _$PHXAppBarDataToJson(_PHXAppBarData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'sub_title': instance.subTitle,
    };

_PHXTabData _$PHXTabDataFromJson(Map<String, dynamic> json) => _PHXTabData(
      title: json['title'] as String?,
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      content: json['content'] as String?,
      isTarget: json['is_target'] as bool?,
      isActive: json['is_active'] as bool?,
      count: (json['count'] as num?)?.toInt(),
      extra: json['extra'] == null
          ? null
          : PHXExtraData.fromJson(json['extra'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PHXTabDataToJson(_PHXTabData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'code': instance.code,
      'content': instance.content,
      'is_target': instance.isTarget,
      'is_active': instance.isActive,
      'count': instance.count,
      'extra': instance.extra,
    };

_PHXSectionData _$PHXSectionDataFromJson(Map<String, dynamic> json) =>
    _PHXSectionData(
      title: json['title'] as String?,
      heading: json['heading'] as String?,
      iconUrl: json['icon_url'] as String?,
      bottomSheet: (json['bottom_sheet'] as List<dynamic>?)
          ?.map((e) => PHXSectionData.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => PHXSectionItemData.fromJson(e as Map<String, dynamic>))
          .toList(),
      extra: json['extra'] == null
          ? null
          : PHXExtraData.fromJson(json['extra'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PHXSectionDataToJson(_PHXSectionData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'heading': instance.heading,
      'icon_url': instance.iconUrl,
      'bottom_sheet': instance.bottomSheet?.map((e) => e.toJson()).toList(),
      'items': instance.items?.map((e) => e.toJson()).toList(),
      'extra': instance.extra?.toJson(),
    };

_PHXSectionItemData _$PHXSectionItemDataFromJson(Map<String, dynamic> json) =>
    _PHXSectionItemData(
      id: (_readIdOrGroupId(json, 'id') as num?)?.toInt(),
      title: json['title'] as String?,
      content: json['content'] as String?,
      subTitle: json['sub_title'] as String?,
      description: (json['description'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      imageUrl: _readImageUrlOrIconUrl(json, 'image_url') as String?,
      isNext: json['is_next'] as bool?,
      showDivider: json['show_divider'] as bool?,
      hasAvatar: json['has_avatar'] as bool?,
      details: (json['details'] as List<dynamic>?)
          ?.map((e) =>
              PHXSectionItemDetailData.fromJson(e as Map<String, dynamic>))
          .toList(),
      badge: json['badge'] == null
          ? null
          : PHXSectionItemBadgeData.fromJson(
              json['badge'] as Map<String, dynamic>),
      bottomInfo: json['bottom_info'] == null
          ? null
          : PHXSectionItemBottomInfoData.fromJson(
              json['bottom_info'] as Map<String, dynamic>),
      extra: json['extra'] == null
          ? null
          : PHXExtraData.fromJson(json['extra'] as Map<String, dynamic>),
      avatarName: json['avatar_name'] as String?,
      avatarSubtitle: json['avatar_subtitle'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      students: (json['students'] as List<dynamic>?)
          ?.map((e) => PHXStudentData.fromJson(e as Map<String, dynamic>))
          .toList(),
      studentId: (json['student_id'] as num?)?.toInt(),
      redDot: json['red_dot'] as bool?,
      uuid: json['uuid'] as String?,
      multiBadge: (json['multi_badge'] as List<dynamic>?)
          ?.map((e) => PHXMultiBadgeData.fromJson(e as Map<String, dynamic>))
          .toList(),
      payload: json['payload'] == null
          ? null
          : PHXPayloadData.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PHXSectionItemDataToJson(_PHXSectionItemData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'sub_title': instance.subTitle,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'is_next': instance.isNext,
      'show_divider': instance.showDivider,
      'has_avatar': instance.hasAvatar,
      'details': instance.details?.map((e) => e.toJson()).toList(),
      'badge': instance.badge?.toJson(),
      'bottom_info': instance.bottomInfo?.toJson(),
      'extra': instance.extra?.toJson(),
      'avatar_name': instance.avatarName,
      'avatar_subtitle': instance.avatarSubtitle,
      'avatar_url': instance.avatarUrl,
      'students': instance.students?.map((e) => e.toJson()).toList(),
      'student_id': instance.studentId,
      'red_dot': instance.redDot,
      'uuid': instance.uuid,
      'multi_badge': instance.multiBadge?.map((e) => e.toJson()).toList(),
      'payload': instance.payload?.toJson(),
    };

_PHXPayloadData _$PHXPayloadDataFromJson(Map<String, dynamic> json) =>
    _PHXPayloadData(
      action: json['action'] as String?,
      type: json['type'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      notificationId: _readString(json, 'notification_id') as String?,
      studentCode: json['student_code'] as String?,
      attendanceLessonId: _readString(json, 'attendance_lesson_id') as String?,
      assignId: _readString(json, 'assign_id') as String?,
      subsystem: json['subsystem'] as String?,
      status: json['status'] as String?,
      eventType: json['event_type'] as String?,
      classroomName: json['classroom_name'] as String?,
      schoolYearId: _readString(json, 'school_year_id') as String?,
      borrowTicketState: json['borrow_ticket_state'] as String?,
      id: _readString(json, 'id') as String?,
      studentId: _readString(json, 'student_id') as String?,
      quickExaminationId: _readString(json, 'quick_examination_id') as String?,
      orderId: _readString(json, 'order_id') as String?,
      feedbackId: _readString(json, 'feedback_id') as String?,
      typeDetail: json['type_detail'] as String?,
      inappNotiId: _readString(json, 'inapp_noti_id') as String?,
      hasShareMessage: json['hasShareMessage'] as String?,
      monthId: _readString(json, 'month_id') as String?,
      schoolTermId: _readString(json, 'school_term_id') as String?,
      code: json['code'] as String?,
      requestId: _readString(json, 'request_id') as String?,
      schoolId: _readString(json, 'school_id') as String?,
      isCancelRequest: _readString(json, 'is_cancel_request') as String?,
    );

Map<String, dynamic> _$PHXPayloadDataToJson(_PHXPayloadData instance) =>
    <String, dynamic>{
      'action': instance.action,
      'type': instance.type,
      'title': instance.title,
      'content': instance.content,
      'notification_id': instance.notificationId,
      'student_code': instance.studentCode,
      'attendance_lesson_id': instance.attendanceLessonId,
      'assign_id': instance.assignId,
      'subsystem': instance.subsystem,
      'status': instance.status,
      'event_type': instance.eventType,
      'classroom_name': instance.classroomName,
      'school_year_id': instance.schoolYearId,
      'borrow_ticket_state': instance.borrowTicketState,
      'id': instance.id,
      'student_id': instance.studentId,
      'quick_examination_id': instance.quickExaminationId,
      'order_id': instance.orderId,
      'feedback_id': instance.feedbackId,
      'type_detail': instance.typeDetail,
      'inapp_noti_id': instance.inappNotiId,
      'hasShareMessage': instance.hasShareMessage,
      'month_id': instance.monthId,
      'school_term_id': instance.schoolTermId,
      'code': instance.code,
      'request_id': instance.requestId,
      'school_id': instance.schoolId,
      'is_cancel_request': instance.isCancelRequest,
    };

_PHXMultiBadgeData _$PHXMultiBadgeDataFromJson(Map<String, dynamic> json) =>
    _PHXMultiBadgeData(
      badgeType: json['badgeType'] as String?,
      content: json['content'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$PHXMultiBadgeDataToJson(_PHXMultiBadgeData instance) =>
    <String, dynamic>{
      'badgeType': instance.badgeType,
      'content': instance.content,
      'title': instance.title,
    };

_PHXStudentData _$PHXStudentDataFromJson(Map<String, dynamic> json) =>
    _PHXStudentData(
      id: (json['id'] as num?)?.toInt(),
      studentId: (json['student_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      subTitle: json['sub_title'] as String?,
    );

Map<String, dynamic> _$PHXStudentDataToJson(_PHXStudentData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student_id': instance.studentId,
      'name': instance.name,
      'avatar_url': instance.avatarUrl,
      'sub_title': instance.subTitle,
    };

_PHXSectionItemDetailData _$PHXSectionItemDetailDataFromJson(
        Map<String, dynamic> json) =>
    _PHXSectionItemDetailData(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      content: json['content'] as String?,
      icon: (json['icon'] as List<dynamic>?)
          ?.map((e) =>
              PHXSectionItemDetailIconData.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['type'] as List<dynamic>?)
          ?.map((e) =>
              PHXSectionContentTypeData.fromJson(e as Map<String, dynamic>))
          .toList(),
      showDivider: json['show_divider'] as bool?,
      isBreakLine: json['is_break_line'] as bool?,
      isJustify: json['is_justify'] as bool?,
      badgeType: json['badgeType'] as String?,
      badge: json['badge'] == null
          ? null
          : PHXSectionItemBadgeData.fromJson(
              json['badge'] as Map<String, dynamic>),
      isActionItem: json['is_action_item'] as bool?,
      imageUrl: json['image_url'] as String?,
      extra: json['extra'] == null
          ? null
          : PHXExtraData.fromJson(json['extra'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PHXSectionItemDetailDataToJson(
        _PHXSectionItemDetailData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'icon': instance.icon?.map((e) => e.toJson()).toList(),
      'type': instance.type?.map((e) => e.toJson()).toList(),
      'show_divider': instance.showDivider,
      'is_break_line': instance.isBreakLine,
      'is_justify': instance.isJustify,
      'badgeType': instance.badgeType,
      'badge': instance.badge?.toJson(),
      'is_action_item': instance.isActionItem,
      'image_url': instance.imageUrl,
      'extra': instance.extra?.toJson(),
    };

_PHXSectionContentTypeData _$PHXSectionContentTypeDataFromJson(
        Map<String, dynamic> json) =>
    _PHXSectionContentTypeData(
      isDisable: json['is_disable'] as bool?,
      isEnable: json['is_enable'] as bool?,
      isTextArea: json['is_text_area'] as bool?,
    );

Map<String, dynamic> _$PHXSectionContentTypeDataToJson(
        _PHXSectionContentTypeData instance) =>
    <String, dynamic>{
      'is_disable': instance.isDisable,
      'is_enable': instance.isEnable,
      'is_text_area': instance.isTextArea,
    };

_PHXSectionItemDetailIconData _$PHXSectionItemDetailIconDataFromJson(
        Map<String, dynamic> json) =>
    _PHXSectionItemDetailIconData(
      url: json['url'] as String?,
      action: json['action'] as String?,
    );

Map<String, dynamic> _$PHXSectionItemDetailIconDataToJson(
        _PHXSectionItemDetailIconData instance) =>
    <String, dynamic>{
      'url': instance.url,
      'action': instance.action,
    };

_PHXSectionItemBadgeData _$PHXSectionItemBadgeDataFromJson(
        Map<String, dynamic> json) =>
    _PHXSectionItemBadgeData(
      title: json['title'] as String?,
      content: json['content'] as String?,
      badgeType: json['badgeType'] as String?,
    );

Map<String, dynamic> _$PHXSectionItemBadgeDataToJson(
        _PHXSectionItemBadgeData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'badgeType': instance.badgeType,
    };

_PHXSectionItemBottomInfoData _$PHXSectionItemBottomInfoDataFromJson(
        Map<String, dynamic> json) =>
    _PHXSectionItemBottomInfoData(
      title: json['title'] as String?,
      subTitle: json['sub_title'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      isContact: json['is_contact'] as bool?,
      showDivider: json['show_divider'] as bool?,
      icon: (json['icon'] as List<dynamic>?)
          ?.map((e) =>
              PHXSectionItemDetailIconData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PHXSectionItemBottomInfoDataToJson(
        _PHXSectionItemBottomInfoData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'sub_title': instance.subTitle,
      'avatar_url': instance.avatarUrl,
      'is_contact': instance.isContact,
      'show_divider': instance.showDivider,
      'icon': instance.icon,
    };

_PHXListOptionData _$PHXListOptionDataFromJson(Map<String, dynamic> json) =>
    _PHXListOptionData(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      title: json['title'] as String?,
      isActive: json['is_active'] as bool?,
      extra: json['extra'] == null
          ? null
          : PHXExtraData.fromJson(json['extra'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PHXListOptionDataToJson(_PHXListOptionData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'title': instance.title,
      'is_active': instance.isActive,
      'extra': instance.extra,
    };

_PHXBottomActionData _$PHXBottomActionDataFromJson(Map<String, dynamic> json) =>
    _PHXBottomActionData(
      title: json['title'] as String?,
      type: json['type'] as String?,
      extra: json['extra'] == null
          ? null
          : PHXExtraData.fromJson(json['extra'] as Map<String, dynamic>),
      bottomSheet: json['bottom_sheet'] == null
          ? null
          : PHXBottomSheetData.fromJson(
              json['bottom_sheet'] as Map<String, dynamic>),
      isHiddenAction: json['is_hidden_action'] as bool?,
      isShowSubTitle: json['is_show_sub_title'] as bool?,
      subTitle: json['sub_title'] as String?,
      students: (json['students'] as List<dynamic>?)
          ?.map((e) => PHXStudentData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PHXBottomActionDataToJson(
        _PHXBottomActionData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'type': instance.type,
      'extra': instance.extra?.toJson(),
      'bottom_sheet': instance.bottomSheet?.toJson(),
      'is_hidden_action': instance.isHiddenAction,
      'is_show_sub_title': instance.isShowSubTitle,
      'sub_title': instance.subTitle,
      'students': instance.students?.map((e) => e.toJson()).toList(),
    };

_PHXDataModalContentData _$PHXDataModalContentDataFromJson(
        Map<String, dynamic> json) =>
    _PHXDataModalContentData(
      title: json['title'] as String?,
      titleColor: json['title_color'] as String?,
      content: json['content'] as String?,
      showDivider: json['show_divider'] as bool?,
      isItalics: json['is_italics'] as bool?,
    );

Map<String, dynamic> _$PHXDataModalContentDataToJson(
        _PHXDataModalContentData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'title_color': instance.titleColor,
      'content': instance.content,
      'show_divider': instance.showDivider,
      'is_italics': instance.isItalics,
    };

_PHXDataModalTabData _$PHXDataModalTabDataFromJson(Map<String, dynamic> json) =>
    _PHXDataModalTabData(
      title: json['title'] as String?,
      isActive: json['is_active'] as bool?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PHXDataModalTabDataToJson(
        _PHXDataModalTabData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'is_active': instance.isActive,
      'id': instance.id,
    };

_PHXDataModalData _$PHXDataModalDataFromJson(Map<String, dynamic> json) =>
    _PHXDataModalData(
      title: json['title'] as String?,
      tabs: (json['tabs'] as List<dynamic>?)
          ?.map((e) => PHXDataModalTabData.fromJson(e as Map<String, dynamic>))
          .toList(),
      content: (json['content'] as List<dynamic>?)
          ?.map((e) =>
              PHXDataModalContentData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PHXDataModalDataToJson(_PHXDataModalData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'tabs': instance.tabs,
      'content': instance.content,
    };

_PHXBottomSheetData _$PHXBottomSheetDataFromJson(Map<String, dynamic> json) =>
    _PHXBottomSheetData(
      sheetTitle: json['sheet_title'] as String?,
      sheetDescription: (json['sheet_description'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      bottomSheetType: json['bottom_sheet_type'] as String?,
      sheetContent: (json['sheet_content'] as List<dynamic>?)
          ?.map((e) =>
              PHXBottomSheetContentData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PHXBottomSheetDataToJson(_PHXBottomSheetData instance) =>
    <String, dynamic>{
      'sheet_title': instance.sheetTitle,
      'sheet_description': instance.sheetDescription,
      'bottom_sheet_type': instance.bottomSheetType,
      'sheet_content': instance.sheetContent,
    };

_PHXBottomSheetContentData _$PHXBottomSheetContentDataFromJson(
        Map<String, dynamic> json) =>
    _PHXBottomSheetContentData(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      subTitle: json['sub_title'] as String?,
      imageUrl: json['image_url'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$PHXBottomSheetContentDataToJson(
        _PHXBottomSheetContentData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'sub_title': instance.subTitle,
      'image_url': instance.imageUrl,
      'content': instance.content,
    };

_PHXExtraData _$PHXExtraDataFromJson(Map<String, dynamic> json) =>
    _PHXExtraData(
      teacherId: (json['teacher_id'] as num?)?.toInt(),
      phoneNumber: json['phone_number'] as String?,
      groupId: (json['group_id'] as num?)?.toInt(),
      callModalData: json['call_modal_data'] as bool?,
      dataModal: json['data_modal'] == null
          ? null
          : PHXDataModalData.fromJson(
              json['data_modal'] as Map<String, dynamic>),
      titlePage: json['title_page'] as String?,
      subTitlePage: json['sub_title_page'] as String?,
      showDivider: json['show_divider'] as bool?,
      isItalics: json['is_italics'] as bool?,
      studentCode: json['student_code'] as String?,
      serviceCode: json['service_code'] as String?,
      shiftCode: json['shift_code'] as String?,
      bodyCancel: json['body_cancel'] == null
          ? null
          : BodyCancelData.fromJson(
              json['body_cancel'] as Map<String, dynamic>),
      listCalendar: (json['list_calendar'] as List<dynamic>?)
          ?.map((e) => MonthCalendarData.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalDayOff: (json['total_day_off'] as num?)?.toDouble(),
      messCancelFood: json['mess_cancel_food'] == null
          ? null
          : MessCancelFoodData.fromJson(
              json['mess_cancel_food'] as Map<String, dynamic>),
      title: json['title'] as String?,
      content: json['content'] as String?,
      banner: json['banner'] as String?,
      status: (json['status'] as List<dynamic>?)
          ?.map((e) => PHXStatusLegendData.fromJson(e as Map<String, dynamic>))
          .toList(),
      infoBanner: json['info_banner'] as String?,
      statusCode: json['status_code'] as String?,
      studentId: (json['student_id'] as num?)?.toInt(),
      schoolYearId: (json['school_year_id'] as num?)?.toInt(),
      requestId: (json['request_id'] as num?)?.toInt(),
      schoolId: (json['school_id'] as num?)?.toInt(),
      listMonthRegister: (json['list_month_register'] as List<dynamic>?)
          ?.map((e) => PHXMonthData.fromJson(e as Map<String, dynamic>))
          .toList(),
      isCancelRequest: json['is_cancel_request'] as bool?,
      educationalCode: json['educational_code'] as String?,
      foodSectionId: (json['food_section_id'] as num?)?.toInt(),
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      menuName: json['menu_name'] as String?,
      isImageDefault: json['is_image_default'] as bool?,
      isViewRequestCancel: json['is_view_request_cancel'] as bool?,
      requestCancelId: (json['request_cancel_id'] as num?)?.toInt(),
      hasNextPage: json['has_next_page'] as bool?,
      endCusor: json['endCusor'] as String?,
      page: (json['page'] as num?)?.toInt(),
      pageSize: (json['page_size'] as num?)?.toInt(),
      schoolTermId: (json['school_term_id'] as num?)?.toInt(),
      monthId: (json['month_id'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      totalPage: (json['totalPage'] as num?)?.toInt(),
      remaining: (json['remaining'] as num?)?.toInt(),
      registerLink: json['register_link'] as String?,
      navigatorButtonName: json['navigator_button_name'] as String?,
      subjectId: (json['subject_id'] as num?)?.toInt(),
      subLable: json['sub_lable'] as String?,
    );

Map<String, dynamic> _$PHXExtraDataToJson(_PHXExtraData instance) =>
    <String, dynamic>{
      'teacher_id': instance.teacherId,
      'phone_number': instance.phoneNumber,
      'group_id': instance.groupId,
      'call_modal_data': instance.callModalData,
      'data_modal': instance.dataModal?.toJson(),
      'title_page': instance.titlePage,
      'sub_title_page': instance.subTitlePage,
      'show_divider': instance.showDivider,
      'is_italics': instance.isItalics,
      'student_code': instance.studentCode,
      'service_code': instance.serviceCode,
      'shift_code': instance.shiftCode,
      'body_cancel': instance.bodyCancel?.toJson(),
      'list_calendar': instance.listCalendar?.map((e) => e.toJson()).toList(),
      'total_day_off': instance.totalDayOff,
      'mess_cancel_food': instance.messCancelFood?.toJson(),
      'title': instance.title,
      'content': instance.content,
      'banner': instance.banner,
      'status': instance.status?.map((e) => e.toJson()).toList(),
      'info_banner': instance.infoBanner,
      'status_code': instance.statusCode,
      'student_id': instance.studentId,
      'school_year_id': instance.schoolYearId,
      'request_id': instance.requestId,
      'school_id': instance.schoolId,
      'list_month_register':
          instance.listMonthRegister?.map((e) => e.toJson()).toList(),
      'is_cancel_request': instance.isCancelRequest,
      'educational_code': instance.educationalCode,
      'food_section_id': instance.foodSectionId,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'menu_name': instance.menuName,
      'is_image_default': instance.isImageDefault,
      'is_view_request_cancel': instance.isViewRequestCancel,
      'request_cancel_id': instance.requestCancelId,
      'has_next_page': instance.hasNextPage,
      'endCusor': instance.endCusor,
      'page': instance.page,
      'page_size': instance.pageSize,
      'school_term_id': instance.schoolTermId,
      'month_id': instance.monthId,
      'total': instance.total,
      'totalPage': instance.totalPage,
      'remaining': instance.remaining,
      'register_link': instance.registerLink,
      'navigator_button_name': instance.navigatorButtonName,
      'subject_id': instance.subjectId,
      'sub_lable': instance.subLable,
    };

_PHXEmptyStateData _$PHXEmptyStateDataFromJson(Map<String, dynamic> json) =>
    _PHXEmptyStateData(
      title: json['title'] as String?,
      subTitle: json['sub_title'] as String?,
      isShowButton: json['is_show_button'] as bool?,
      buttonLabel: json['button_label'] as String?,
    );

Map<String, dynamic> _$PHXEmptyStateDataToJson(_PHXEmptyStateData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'sub_title': instance.subTitle,
      'is_show_button': instance.isShowButton,
      'button_label': instance.buttonLabel,
    };

_PHXTableData _$PHXTableDataFromJson(Map<String, dynamic> json) =>
    _PHXTableData(
      title: json['title'] as String?,
      content: json['content'] == null
          ? null
          : PHXTableContentData.fromJson(
              json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PHXTableDataToJson(_PHXTableData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
    };

_PHXTableContentData _$PHXTableContentDataFromJson(Map<String, dynamic> json) =>
    _PHXTableContentData(
      headers:
          (json['headers'] as List<dynamic>?)?.map((e) => e as String).toList(),
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
    );

Map<String, dynamic> _$PHXTableContentDataToJson(
        _PHXTableContentData instance) =>
    <String, dynamic>{
      'headers': instance.headers,
      'rows': instance.rows,
    };

_CalendarItemData _$CalendarItemDataFromJson(Map<String, dynamic> json) =>
    _CalendarItemData(
      content: json['content'] as String?,
      date: json['date'] as String?,
      dateToCallApi: json['date_to_call_api'] as String?,
      dayOfWeek: json['dayOfWeek'] as String?,
      isCurrentMonth: json['isCurrentMonth'] as bool?,
      isToday: json['isToday'] as bool?,
      active: json['active'] as bool?,
      isPast: json['isPast'] as bool?,
      isWeekend: json['isWeekend'] as bool?,
      type: json['type'] as String?,
      scheduleSetting: json['schedule_setting'] as String?,
      isHalfDay: json['is_half_day'] as bool?,
      isFullDay: json['is_full_day'] as bool?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$CalendarItemDataToJson(_CalendarItemData instance) =>
    <String, dynamic>{
      'content': instance.content,
      'date': instance.date,
      'date_to_call_api': instance.dateToCallApi,
      'dayOfWeek': instance.dayOfWeek,
      'isCurrentMonth': instance.isCurrentMonth,
      'isToday': instance.isToday,
      'active': instance.active,
      'isPast': instance.isPast,
      'isWeekend': instance.isWeekend,
      'type': instance.type,
      'schedule_setting': instance.scheduleSetting,
      'is_half_day': instance.isHalfDay,
      'is_full_day': instance.isFullDay,
      'status': instance.status,
    };

_MonthCalendarData _$MonthCalendarDataFromJson(Map<String, dynamic> json) =>
    _MonthCalendarData(
      month: json['month'] as String?,
      current: json['current'] as bool?,
      dayOfMonth: (json['day_of_month'] as List<dynamic>?)
          ?.map((e) => CalendarItemData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MonthCalendarDataToJson(_MonthCalendarData instance) =>
    <String, dynamic>{
      'month': instance.month,
      'current': instance.current,
      'day_of_month': instance.dayOfMonth?.map((e) => e.toJson()).toList(),
    };

_MessCancelFoodData _$MessCancelFoodDataFromJson(Map<String, dynamic> json) =>
    _MessCancelFoodData(
      title: json['title'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$MessCancelFoodDataToJson(_MessCancelFoodData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
    };

_BodyCancelData _$BodyCancelDataFromJson(Map<String, dynamic> json) =>
    _BodyCancelData(
      registerId: (json['register_id'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$BodyCancelDataToJson(_BodyCancelData instance) =>
    <String, dynamic>{
      'register_id': instance.registerId,
      'type': instance.type,
    };

_PHXMonthData _$PHXMonthDataFromJson(Map<String, dynamic> json) =>
    _PHXMonthData(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      isActive: json['is_active'] as bool?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$PHXMonthDataToJson(_PHXMonthData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_active': instance.isActive,
      'code': instance.code,
    };

_PHXStatusLegendData _$PHXStatusLegendDataFromJson(Map<String, dynamic> json) =>
    _PHXStatusLegendData(
      title: json['title'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$PHXStatusLegendDataToJson(
        _PHXStatusLegendData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'status': instance.status,
    };
