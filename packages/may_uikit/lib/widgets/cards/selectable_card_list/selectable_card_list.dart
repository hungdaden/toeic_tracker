import 'dart:async';

import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit_internal.dart';

enum BottomSheetRadioPersonCardListType { grouped, card }

enum SelectableCardListViewType { list, bottomSheet }

class PersonCardRadioOption<T> {
  const PersonCardRadioOption({
    this.value,
    this.name,
    this.subtitle,
    this.isShowImage,
    this.imageUrl,
    this.enabled,
    this.id,
    this.code,
    this.customTitle,
    this.timeLabel,
    this.unreadBadgeLabel,
    this.avatarText,
    this.isUnread,
    this.parentInfo,
  });

  final T? value;
  final String? name;
  final String? subtitle;
  final bool? isShowImage;
  final String? imageUrl;
  final bool? enabled;
  final int? id;
  final String? code;
  final List<CardData>? customTitle;
  final String? timeLabel;
  final String? unreadBadgeLabel;
  final String? avatarText;
  final bool? isUnread;
  final List<CardData>? parentInfo;
}

/// Displays selectable person-card options as grouped rows or separate cards.
class SelectableCardList<T> extends StatefulWidget {
  /// Creates a selectable list from [options] and reports selection through [onConfirm].
  const SelectableCardList({
    required this.options,
    required this.onConfirm,
    super.key,
    this.selectedValues = const [],
    this.onItemTap,
    this.onSelectionChanged,
    this.padding,
    this.groupedDividerIndent,
    this.backgroundMargin = const EdgeInsets.symmetric(horizontal: DimensV2.d20),
    this.confirmButtonMargin = const EdgeInsets.all(DimensV2.d20),
    this.headerMargin = const EdgeInsets.only(
      bottom: DimensV2.d12,
      left: DimensV2.d20,
      right: DimensV2.d20,
    ),
    this.confirmButtonLabel = 'Xác nhận',
    this.selectedSummaryLabel = 'Danh sách đã chọn',
    this.selectAllLabel = 'Chọn tất cả',
    this.deselectAllLabel = 'Bỏ chọn tất cả',
    this.listType = BottomSheetRadioPersonCardListType.grouped,
    this.viewType = SelectableCardListViewType.bottomSheet,
    this.borderRadius = DimensV2.d20,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = DimensV2.d_05,
    this.shadowColor,
    this.shrinkWrap = true,
    this.physics = const NeverScrollableScrollPhysics(),
    this.selectionKeyBuilder,
    this.cardLoadingValue,
    this.cardLoading = false,
    this.persistCardSelection = true,
    this.showCardSelectionBeforeConfirm = true,
    this.cardSelectionVisibleDuration = const Duration(milliseconds: 100),
    this.confirmButtonEnabled,
    this.confirmButtonLoading = false,
    this.isLoading = false,
    this.isSearching = false,
    this.emptyText,
    this.customEmptyText,
    this.onRefresh,
    this.isShowHeader = true,
    this.isShowConfirmButton = true,
    this.isShowCheckbox = true,
    this.maxHeight,
    this.onEndOfPage,
    this.isLoadingMore = false,
    this.noMoreData = false,
    this.loadingMoreIndicator,
    this.noMoreDataWidget,
    this.loadMoreOffset = 1,
    this.showScrollbar = false,
    this.emptyStateMinHeight,
    this.colorHeaderGrouped,
    this.itemType = PersonCardItemContentType.checkbox,
    this.enableHoverEffect = false,
    this.useFlexibleWhenShrinkWrap = false,
  });

  final List<T> selectedValues;
  final List<PersonCardRadioOption<T>> options;
  final ValueChanged<List<T>> onConfirm;
  final FutureOr<void> Function(PersonCardRadioOption<T> option)? onItemTap;
  final ValueChanged<List<T>>? onSelectionChanged;
  final EdgeInsetsGeometry? padding;

  /// Overrides the leading indent of dividers between grouped list items.
  final double? groupedDividerIndent;

  final double borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderWidth;

  /// Overrides the grouped card shadow while preserving the themed default when null.
  final Color? shadowColor;

