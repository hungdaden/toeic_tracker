import 'package:injectable/injectable.dart';
import 'phx_screen_response.dart';
import 'phx_screen_response_data.dart';

@injectable

///
class PHXScreenResponseMapper {
  const PHXScreenResponseMapper();

  ///
  PHXScreenResponseEntity mapToEntity(PHXScreenResponseData? data) {
    return PHXScreenResponseEntity(data: _mapScreenData(data?.data));
  }

  PHXScreenDataEntity? _mapScreenData(PHXScreenDataData? data) {
    if (data == null) {
      return null;
    }
    return PHXScreenDataEntity(
      appBar: _mapAppBar(data.appBar),
      headerInfo: _mapHeaderInfo(data.headerInfo),
      tabs: data.tabs != null
          ? [
              for (final item in data.tabs!)
                PHXTabEntity(
                  title: item.title,
                  id: item.id,
                  code: item.code,
                  content: item.content,
                  isTarget: item.isTarget,
                  isActive: item.isActive,
                  count: item.count,
                  extra: _mapExtra(item.extra),
                ),
            ]
          : null,
      emptyState: _mapEmptyState(data.emptyState),
      table: _mapTable(data.table),
      sections: _mapSections(data.sections),
      sectionsBottomSheet: _mapSections(data.sectionsBottomSheet),
      listOptions: data.listOptions != null
          ? [
              for (final option in data.listOptions!)
                PHXListOptionEntity(
                  id: option.id,
                  code: option.code,
                  title: option.title,
                  isActive: option.isActive,
                  extra: _mapExtra(option.extra),
                ),
            ]
          : null,
      bottomActions: (data.bottomActions) != null
          ? [
              for (final action in (data.bottomActions)!)
                PHXBottomActionEntity(
                  title: action.title,
                  type: action.type,
                  extra: _mapExtra(action.extra),
                  bottomSheet: _mapBottomSheet(action.bottomSheet),
                  isHiddenAction: action.isHiddenAction,
                  isShowSubTitle: action.isShowSubTitle,
                  subTitle: action.subTitle,
                  students: action.students != null
                      ? [
                          for (final st in action.students!)
                            PHXStudentEntity(
                              id: st.id,
                              studentId: st.studentId,
                              name: st.name,
                              avatarUrl: st.avatarUrl,
                              subTitle: st.subTitle,
                            ),
                        ]
                      : null,
                ),
            ]
          : null,
    );
  }

  PHXBottomSheetEntity? _mapBottomSheet(PHXBottomSheetData? data) {
    if (data == null) {
      return null;
    }
    return PHXBottomSheetEntity(
      sheetTitle: data.sheetTitle,
      sheetDescription: data.sheetDescription,
      bottomSheetType: data.bottomSheetType,
      sheetContent: data.sheetContent != null
          ? [
              for (final content in data.sheetContent!)
                PHXBottomSheetContentEntity(
                  id: content.id,
                  title: content.title,
                  subTitle: content.subTitle,
                  imageUrl: content.imageUrl,
                  content: content.content,
                ),
            ]
          : null,
    );
  }

