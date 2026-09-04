import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';

/// Available layout styles for [CardListV2].
enum CardListType { grouped, card }

/// Available presentation modes for [CardListV2].
enum CardListViewType { list, bottomSheet }

/// Selectable card list with support for grouped and plain layouts.
class CardListV2<T> extends StatefulWidget {
  const CardListV2({
    required this.options,
    this.selectedValues = const [],
    this.onSelectionChanged,
    this.padding = const EdgeInsets.all(AppSpacingV2.md),
    this.backgroundMargin = const EdgeInsets.symmetric(horizontal: AppSpacingV2.lg),
    this.cardMargin = const EdgeInsets.only(bottom: AppSpacingV2.sm),
    this.isMultiSelect = false,
    this.isLoading = false,
    this.listType = CardListType.card,
    this.viewType = CardListViewType.list,
    this.isShowCheckbox = false,
    this.onItemTap,
    super.key,
  });

  final List<CardListOptionV2<T>> options;
  final List<T> selectedValues;
  final ValueChanged<List<T>>? onSelectionChanged;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry backgroundMargin;
  final EdgeInsetsGeometry cardMargin;
  final bool isMultiSelect;
  final bool isLoading;
  final CardListType listType;
  final CardListViewType viewType;
  final bool isShowCheckbox;
  final void Function(CardListOptionV2<T>)? onItemTap;

  @override

  /// Creates the selection state for [CardListV2].
  State<CardListV2<T>> createState() => _CardListState<T>();
}

class _CardListState<T> extends State<CardListV2<T>> {
  late List<T> _selectedValues;

  @override

  /// Initializes the internal selected values from the widget input.
  void initState() {
    super.initState();
    _selectedValues = List.from(widget.selectedValues);
  }

  @override

  /// Syncs the local selection state when the widget updates.
  void didUpdateWidget(covariant CardListV2<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedValues != widget.selectedValues) {
      _selectedValues = List.from(widget.selectedValues);
    }
  }

  void _onItemTap(CardListOptionV2<T> option) {
    if (widget.onItemTap != null) {
      widget.onItemTap!(option);
    }

    if (option.value == null || widget.onSelectionChanged == null) return;

    setState(() {
      if (widget.isMultiSelect) {
        if (_selectedValues.contains(option.value)) {
          _selectedValues.remove(option.value);
        } else {
          _selectedValues.add(option.value as T);
        }
      } else {
        _selectedValues = [option.value as T];
      }
    });

    widget.onSelectionChanged?.call(_selectedValues);
  }

  @override

  /// Builds the list using the configured loading and grouping modes.
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return _buildLoading();
    }

    if (widget.options.isEmpty) {
      return const SizedBox.shrink();
    }

    if (widget.listType == CardListType.grouped && widget.viewType == CardListViewType.list) {
      return _buildGroupedList(context);
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: widget.padding,
      itemCount: widget.options.length,
      itemBuilder: (context, index) {
        final option = widget.options[index];
        final isSelected = _selectedValues.contains(option.value);

        final bool isInteractive = widget.onItemTap != null || widget.onSelectionChanged != null;

        return CardListItemV2(
          margin: widget.cardMargin,
          name: option.name ?? '',
          trailingIcon: option.trailingIcon,
          subtitle: option.subtitle ?? '',
          subtitleIconNetworkUrl: option.subtitleIconNetworkUrl,
          imageUrl: option.imageUrl ?? '',
          cardData: option.customTitle ?? [],
          type: (option.customTitle?.isNotEmpty ?? false)
              ? CardListItemType.dynamic
              : CardListItemType.normal,
          isShowCheckbox: widget.isShowCheckbox,
          checkboxValue: isSelected,
          multiSelected: widget.isMultiSelect,
          onCheckboxChanged: isInteractive ? (_) => _onItemTap(option) : null,
          onTap: isInteractive ? () => _onItemTap(option) : null,
          backgroundColor: isSelected ? AppColorsV2.primaryBlue50 : AppColorsV2.genericWhite,
          borderColor: isSelected ? AppColorsV2.primaryBlue : AppColorsV2.neutral200,
          isShowBorder: true,
        );
      },
    );
  }

  Widget _buildGroupedList(BuildContext context) {
    return CardV2(
      padding: EdgeInsets.zero,
      borderRadius: AppRadiusV2.x3l,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: widget.padding,
        itemCount: widget.options.length,
        separatorBuilder: (_, __) => const Padding(
          padding: EdgeInsets.only(
            left: DimensV2.d60,
            top: DimensV2.d12,
            bottom: DimensV2.d12,
          ),
          child: CommonDividerV2(),
        ),
        itemBuilder: (context, index) {
          final option = widget.options[index];
          final isSelected = _selectedValues.contains(option.value);

          final bool isInteractive = widget.onItemTap != null || widget.onSelectionChanged != null;

          return CardListItemV2(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            avatarSize: DimensV2.d52,
            name: option.name ?? '',
            subtitle: option.subtitle ?? '',
            subtitleIconNetworkUrl: option.subtitleIconNetworkUrl,
            imageUrl: option.imageUrl ?? '',
            trailingIcon: option.trailingIcon,
            cardData: option.customTitle ?? [],
            type: (option.customTitle?.isNotEmpty ?? false)
                ? CardListItemType.dynamic
                : CardListItemType.normal,
            isShowCheckbox: widget.isShowCheckbox,
            checkboxValue: isSelected,
            multiSelected: widget.isMultiSelect,
            onCheckboxChanged: isInteractive ? (_) => _onItemTap(option) : null,
            onTap: isInteractive ? () => _onItemTap(option) : null,
            backgroundColor: AppColorsV2.transparent,
            borderColor: AppColorsV2.transparent,
            isShowBorder: false,
          );
        },
      ),
    );
  }

  Widget _buildLoading() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: widget.padding,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: widget.cardMargin,
          child: RoundedRectangleShimmerV2(
            width: double.infinity,
            height: DimensV2.d72,
            radius: AppSpacingV2.sm,
          ),
        );
      },
    );
  }
}