  final bool shrinkWrap;
  final ScrollPhysics physics;
  final EdgeInsetsGeometry backgroundMargin;
  final EdgeInsetsGeometry headerMargin;
  final EdgeInsetsGeometry confirmButtonMargin;
  final String confirmButtonLabel;
  final String selectedSummaryLabel;
  final String selectAllLabel;
  final String deselectAllLabel;
  final BottomSheetRadioPersonCardListType listType;
  final SelectableCardListViewType viewType;
  final String? Function(T value)? selectionKeyBuilder;
  final T? cardLoadingValue;
  final bool cardLoading;
  final bool persistCardSelection;
  final bool showCardSelectionBeforeConfirm;
  final Duration cardSelectionVisibleDuration;
  final bool? confirmButtonEnabled;
  final bool confirmButtonLoading;
  final bool isLoading;
  final bool isSearching;
  final String? emptyText;
  final String? customEmptyText;
  final Future<void> Function()? onRefresh;
  final bool isShowHeader;
  final bool isShowConfirmButton;
  final bool isShowCheckbox;
  final double? maxHeight;
  final VoidCallback? onEndOfPage;
  final bool isLoadingMore;
  final bool noMoreData;
  final Widget? loadingMoreIndicator;
  final Widget? noMoreDataWidget;
  final double loadMoreOffset;
  final bool showScrollbar;
  final double? emptyStateMinHeight;
  final Color? colorHeaderGrouped;
  final PersonCardItemContentType itemType;
  final bool enableHoverEffect;
  final bool useFlexibleWhenShrinkWrap;

  @override
  State<SelectableCardList<T>> createState() => _SelectableCardListState<T>();
}

@Deprecated('Use SelectableCardList instead.')
typedef BottomSheetRadioPersonCardList<T> = SelectableCardList<T>;

class _SelectableCardListState<T> extends State<SelectableCardList<T>> {
  late final List<T> _selectedValues = [...widget.selectedValues];
  final ScrollController _outerScrollController = ScrollController();
  final Map<String, double> _groupedItemHeights = {};
  bool _isWaitingLoadMore = false;

  bool get _isGrouped => widget.listType == BottomSheetRadioPersonCardListType.grouped;
  bool get _isBottomSheetView => widget.viewType == SelectableCardListViewType.bottomSheet;
  bool get _isChatList => widget.itemType == PersonCardItemContentType.chat;
  bool get _showEmptyState => !widget.isLoading && widget.options.isEmpty;
  Color get _effectiveBackgroundColor => widget.backgroundColor ?? context.mayColors.bgCard;
  Color get _effectiveBorderColor => widget.borderColor ?? context.mayColors.bdDefault;
  Color? get _effectiveShadowColor =>
      widget.shadowColor ?? (_isBottomSheetView ? AppColorsV2.transparent : null);
  Color get _effectiveColorHeaderGrouped => widget.colorHeaderGrouped ?? context.mayColors.bgCard;
  bool get _useGroupedItemBorder => widget.options.any(
        (option) => option.parentInfo != null && option.parentInfo!.isNotEmpty,
      );
  bool get _isShowCheckbox =>
      widget.itemType == PersonCardItemContentType.checkbox && widget.isShowCheckbox;
  TextStyle? get _listNameStyle => _isBottomSheetView
      ? null
      : AppTextStylesV2.text16Semibold.copyWith(color: AppColorsV2.primaryText900);
  EdgeInsetsGeometry _groupedCheckboxTapPadding(PersonCardRadioOption<T> option) {
    final itemHeight =
        _groupedItemHeights[_groupedItemKey(option)] ?? _estimatedGroupedItemHeight(option);
    final verticalPadding = ((itemHeight - DimensV2.d24) / 2).clamp(0.0, double.infinity);

    return EdgeInsets.symmetric(horizontal: DimensV2.d16, vertical: verticalPadding);
  }

  String _groupedItemKey(PersonCardRadioOption<T> option) =>
      _optionKey(option) ??
      Object.hash(option.name, option.subtitle, option.customTitle).toString();

  double _estimatedGroupedItemHeight(PersonCardRadioOption<T> option) {
    final resolvedPadding = widget.padding?.resolve(Directionality.of(context));
    return DimensV2.d48 + (resolvedPadding?.vertical ?? 0.0);
  }

  void _handleGroupedItemSizeChange(PersonCardRadioOption<T> option, Size size) {
    final itemKey = _groupedItemKey(option);
    if (_groupedItemHeights[itemKey] == size.height) return;
    setState(() => _groupedItemHeights[itemKey] = size.height);
  }

  double get _groupedDividerLeft {
    final customIndent = widget.groupedDividerIndent;
    if (customIndent != null) return customIndent;
    if (_isChatList) return DimensV2.d80;
    return DimensV2.d76;
  }

  bool get _isAllSelected {
    final enabledOptions =
        widget.options.where((option) => (option.enabled ?? true) && option.value != null).toList();
    if (enabledOptions.isEmpty) return false;
    return enabledOptions.every(_isSelected);
  }

  String? _optionKey(PersonCardRadioOption<T> option) {
    final value = option.value;
    if (value == null) return option.id?.toString() ?? option.code;
    return option.id?.toString() ??
        widget.selectionKeyBuilder?.call(value) ??
        option.id?.toString() ??
        option.code ??
        value.toString();
  }