  List<PHXSectionEntity>? _mapSections(List<PHXSectionData>? sections) {
    if (sections == null) return null;
    return [
      for (final section in sections)
        PHXSectionEntity(
          title: section.title,
          heading: section.heading,
          iconUrl: section.iconUrl,
          bottomSheet: _mapSections(section.bottomSheet),
          extra: _mapExtra(section.extra),
          items: section.items != null
              ? [
                  for (final item in section.items!)
                    PHXSectionItemEntity(
                      id: item.id,
                      title: item.title,
                      content: item.content,
                      subTitle: item.subTitle,
                      hasAvatar: item.hasAvatar,
                      description: item.description,
                      imageUrl: item.imageUrl,
                      isNext: item.isNext,
                      showDivider: item.showDivider,
                      extra: _mapExtra(item.extra),
                      details: item.details != null
                          ? [
                              for (final detail in item.details!)
                                PHXSectionItemDetailEntity(
                                  id: detail.id,
                                  title: detail.title,
                                  content: detail.content,
                                  showDivider: detail.showDivider,
                                  isBreakLine: detail.isBreakLine,
                                  isJustify: detail.isJustify,
                                  badgeType: detail.badgeType,
                                  badge: detail.badge != null
                                      ? PHXSectionItemBadgeEntity(
                                          title: detail.badge!.title,
                                          content: detail.badge!.content,
                                          badgeType: detail.badge!.badgeType,
                                        )
                                      : null,
                                  isActionItem: detail.isActionItem,
                                  imageUrl: detail.imageUrl,
                                  extra: _mapExtra(detail.extra),
                                  icon: detail.icon != null
                                      ? [
                                          for (final iconItem in detail.icon!)
                                            PHXSectionItemDetailIconEntity(
                                              url: iconItem.url,
                                              action: iconItem.action,
                                            ),
                                        ]
                                      : null,
                                  type: detail.type != null
                                      ? [
                                          for (final typeItem in detail.type!)
                                            PHXSectionContentTypeEntity(
                                              isDisable: typeItem.isDisable,
                                              isEnable: typeItem.isEnable,
                                              isTextArea: typeItem.isTextArea,
                                            ),
                                        ]
                                      : null,
                                ),
                            ]
                          : null,
                      badge: item.badge != null
                          ? PHXSectionItemBadgeEntity(
                              title: item.badge!.title,
                              content: item.badge!.content,
                              badgeType: item.badge!.badgeType,
                            )
                          : null,
                      bottomInfo: item.bottomInfo != null
                          ? PHXSectionItemBottomInfoEntity(
                              title: item.bottomInfo!.title,
                              subTitle: item.bottomInfo!.subTitle,
                              avatarUrl: item.bottomInfo!.avatarUrl,
                              isContact: item.bottomInfo!.isContact,
                              showDivider: item.bottomInfo!.showDivider,
                              icon: item.bottomInfo!.icon != null
                                  ? [
                                      for (final iconItem in item.bottomInfo!.icon!)
                                        PHXSectionItemDetailIconEntity(
                                          url: iconItem.url,
                                          action: iconItem.action,
                                        ),
                                    ]
                                  : null,
                            )
                          : null,
                      avatarName: item.avatarName,
                      avatarSubtitle: item.avatarSubtitle,
                      avatarUrl: item.avatarUrl,
                      students: item.students != null
                          ? [
                              for (final student in item.students!)
                                PHXStudentEntity(
                                  id: student.id,
                                  name: student.name,
                                  avatarUrl: student.avatarUrl,
                                )
                            ]
                          : null,
                      studentId: item.studentId,
                      redDot: item.redDot,
                      uuid: item.uuid,
                      multiBadge: item.multiBadge != null
                          ? [
                              for (final mb in item.multiBadge!)
                                PHXMultiBadgeEntity(
                                  badgeType: mb.badgeType,
                                  content: mb.content,
                                  title: mb.title,
                                ),
                            ]
                          : null,
                      payload: _mapPayload(item.payload),
                    ),
                ]
              : null,
        ),
    ];
  }

  PHXHeaderInfoEntity? _mapHeaderInfo(PHXHeaderInfoData? data) {
    if (data == null) {
      return null;
    }
    return PHXHeaderInfoEntity(
      title: data.title,
      content: data.content,
      avatar: data.avatar,
    );
  }

  PHXAppBarEntity? _mapAppBar(PHXAppBarData? data) {
    if (data == null) {
      return null;
    }
    return PHXAppBarEntity(
      title: data.title,
      subTitle: data.subTitle,
    );
  }

  PHXExtraEntity? _mapExtra(PHXExtraData? data) {
    if (data == null) {
      return null;
    }
    return PHXExtraEntity(
      teacherId: data.teacherId,
      phoneNumber: data.phoneNumber,
      studentCode: data.studentCode,
      serviceCode: data.serviceCode,
      shiftCode: data.shiftCode,
      bodyCancel: _mapBodyCancel(data.bodyCancel),
      groupId: data.groupId,
      callModalData: data.callModalData,
      dataModal: _mapDataModal(data.dataModal),
      titlePage: data.titlePage,
      subTitlePage: data.subTitlePage,
      showDivider: data.showDivider,
      isItalics: data.isItalics,
      listCalendar:
          data.listCalendar?.map((e) => _mapMonthCalendar(e)).whereType<MonthCalendar>().toList(),
      totalDayOff: data.totalDayOff,
      messCancelFood: _mapMessCancelFood(data.messCancelFood),
      title: data.title,
      content: data.content,
      banner: data.banner,
      status:
          data.status?.map((e) => PHXStatusLegendEntity(title: e.title, status: e.status)).toList(),
      infoBanner: data.infoBanner,
      statusCode: data.statusCode,
      studentId: data.studentId,
      schoolYearId: data.schoolYearId,
      requestId: data.requestId,
      schoolId: data.schoolId,
      listMonthRegister:
          data.listMonthRegister?.map((e) => _mapMonth(e)).whereType<PHXMonth>().toList(),
      isCancelRequest: data.isCancelRequest,
      educationalCode: data.educationalCode,
      foodSectionId: data.foodSectionId,
      startDate: data.startDate,
      endDate: data.endDate,
      menuName: data.menuName,
      isImageDefault: data.isImageDefault,
      isViewRequestCancel: data.isViewRequestCancel,
      requestCancelId: data.requestCancelId,
      hasNextPage: data.hasNextPage,
      endCusor: data.endCusor,
      page: data.page,
      pageSize: data.pageSize,
      total: data.total,
      totalPage: data.totalPage,
      remaining: data.remaining,
      schoolTermId: data.schoolTermId,
      monthId: data.monthId,
      registerLink: data.registerLink,
      navigatorButtonName: data.navigatorButtonName,
      subjectId: data.subjectId,
      subLable: data.subLable,
    );
  }

  BodyCancelEntity? _mapBodyCancel(BodyCancelData? data) {
    if (data == null) return null;
    return BodyCancelEntity(
      registerId: data.registerId ?? [],
      type: data.type ?? '',
    );
  }

  MonthCalendar? _mapMonthCalendar(MonthCalendarData? data) {
    if (data == null) return null;
    return MonthCalendar(
      month: data.month ?? '',
      current: data.current ?? false,
      dayOfMonth:
          data.dayOfMonth?.map((e) => _mapCalendarItem(e)).whereType<CalendarItem>().toList() ?? [],
    );
  }

  CalendarItem? _mapCalendarItem(CalendarItemData? data) {
    if (data == null) return null;
    return CalendarItem(
      content: data.content ?? '',
      date: data.date ?? '',
      dateToCallApi: data.dateToCallApi ?? '',
      dayOfWeek: data.dayOfWeek ?? '',
      isCurrentMonth: data.isCurrentMonth ?? false,
      isToday: data.isToday ?? false,
      active: data.active ?? false,
      isPast: data.isPast ?? false,
      isWeekend: data.isWeekend ?? false,
      type: data.type ?? '',
      scheduleSetting: data.scheduleSetting ?? '',
      isHalfDay: data.isHalfDay ?? false,
      isFullDay: data.isFullDay ?? false,
      status: data.status,
    );
  }

  MessCancelFood? _mapMessCancelFood(MessCancelFoodData? data) {
    if (data == null) return null;
    return MessCancelFood(
      title: data.title ?? '',
      content: data.content ?? '',
    );
  }

  PHXMonth? _mapMonth(PHXMonthData? data) {
    if (data == null) return null;
    return PHXMonth(
      id: data.id ?? 0,
      name: data.name ?? '-',
      isActive: data.isActive ?? false,
      code: data.code ?? '',
    );
  }

  PHXDataModalEntity? _mapDataModal(PHXDataModalData? data) {
    if (data == null) return null;
    return PHXDataModalEntity(
      title: data.title,
      tabs: data.tabs
          ?.map((e) => PHXDataModalTabEntity(
                title: e.title,
                isActive: e.isActive,
                id: e.id,
              ))
          .toList(),
      content: data.content
          ?.map((e) => PHXDataModalContentEntity(
                title: e.title,
                titleColor: e.titleColor,
                content: e.content,
                showDivider: e.showDivider,
                isItalics: e.isItalics,
              ))
          .toList(),
    );
  }

  PHXEmptyStateEntity? _mapEmptyState(PHXEmptyStateData? data) => data == null
      ? null
      : PHXEmptyStateEntity(
          title: data.title,
          subTitle: data.subTitle,
          isShowButton: data.isShowButton,
          buttonLabel: data.buttonLabel,
        );

  PHXTableEntity? _mapTable(PHXTableData? data) {
    if (data == null) return null;
    return PHXTableEntity(
      title: data.title,
      content: data.content != null
          ? PHXTableContentEntity(
              headers: data.content!.headers,
              rows: data.content!.rows,
            )
          : null,
    );
  }

  PHXPayloadEntity? _mapPayload(PHXPayloadData? data) {
    if (data == null) return null;
    return PHXPayloadEntity(
      action: data.action,
      type: data.type,
      title: data.title,
      content: data.content,
      notificationId: data.notificationId,
      studentCode: data.studentCode,
      attendanceLessonId: data.attendanceLessonId,
      assignId: data.assignId,
      subsystem: data.subsystem,
      status: data.status,
      eventType: data.eventType,
      classroomName: data.classroomName,
      schoolYearId: data.schoolYearId,
      borrowTicketState: data.borrowTicketState,
      id: data.id,
      studentId: data.studentId,
      quickExaminationId: data.quickExaminationId,
      orderId: data.orderId,
      feedbackId: data.feedbackId,
      typeDetail: data.typeDetail,
      inappNotiId: data.inappNotiId,
      hasShareMessage: data.hasShareMessage,
      monthId: data.monthId,
      schoolTermId: data.schoolTermId,
      code: data.code,
      requestId: data.requestId,
      schoolId: data.schoolId,
      isCancelRequest: data.isCancelRequest,
    );
  }
}