  String? _valueKey(T value) {
    final matchedOption = widget.options.firstWhere(
      (option) => option.value == value,
      orElse: () => PersonCardRadioOption<T>(value: value),
    );

    return matchedOption.id?.toString() ??
        widget.selectionKeyBuilder?.call(value) ??
        matchedOption.code ??
        value.toString();
  }

  bool _containsValue(T value) {
    final key = _valueKey(value);
    if (key == null) return _selectedValues.contains(value);
    return _selectedValues.any((selected) => _valueKey(selected) == key);
  }

  bool _isSelected(PersonCardRadioOption<T> option) {
    final value = option.value;
    if (value == null) return false;
    final key = _optionKey(option);
    if (key == null) return _selectedValues.contains(value);
    return _selectedValues.any((selected) => _valueKey(selected) == key);
  }

  bool _isCardLoading(PersonCardRadioOption<T> option) {
    if (!widget.cardLoading) return false;
    final loadingValue = widget.cardLoadingValue;
    final value = option.value;
    if (loadingValue == null || value == null) return false;
    final optionKey = _optionKey(option);
    final loadingKey = _valueKey(loadingValue);
    if (loadingKey == null || optionKey == null) return loadingValue == value;
    return loadingKey == optionKey;
  }

  List<CardData> _buildCustomTitleData(PersonCardRadioOption<T> option) {
    final customTitle = option.customTitle;
    if (customTitle == null || customTitle.isEmpty) return const <CardData>[];

    final lines = <CardData>[];
    if ((option.name ?? '').isNotEmpty) {
      lines.add(
        CardData(
          isCustomContent: true,
          customContent: Text(
            option.name ?? '',
            style: AppTextStylesV2.text16Semibold.copyWith(
              color: AppColorsV2.primaryText900,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    }

    for (final line in customTitle) {
      final content = _buildCardDataContent(line);
      if (content == null) continue;
      lines.add(CardData(isCustomContent: true, customContent: content));
    }

    return lines;
  }

  Widget? _buildCardDataContent(CardData line) {
    if (line.isCustomContent && line.customContent != null) return line.customContent;
    if (line.label.isEmpty && line.content.isEmpty) return null;

    if (line.isBreakLine == true) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (line.label.isNotEmpty)
            Text(
              line.label,
              style: AppTextStylesV2.text13Medium.copyWith(
                color: AppColorsV2.neutral500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          if (line.content.isNotEmpty)
            Text(
              line.content,
              style: AppTextStylesV2.text13Semibold.copyWith(
                color: line.color ?? AppColorsV2.neutral900,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
        ],
      );
    }

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: line.label,
            style: AppTextStylesV2.text13Medium.copyWith(
              color: AppColorsV2.neutral500,
            ),
          ),
          TextSpan(
            text: line.content,
            style: AppTextStylesV2.text13Semibold.copyWith(
              color: line.color ?? AppColorsV2.neutral900,
            ),
          ),
        ],
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildGroupedParentInfo(PersonCardRadioOption<T> option) {
    final parentInfo = option.parentInfo;
    if (parentInfo == null || parentInfo.isEmpty) return const SizedBox.shrink();

    final lines = parentInfo.map(_buildCardDataContent).whereType<Widget>().toList(growable: false);
    if (lines.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(
        left: DimensV2.d16,
        right: DimensV2.d16,
        bottom: DimensV2.d16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CommonDividerV2(),
          const SizedBox(height: DimensV2.d12),
          ...lines.expand((line) sync* {
            yield line;
            if (line != lines.last) yield const SizedBox(height: DimensV2.d8);
          }),
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(covariant SelectableCardList<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedValues != widget.selectedValues) {
      _selectedValues
        ..clear()
        ..addAll(widget.selectedValues);
    }
    if (_isWaitingLoadMore && (!widget.isLoadingMore || widget.noMoreData)) {
      _isWaitingLoadMore = false;
    }
  }

  @override
  void initState() {
    super.initState();
    _outerScrollController.addListener(_onOuterScroll);
  }

  @override
  void dispose() {
    _outerScrollController
      ..removeListener(_onOuterScroll)
      ..dispose();
    super.dispose();
  }

  void _onOuterScroll() {
    final onEndOfPage = widget.onEndOfPage;
    if (widget.onRefresh == null || onEndOfPage == null) return;
    if (!_outerScrollController.hasClients) return;

    final position = _outerScrollController.position;
    final max = position.maxScrollExtent;
    final current = position.pixels;

    if (max <= 0) {
      if (current < DimensV2.d50) return;
    } else {
      final triggerOffset =
          widget.loadMoreOffset < 1 ? max * widget.loadMoreOffset : max - DimensV2.d100;
      if (current < triggerOffset) return;
    }

    if (widget.isLoading || widget.isLoadingMore || widget.noMoreData || _isWaitingLoadMore) {
      return;
    }

    _isWaitingLoadMore = true;
    onEndOfPage();
  }

  Future<void> _toggleSelection(PersonCardRadioOption<T> option) async {
    if (!(option.enabled ?? true) || option.value == null) return;

    if (!_isGrouped) {
      final selectedValue = option.value as T;
      setState(() {
        _selectedValues
          ..clear()
          ..add(selectedValue);
      });
      final selected = List<T>.unmodifiable(_selectedValues);
      widget.onSelectionChanged?.call(selected);

      if (!widget.showCardSelectionBeforeConfirm) {
        widget.onConfirm(selected);
        return;
      }

      if (widget.cardSelectionVisibleDuration > Duration.zero) {
        await Future<void>.delayed(widget.cardSelectionVisibleDuration);
        if (!mounted) return;
      }
      widget.onConfirm(selected);
      if (mounted && !widget.persistCardSelection) {
        setState(() {
          _selectedValues
            ..clear()
            ..addAll(widget.selectedValues);
        });
      }
      return;
    }

    setState(() {
      final value = option.value as T;
      if (_isSelected(option)) {
        final optionKey = _optionKey(option);
        if (optionKey == null) {
          _selectedValues.remove(value);
        } else {
          _selectedValues.removeWhere((selected) => _valueKey(selected) == optionKey);
        }
      } else {
        if (!_containsValue(value)) {
          _selectedValues.add(value);
        }
      }
    });

    widget.onSelectionChanged?.call(List.unmodifiable(_selectedValues));
  }

  Future<void> _handleItemTap(PersonCardRadioOption<T> option) async {
    if (!(option.enabled ?? true) || option.value == null) return;

    final externalOnItemTap = widget.onItemTap;
    if (externalOnItemTap != null) {
      await externalOnItemTap(option);
      return;
    }

    await _toggleSelection(option);
  }

  Future<void> _handleCheckboxChanged(PersonCardRadioOption<T> option) async {
    if (!(option.enabled ?? true) || option.value == null) return;
    await _toggleSelection(option);
  }

  void _toggleSelectAll() {
    final enabledOptions =
        widget.options.where((option) => (option.enabled ?? true) && option.value != null).toList();

    setState(() {
      if (_isAllSelected) {
        final enabledKeys = enabledOptions.map(_optionKey).whereType<String>().toSet();
        _selectedValues.removeWhere((selected) {
          final selectedKey = _valueKey(selected);
          return selectedKey != null && enabledKeys.contains(selectedKey);
        });
      } else {
        for (final option in enabledOptions) {
          final value = option.value as T;
          if (!_containsValue(value)) {
            _selectedValues.add(value);
          }
        }
      }
    });

    widget.onSelectionChanged?.call(List.unmodifiable(_selectedValues));
  }

  void _confirmSelection() {
    widget.onConfirm(List.unmodifiable(_selectedValues));
  }

  BorderRadius _itemBorderRadius(int index) {
    final radius = Radius.circular(widget.borderRadius);
    final isFirst = index == 0;
    final isLast = index == widget.options.length - 1;

    return BorderRadius.only(
      topLeft: isFirst ? radius : Radius.zero,
      topRight: isFirst ? radius : Radius.zero,
      bottomLeft: isLast ? radius : Radius.zero,
      bottomRight: isLast ? radius : Radius.zero,
    );
  }

  BorderRadius _cardItemBorderRadius() {
    return BorderRadius.circular(DimensV2.d16);
  }

  ScrollPhysics get _groupedListPhysics {
    if (widget.physics is NeverScrollableScrollPhysics) {
      return const BouncingScrollPhysics();
    }
    return widget.physics;
  }

  ScrollPhysics get _cardListPhysics {
    if (widget.physics is NeverScrollableScrollPhysics) {
      return const BouncingScrollPhysics();
    }
    return widget.physics;
  }

  Widget _buildLazyLoadingList({
    required bool shrinkWrap,
    required ScrollPhysics physics,
    required int itemCount,
    required IndexedWidgetBuilder itemBuilder,
    Widget? separator,
  }) {
    return LazyLoadingList(
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: EdgeInsets.zero,
      itemCount: itemCount,
      onEndOfPage: widget.onEndOfPage,
      isLoading: widget.isLoadingMore,
      noMoreData: widget.noMoreData,
      loadingIndicator: widget.loadingMoreIndicator ?? defaultLoadingIndicator,
      noMoreDataWidget: widget.noMoreDataWidget,
      scrollOffset: widget.loadMoreOffset,
      showScrollbar: widget.showScrollbar,
      separator: separator,
      itemBuilder: itemBuilder,
    );
  }

  Widget _buildGroupedItem({
    required PersonCardRadioOption<T> option,
    required int index,
  }) {
    final customTitleData = _buildCustomTitleData(option);
    final hasCustomTitle = customTitleData.isNotEmpty;
    final resolvedPadding = widget.padding ??
        const EdgeInsets.symmetric(
          horizontal: AppSpacingV2.lg,
          vertical: DimensV2.d16,
        );
    final isFirst = index == 0;
    final isLast = index == widget.options.length - 1;
    final itemPadding = _isChatList && !_useGroupedItemBorder
        ? EdgeInsets.fromLTRB(
            AppSpacingV2.lg,
            isFirst ? AppSpacingV2.lg : AppSpacingV2.md,
            AppSpacingV2.lg,
            isLast ? AppSpacingV2.lg : AppSpacingV2.md,
          )
        : _useGroupedItemBorder
            ? resolvedPadding.resolve(Directionality.of(context)).copyWith(bottom: DimensV2.d12)
            : resolvedPadding;
    final content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _SelectableCardSizeReportingWidget(
          onSizeChange: (size) => _handleGroupedItemSizeChange(option, size),
          child: Opacity(
            opacity: option.enabled ?? true ? 1 : 0.4,
            child: PersonCardItem(
              isShowAvatar: option.isShowImage ?? true,
              imageUrl: option.imageUrl ?? '',
              padding: itemPadding,
              customBorderRadius: _useGroupedItemBorder || _isChatList
                  ? BorderRadius.zero
                  : _itemBorderRadius(index),
              backgroundColor: widget.backgroundColor,
              isShowBorder: false,
              name: option.name ?? '',
              nameStyle: _listNameStyle,
              subtitle: hasCustomTitle ? '' : option.subtitle ?? '',
              type: hasCustomTitle ? PersonCardType.dynamic : PersonCardType.normal,
              cardData: customTitleData,
              style: PersonCardItemStyle.bottomSheet,
              contentType: widget.itemType,
              timeLabel: option.timeLabel ?? '',
              unreadBadgeLabel: option.unreadBadgeLabel ?? '',
              avatarText: option.avatarText ?? '',
              isUnread: option.isUnread,
              enableHoverEffect: widget.enableHoverEffect,
              isShowCheckbox: _isShowCheckbox,
              checkboxValue: _isSelected(option),
              checkboxStyle: PersonCardCheckboxStyle.square,
              checkboxTapPadding: _groupedCheckboxTapPadding(option),
              onTap: option.enabled ?? true ? () => _handleItemTap(option) : null,
              onCheckboxChanged:
                  option.enabled ?? true ? (_) => _handleCheckboxChanged(option) : null,
            ),
          ),
        ),
        _buildGroupedParentInfo(option),
      ],
    );

    if (!_useGroupedItemBorder) return content;

    return PressableCardContainerV2(
      margin: const EdgeInsets.only(bottom: DimensV2.d12),
      color: _effectiveBackgroundColor,
      borderColor: _effectiveBorderColor,
      borderWidth: widget.borderWidth,
      borderRadius: widget.borderRadius,
      shadowColor: widget.shadowColor,
      child: ClipRRect(
        // borderRadius: BorderRadius.circular(
        //   (widget.borderRadius - widget.borderWidth).clamp(0.0, double.infinity),
        // ),
        child: content,
      ),
    );
  }

  Widget _buildGroupedEntry({
    required PersonCardRadioOption<T> option,
    required int index,
  }) {
    final item = _buildGroupedItem(option: option, index: index);
    final isLast = index == widget.options.length - 1;

    if (isLast || _useGroupedItemBorder) return item;

    if (_isChatList) {
      return Stack(
        children: [
          item,
          Positioned(
            left: _groupedDividerLeft,
            right: AppSpacingV2.lg,
            bottom: 0,
            child: IgnorePointer(
              child: SizedBox(
                key: ValueKey('selectable_card_list_chat_divider_$index'),
                height: DimensV2.d_05,
                child: ColoredBox(color: context.mayColors.dvDefault),
              ),
            ),
          ),
        ],
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        item,
        Padding(
          padding: EdgeInsets.only(left: _groupedDividerLeft, right: AppSpacingV2.lg),
          child: const CommonDividerV2(),
        ),
      ],
    );
  }

  Widget _buildGroupedList({
    required bool shrinkWrap,
    required ScrollPhysics physics,
  }) {
    return PressableCardContainerV2(
      margin: widget.backgroundMargin,
      color: _effectiveBackgroundColor,
      borderColor: _effectiveBorderColor,
      borderWidth: widget.borderWidth,
      borderRadius: widget.borderRadius,
      shadowColor: _effectiveShadowColor,
      pressedOffset: _isBottomSheetView ? 0 : DimensV2.d4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          (widget.borderRadius - widget.borderWidth).clamp(0.0, double.infinity),
        ),
        child: _buildLazyLoadingList(
          shrinkWrap: shrinkWrap,
          physics: physics,
          itemCount: widget.options.length,
          separator: const SizedBox.shrink(),
          itemBuilder: (context, index) {
            final option = widget.options[index];
            return _buildGroupedEntry(option: option, index: index);
          },
        ),
      ),
    );
  }

  Widget _buildGroupedHeader() {
    return ColoredBox(
      color: _effectiveColorHeaderGrouped,
      child: Padding(
        padding: widget.headerMargin,
        child: Row(
          children: [
            Expanded(
              child: Text(
                '${widget.selectedSummaryLabel} (${_selectedValues.length})',
                style: AppTextStylesV2.title15SemiBold.copyWith(
                  color: context.mayColors.txContentPrimaryDefault,
                ),
              ),
            ),
            GestureContainerV2(
              onTap: _toggleSelectAll,
              child: Text(
                _isAllSelected ? widget.deselectAllLabel : widget.selectAllLabel,
                style: AppTextStylesV2.labelSemiBold.copyWith(
                  color: AppColorsV2.primaryBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGroupedConfirmButton({
    required bool isConfirmEnabled,
    required bool isConfirmLoading,
  }) {
    return ColoredBox(
      color: _effectiveBackgroundColor,
      child: Padding(
        padding: widget.confirmButtonMargin,
        child: CommonButtonV2(
          size: CommonButtonSize.large,
          width: double.infinity,
          isEnabled: isConfirmEnabled && !isConfirmLoading,
          loading: isConfirmLoading,
          onTap: isConfirmEnabled ? _confirmSelection : null,
          label: widget.confirmButtonLabel,
        ),
      ),
    );
  }

  List<Widget> _buildGroupedChildren() {
    return widget.options.asMap().entries.map((entry) {
      final index = entry.key;
      final option = entry.value;
      return _buildGroupedEntry(option: option, index: index);
    }).toList(growable: false);
  }

  Widget _buildGroupedColumn() {
    return PressableCardContainerV2(
      margin: widget.backgroundMargin,
      color: _effectiveBackgroundColor,
      borderColor: _effectiveBorderColor,
      borderWidth: widget.borderWidth,
      borderRadius: widget.borderRadius,
      shadowColor: _effectiveShadowColor,
      pressedOffset: _isBottomSheetView ? 0 : DimensV2.d4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          (widget.borderRadius - widget.borderWidth).clamp(0.0, double.infinity),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ..._buildGroupedChildren(),
            if (widget.isLoadingMore)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: DimensV2.d12),
                child: widget.loadingMoreIndicator ?? defaultLoadingIndicator,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildGroupedContent({
    required bool isConfirmEnabled,
    required bool isConfirmLoading,
    bool applyMaxHeight = true,
  }) {
    final useInnerScroll = widget.onRefresh == null;
    final column = Column(
      mainAxisSize: widget.shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
      children: [
        if (widget.isShowHeader) _buildGroupedHeader(),
        if (!useInnerScroll)
          _buildGroupedColumn()
        else if (widget.shrinkWrap)
          widget.useFlexibleWhenShrinkWrap || applyMaxHeight
              ? Flexible(
                  fit: FlexFit.loose,
                  child: _buildGroupedList(
                    shrinkWrap: true,
                    physics: _groupedListPhysics,
                  ),
                )
              : _buildGroupedList(
                  shrinkWrap: true,
                  physics: _groupedListPhysics,
                )
        else
          Flexible(
            fit: FlexFit.tight,
            child: _buildGroupedList(
              shrinkWrap: false,
              physics: _groupedListPhysics,
            ),
          ),
        if (widget.isShowConfirmButton)
          _buildGroupedConfirmButton(
            isConfirmEnabled: isConfirmEnabled,
            isConfirmLoading: isConfirmLoading,
          ),
      ],
    );

    if (!applyMaxHeight || !widget.shrinkWrap) return column;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: widget.maxHeight ?? AppDimenV2.of(context).screenHeight * 0.8,
      ),
      child: column,
    );
  }

  Widget _buildCardList({
    required bool shrinkWrap,
    required ScrollPhysics physics,
  }) {
    final resolvedMargin = widget.backgroundMargin.resolve(Directionality.of(context));

    return Container(
      margin: resolvedMargin.copyWith(
        bottom: resolvedMargin.bottom == 0 ? DimensV2.d20 : resolvedMargin.bottom,
      ),
      child: _buildLazyLoadingList(
        shrinkWrap: shrinkWrap,
        physics: physics,
        itemCount: widget.options.length,
        separator: const SizedBox(height: DimensV2.d0),
        itemBuilder: (context, index) {
          final option = widget.options[index];
          final isSelected = _isSelected(option);
          final isLoading = _isCardLoading(option);
          final customTitleData = _buildCustomTitleData(option);
          final hasCustomTitle = customTitleData.isNotEmpty;
          final isLast = index == widget.options.length - 1;

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Opacity(
                opacity: option.enabled ?? true ? 1 : 0.4,
                child: PersonCardItem(
                  isShowAvatar: option.isShowImage ?? true,
                  imageUrl: option.imageUrl ?? '',
                  padding: const EdgeInsets.all(DimensV2.d12),
                  customBorderRadius: _cardItemBorderRadius(),
                  backgroundColor: isSelected ? AppColorsV2.neutral125 : AppColorsV2.genericWhite,
                  isShowBorder: false,
                  name: option.name ?? '',
                  nameStyle: _listNameStyle,
                  subtitle: hasCustomTitle ? '' : option.subtitle ?? '',
                  type: hasCustomTitle ? PersonCardType.dynamic : PersonCardType.normal,
                  cardData: customTitleData,
                  style: PersonCardItemStyle.bottomSheet,
                  contentType: widget.itemType,
                  timeLabel: option.timeLabel ?? '',
                  unreadBadgeLabel: option.unreadBadgeLabel ?? '',
                  avatarText: option.avatarText ?? '',
                  isUnread: option.isUnread,
                  enableHoverEffect: widget.enableHoverEffect,
                  isShowCheckbox: _isShowCheckbox,
                  checkboxValue: isLoading ? false : isSelected,
                  checkboxStyle: PersonCardCheckboxStyle.circle,
                  checkboxReplacement: isLoading
                      ? const SizedBox(
                          width: DimensV2.d16,
                          height: DimensV2.d16,
                          child: CircularProgressIndicator(
                            strokeWidth: 1.5,
                            color: AppColorsV2.genericBlack,
                          ),
                        )
                      : null,
                  onTap: isLoading ? null : () => _handleItemTap(option),
                  onCheckboxChanged: isLoading ? null : (_) => _handleCheckboxChanged(option),
                ),
              ),
              if (!isLast) const SizedBox(height: DimensV2.d8),
            ],
          );
        },
      ),
    );
  }

  List<Widget> _buildCardChildren() {
    return widget.options.asMap().entries.map((entry) {
      final index = entry.key;
      final option = entry.value;
      final isSelected = _isSelected(option);
      final isLoading = _isCardLoading(option);
      final customTitleData = _buildCustomTitleData(option);
      final hasCustomTitle = customTitleData.isNotEmpty;
      final isLast = index == widget.options.length - 1;

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: option.enabled ?? true ? 1 : 0.4,
            child: PersonCardItem(
              isShowAvatar: option.isShowImage ?? true,
              imageUrl: option.imageUrl ?? '',
              padding: const EdgeInsets.all(DimensV2.d12),
              customBorderRadius: _cardItemBorderRadius(),
              backgroundColor: isSelected ? AppColorsV2.neutral125 : AppColorsV2.genericWhite,
              isShowBorder: false,
              name: option.name ?? '',
              nameStyle: _listNameStyle,
              subtitle: hasCustomTitle ? '' : option.subtitle ?? '',
              type: hasCustomTitle ? PersonCardType.dynamic : PersonCardType.normal,
              cardData: customTitleData,
              style: PersonCardItemStyle.bottomSheet,
              contentType: widget.itemType,
              timeLabel: option.timeLabel ?? '',
              unreadBadgeLabel: option.unreadBadgeLabel ?? '',
              avatarText: option.avatarText ?? '',
              isUnread: option.isUnread,
              enableHoverEffect: widget.enableHoverEffect,
              isShowCheckbox: _isShowCheckbox,
              checkboxValue: isLoading ? false : isSelected,
              checkboxStyle: PersonCardCheckboxStyle.circle,
              checkboxReplacement: isLoading
                  ? const SizedBox(
                      width: DimensV2.d16,
                      height: DimensV2.d16,
                      child: CircularProgressIndicator(
                        strokeWidth: 1.5,
                        color: AppColorsV2.genericBlack,
                      ),
                    )
                  : null,
              onTap: isLoading ? null : () => _handleItemTap(option),
              onCheckboxChanged: isLoading ? null : (_) => _handleCheckboxChanged(option),
            ),
          ),
          if (!isLast) const SizedBox(height: DimensV2.d8),
        ],
      );
    }).toList(growable: false);
  }

  Widget _buildCardColumn() {
    final resolvedMargin = widget.backgroundMargin.resolve(Directionality.of(context));

    return Container(
      margin: resolvedMargin.copyWith(
        bottom: resolvedMargin.bottom == 0 ? DimensV2.d20 : resolvedMargin.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ..._buildCardChildren(),
          if (widget.isLoadingMore)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: DimensV2.d12),
              child: widget.loadingMoreIndicator ?? defaultLoadingIndicator,
            ),
        ],
      ),
    );
  }

  Widget _buildCardContent({bool applyMaxHeight = true}) {
    final content = widget.onRefresh == null
        ? _buildCardList(
            shrinkWrap: true,
            physics: _cardListPhysics,
          )
        : _buildCardColumn();

    if (!applyMaxHeight) {
      return content;
    }

    if (_isBottomSheetView) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: widget.maxHeight ?? AppDimenV2.of(context).screenHeight * 0.8,
        ),
        child: content,
      );
    }

    if (widget.maxHeight != null) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: widget.maxHeight!,
        ),
        child: content,
      );
    }

    return content;
  }

  Widget _buildLoadingState() {
    if (_isBottomSheetView) {
      return const KeyedSubtree(
        key: ValueKey('bottom_sheet_radio_person_card_loading'),
        child: CommonLoadingIndicatorV2(),
      );
    }

    return const KeyedSubtree(
        key: ValueKey('selectable_card_list_loading'), child: CommonLoadingIndicatorV2());
  }

  Widget _buildEmptyState() {
    final emptyState = EmptyStateWidgetV2(
      title: widget.emptyText!,
      description: widget.customEmptyText!,
    );

    if (_isBottomSheetView) {
      return KeyedSubtree(
        key: const ValueKey('bottom_sheet_radio_person_card_empty'),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: AppDimenV2.of(context).screenHeight * 0.5,
          ),
          child: emptyState,
        ),
      );
    }

    return KeyedSubtree(
      key: const ValueKey('selectable_card_list_empty'),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double resolvedHeight;
          if (constraints.maxHeight.isFinite) {
            resolvedHeight = constraints.maxHeight;
          } else if (widget.emptyStateMinHeight != null) {
            resolvedHeight = widget.emptyStateMinHeight!;
          } else {
            resolvedHeight = AppDimenV2.of(context).screenHeight * 0.5;
          }
          return Container(
            constraints: BoxConstraints(minHeight: resolvedHeight),
            alignment: Alignment.center,
            child: emptyState,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isConfirmEnabled = widget.confirmButtonEnabled ?? _selectedValues.isNotEmpty;
    final isConfirmLoading = widget.confirmButtonLoading;
    final useShrinkWrapLayout = widget.shrinkWrap || widget.onRefresh != null;

    final Widget child;

    if (widget.isLoading) {
      child = _buildLoadingState();
    } else if (_showEmptyState) {
      child = _buildEmptyState();
    } else {
      child = KeyedSubtree(
        key: ValueKey('bottom_sheet_radio_person_card_content_${widget.listType.name}'),
        child: Column(
          mainAxisSize: useShrinkWrapLayout ? MainAxisSize.min : MainAxisSize.max,
          children: [
            if (_isGrouped) ...[
              useShrinkWrapLayout
                  ? _buildGroupedContent(
                      isConfirmEnabled: isConfirmEnabled,
                      isConfirmLoading: isConfirmLoading,
                      applyMaxHeight: widget.onRefresh == null,
                    )
                  : Expanded(
                      child: _buildGroupedContent(
                        isConfirmEnabled: isConfirmEnabled,
                        isConfirmLoading: isConfirmLoading,
                        applyMaxHeight: widget.onRefresh == null,
                      ),
                    ),
            ] else
              _buildCardContent(applyMaxHeight: widget.onRefresh == null),
          ],
        ),
      );
    }

    final onRefresh = widget.onRefresh;
    if (onRefresh == null) return child;

    return LayoutBuilder(
      builder: (context, constraints) {
        return AppRefreshIndicator(
          edgeOffset: DimensV2.d0,
          onRefresh: () async {
            await onRefresh();
            if (_outerScrollController.hasClients) {
              _outerScrollController.jumpTo(0);
            }
          },
          child: SingleChildScrollView(
            controller: _outerScrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: child,
            ),
          ),
        );
      },
    );
  }
}

class _SelectableCardSizeReportingWidget extends StatefulWidget {
  const _SelectableCardSizeReportingWidget({
    required this.child,
    required this.onSizeChange,
  });

  final Widget child;
  final ValueChanged<Size> onSizeChange;

  /// Creates state for size reporting.
  @override
  State<_SelectableCardSizeReportingWidget> createState() =>
      _SelectableCardSizeReportingWidgetState();
}

class _SelectableCardSizeReportingWidgetState extends State<_SelectableCardSizeReportingWidget> {
  final _widgetKey = GlobalKey();
  Size? _oldSize;

  /// Builds size reporting wrapper.
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _notifySize());

    return NotificationListener<SizeChangedLayoutNotification>(
      onNotification: (_) {
        WidgetsBinding.instance.addPostFrameCallback((_) => _notifySize());
        return true;
      },
      child: SizeChangedLayoutNotifier(
        child: Container(
          key: _widgetKey,
          child: widget.child,
        ),
      ),
    );
  }

  void _notifySize() {
    if (!mounted) return;

    final context = _widgetKey.currentContext;
    final size = context?.size;
    if (size == null || _oldSize == size) return;

    _oldSize = size;
    widget.onSizeChange(size);
  }
}
