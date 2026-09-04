import 'package:flutter/material.dart';
import 'package:may_uikit/resources/generated/assets.gen.dart';

import '../may_uikit.dart';

/// Shows the library book cart while [entity] is being loaded.
///
/// The complete bottom-sheet presentation is owned by May UIKit. Callers only
/// provide the server-driven entity future.
void showBookCartBottomSheetV2({
  required BuildContext context,
  required Future<PHXScreenResponseEntity?> entity,
  Future<({bool success, String? message, PHXScreenResponseEntity? entity})> Function(
    int cartItemId,
    int quantity,
  )? onQuantityChanged,
  Future<({bool success, String? message, PHXScreenResponseEntity? entity})> Function(
    int cartItemId,
  )? onItemDeleted,
  VoidCallback? onRegister,
  VoidCallback? onDismiss,
}) {
  var isRegisterRequested = false;
  showTitledBottomSheetV2(
    context: context,
    title: BookCartBottomSheetV2.defaultTitle,
    childConstraint: BoxConstraints(
      maxHeight: MediaQuery.sizeOf(context).height * 0.9,
    ),
    onDismiss: () {
      if (isRegisterRequested) {
        onRegister?.call();
      } else {
        onDismiss?.call();
      }
    },
    child: (title) => Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title,
        Flexible(
          child: AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            child: FutureBuilder<PHXScreenResponseEntity?>(
              future: entity,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    child: const Center(child: CommonLoadingIndicatorV2()),
                  );
                }

                return BookCartBottomSheetV2(
                  entity: snapshot.data,
                  onQuantityChanged: onQuantityChanged,
                  onItemDeleted: onItemDeleted,
                  onRegister: () => isRegisterRequested = true,
                );
              },
            ),
          ),
        ),
      ],
    ),
  );
}

/// Server-driven content of the library book cart bottom sheet.
class BookCartBottomSheetV2 extends StatefulWidget {
  /// Creates book-cart content from one server-driven [entity].
  const BookCartBottomSheetV2({
    super.key,
    required this.entity,
    this.onQuantityChanged,
    this.onItemDeleted,
    this.onRegister,
  });

  /// Default title used by [showBookCartBottomSheetV2].
  static const String defaultTitle = 'Giỏ sách';

  /// Screen response that contains cart groups and their book details.
  final PHXScreenResponseEntity? entity;
  final Future<({bool success, String? message, PHXScreenResponseEntity? entity})> Function(
    int cartItemId,
    int quantity,
  )? onQuantityChanged;
  final Future<({bool success, String? message, PHXScreenResponseEntity? entity})> Function(
    int cartItemId,
  )? onItemDeleted;
  final VoidCallback? onRegister;

  @override
  State<BookCartBottomSheetV2> createState() => _BookCartBottomSheetV2State();
}

class _BookCartBottomSheetV2State extends State<BookCartBottomSheetV2> {
  static const String _defaultEmptyTitle = 'Chưa có sách';
  static const String _defaultEmptyDescription = 'Chưa có sách đăng ký mượn.';
  static const String _defaultButtonLabel = 'Đăng ký mượn sách';

  final Map<String, int> _quantities = <String, int>{};
  final Set<String> _updatingQuantities = <String>{};
  final Set<String> _deletingItems = <String>{};
  final Set<String> _deletedItems = <String>{};
  PHXScreenResponseEntity? _entity;

  @override
  void initState() {
    super.initState();
    _entity = widget.entity;
  }

  PHXScreenDataEntity? get _data => _entity?.data;

  List<PHXSectionEntity> get _sections {
    final sections = _data?.sections ?? const <PHXSectionEntity>[];
    if (sections.isNotEmpty) return sections;
    return _data?.sectionsBottomSheet ?? const <PHXSectionEntity>[];
  }

  List<PHXSectionItemEntity> get _groups => [
        for (final section in _sections) ...section.items ?? const <PHXSectionItemEntity>[],
      ];

  List<({PHXSectionItemEntity group, int groupIndex})> get _visibleGroups => [
        for (var groupIndex = 0; groupIndex < _groups.length; groupIndex++)
          if (_visibleDetails(_groups[groupIndex], groupIndex).isNotEmpty)
            (group: _groups[groupIndex], groupIndex: groupIndex),
      ];

  List<({PHXSectionItemDetailEntity detail, String quantityKey})> _visibleDetails(
    PHXSectionItemEntity group,
    int groupIndex,
  ) {
    final details = group.details ?? const <PHXSectionItemDetailEntity>[];
    return [
      for (var detailIndex = 0; detailIndex < details.length; detailIndex++)
        if (!_deletedItems.contains(_detailKey(details[detailIndex], groupIndex, detailIndex)))
          (
            detail: details[detailIndex],
            quantityKey: _detailKey(details[detailIndex], groupIndex, detailIndex),
          ),
    ];
  }

  String _detailKey(
    PHXSectionItemDetailEntity detail,
    int groupIndex,
    int detailIndex,
  ) {
    final id = detail.id ?? 0;
    return id > 0 ? 'cart-item-$id' : 'cart-position-$groupIndex-$detailIndex';
  }

  bool get _hasBooks => _visibleGroups.isNotEmpty;
  bool get _isActionLoading => _updatingQuantities.isNotEmpty || _deletingItems.isNotEmpty;

  PHXBottomActionEntity? get _bottomAction {
    final actions = _data?.bottomActions ?? const <PHXBottomActionEntity>[];
    return actions.isEmpty ? null : actions.first;
  }

  String get _emptyTitle {
    final title = _data?.emptyState?.title?.trim() ?? '';
    return title.isEmpty ? _defaultEmptyTitle : title;
  }

  String get _emptyDescription {
    final description = _data?.emptyState?.subTitle?.trim() ?? '';
    return description.isEmpty ? _defaultEmptyDescription : description;
  }

  PHXSectionItemBadgeEntity? get _banner {
    for (final group in _groups) {
      final badge = group.badge;
      if (badge?.title?.trim().isNotEmpty == true) return badge;
    }
    return null;
  }

  String get _buttonLabel {
    final title = _bottomAction?.title?.trim() ?? '';
    return title.isEmpty ? _defaultButtonLabel : title;
  }

  bool get _isButtonEnabled {
    final action = _bottomAction;
    return !_isActionLoading && _hasBooks && action != null && action.isHiddenAction != true;
  }

  @override
  Widget build(BuildContext context) {
    final banner = _banner;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (banner != null) ...[
                  _buildBanner(banner),
                  const SizedBox(height: AppSpacingV2.sm),
                ],
                if (_hasBooks) _buildGroups(context) else _buildEmptyGroup(context),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSpacingV2.lg),
        Padding(
          padding: const EdgeInsets.only(bottom: AppSpacingV2.lg),
          child: CommonButtonV2(
            label: _buttonLabel,
            isEnabled: _isButtonEnabled,
            onTap: _isButtonEnabled ? _handleRegister : null,
          ),
        ),
      ],
    );
  }

  Widget _buildBanner(PHXSectionItemBadgeEntity banner) {
    final isCritical = AppBadgeStatusCode.fromCode(banner.badgeType) == AppBadgeStatusCode.critical;
    return InfoHighlightBannerV2(
      message: banner.title!.trim(),
      variant: isCritical ? CRITICAL : DEFAULT,
    );
  }

  Widget _buildGroups(BuildContext context) {
    final visibleGroups = _visibleGroups;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var index = 0; index < visibleGroups.length; index++) ...[
          if (index > 0) const SizedBox(height: AppSpacingV2.sm),
          _buildGroupCard(
            context,
            group: visibleGroups[index].group,
            groupIndex: visibleGroups[index].groupIndex,
          ),
        ],
      ],
    );
  }

  Widget _buildGroupCard(
    BuildContext context, {
    required PHXSectionItemEntity group,
    required int groupIndex,
  }) {
    final details = _visibleDetails(group, groupIndex);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacingV2.md),
      decoration: BoxDecoration(
        color: context.mayColors.bgCard,
        border: Border.all(
          color: context.mayColors.bdDefault,
          width: DimensV2.d_05,
        ),
        borderRadius: BorderRadius.circular(AppRadiusV2.x3l),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBorrower(group),
          const SizedBox(height: AppSpacingV2.md),
          const CommonDividerV2(),
          for (var detailIndex = 0; detailIndex < details.length; detailIndex++) ...[
            const SizedBox(height: AppSpacingV2.md),
            _buildBook(
              context,
              detail: details[detailIndex].detail,
              quantityKey: details[detailIndex].quantityKey,
            ),
            if (detailIndex != details.length - 1) ...[
              const SizedBox(height: AppSpacingV2.md),
              const CommonDividerV2(),
            ],
          ],
        ],
      ),
    );
  }

  Widget _buildEmptyGroup(BuildContext context) {
    final group = _groups.isEmpty ? null : _groups.first;
    return SizedBox(
      height: DimensV2.d385,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpacingV2.md),
        decoration: BoxDecoration(
          color: context.mayColors.bgCard,
          border: Border.all(
            color: context.mayColors.bdDefault,
            width: DimensV2.d_05,
          ),
          borderRadius: BorderRadius.circular(AppRadiusV2.x3l),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBorrower(group),
            if (group != null) ...[
              const SizedBox(height: AppSpacingV2.md),
              const CommonDividerV2(),
              const SizedBox(height: AppSpacingV2.md),
            ],
            Expanded(
              child: EmptyStateWidgetV2(
                title: _emptyTitle,
                description: _emptyDescription,
                fillParent: true,
                hasShadow: false,
                hasBorder: false,
                padding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBorrower(PHXSectionItemEntity? group) {
    final headerInfo = _data?.headerInfo;
    final avatarName = group?.avatarName?.trim().isNotEmpty == true
        ? group!.avatarName!.trim()
        : headerInfo?.title?.trim() ?? '';
    final avatarUrl = group?.avatarUrl?.trim().isNotEmpty == true
        ? group!.avatarUrl!.trim()
        : headerInfo?.avatar?.trim() ?? '';

    if (avatarName.isEmpty && avatarUrl.isEmpty) return const SizedBox.shrink();

    return Row(
      children: [
        SizedBox.square(
          dimension: DimensV2.d30,
          child: CommonAvatarV2(
            imageUrl: avatarUrl,
            radius: DimensV2.d30,
          ),
        ),
        const SizedBox(width: AppSpacingV2.xs),
        Expanded(
          child: Text(
            avatarName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStylesV2.text14Semibold.copyWith(
              color: context.mayColors.txContentPrimaryDefault,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBook(
    BuildContext context, {
    required PHXSectionItemDetailEntity detail,
    required String quantityKey,
  }) {
    final content = detail.content?.trim() ?? '';
    final quantity = _quantities.putIfAbsent(
      quantityKey,
      () => detail.extra?.total ?? 0,
    );
    final isUpdating = _updatingQuantities.contains(quantityKey);
    final isDeleting = _deletingItems.contains(quantityKey);
    final canSubmit = widget.onQuantityChanged == null || (detail.id ?? 0) > 0;
    final canDelete = widget.onItemDeleted != null && (detail.id ?? 0) > 0;

    return _SwipeToDeleteBook(
      key: ValueKey('book-cart-$quantityKey'),
      deleteAction: GestureContainerV2(
        decoration: BoxDecoration(
          color: isDeleting ? AppColorsV2.neutral200 : context.mayColors.btnCriticalPrimaryDefault,
          borderRadius: BorderRadius.circular(AppRadiusV2.xl),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: DimensV2.d10,
          horizontal: DimensV2.d10,
        ),
        width: DimensV2.d68,
        height: DimensV2.d108,
        onTap: !canDelete || isDeleting
            ? null
            : () => _handleDeleteItem(
                  detail: detail,
                  quantityKey: quantityKey,
                ),
        child: Center(
          child: isDeleting
              ? SizedBox.square(
                  dimension: DimensV2.d20,
                  child: Padding(
                    padding: const EdgeInsets.all(DimensV2.d2),
                    child: CircularProgressIndicator(
                      strokeWidth: DimensV2.d3,
                      color: AppColorsV2.genericWhite,
                    ),
                  ),
                )
              : Text(
                  'Xoá',
                  style: AppTextStylesV2.text14Semibold.copyWith(
                    color: context.mayColors.txBtnCriticalDefault,
                  ),
                ),
        ),
      ),
      child: SizedBox(
        height: DimensV2.d108,
        child: Row(
          children: [
            _buildBookImage(
              context,
              detail.imageUrl,
              isBorrowedOut: detail.extra?.remaining == 0,
            ),
            const SizedBox(width: AppSpacingV2.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    detail.title?.trim() ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStylesV2.text14Semibold.copyWith(
                      color: context.mayColors.txContentPrimaryDefault,
                    ),
                  ),
                  if (content.isNotEmpty) ...[
                    const SizedBox(height: AppSpacingV2.x2s),
                    Text(
                      content,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStylesV2.text14Medium.copyWith(
                        color: context.mayColors.txContentSecondaryDefault,
                      ),
                    ),
                  ],
                  SizedBox(height: AppSpacingV2.xs),
                  buildQuantityControl(
                    context,
                    quantity: quantity,
                    maximum: detail.extra?.remaining,
                    isUpdating: isUpdating || isDeleting || !canSubmit,
                    onChanged: (nextQuantity) => _handleQuantityChanged(
                      detail: detail,
                      quantityKey: quantityKey,
                      quantity: nextQuantity,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookImage(
    BuildContext context,
    String? imageUrl, {
    required bool isBorrowedOut,
  }) {
    Widget fallback() => Container(
          color: AppColorsV2.neutral100,
          alignment: Alignment.center,
          child: AdaptiveImageV2(
            url: Assets.icons.emptyProduct.keyName,
            width: DimensV2.d38,
            height: DimensV2.d38,
          ),
        );

    return Container(
      width: DimensV2.d86,
      height: DimensV2.d114,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadiusV2.md),
      ),
      foregroundDecoration: BoxDecoration(
        border: Border.all(
          color: context.mayColors.bdDefault,
          width: DimensV2.d_05,
        ),
        borderRadius: BorderRadius.circular(AppRadiusV2.md),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (imageUrl?.trim().isNotEmpty == true)
            AdaptiveImageV2(
              url: imageUrl!,
              width: DimensV2.d82,
              height: DimensV2.d108,
              fit: BoxFit.cover,
              errorBuilder: (_, __) => fallback(),
            )
          else
            fallback(),
          if (isBorrowedOut)
            ColoredBox(
              color: AppColorsV2.genericBlack.withValues(alpha: 0.4),
            ),
        ],
      ),
    );
  }

  void _handleRegister() {
    Navigator.of(context).pop();
    widget.onRegister?.call();
  }

  Future<void> _handleQuantityChanged({
    required PHXSectionItemDetailEntity detail,
    required String quantityKey,
    required int quantity,
  }) async {
    if (_updatingQuantities.contains(quantityKey)) return;

    final onQuantityChanged = widget.onQuantityChanged;
    if (onQuantityChanged == null) {
      setState(() => _quantities[quantityKey] = quantity);
      return;
    }

    final cartItemId = detail.id ?? 0;
    if (cartItemId <= 0) return;

    setState(() => _updatingQuantities.add(quantityKey));
    try {
      final result = await onQuantityChanged(cartItemId, quantity);
      if (!mounted) return;

      if (result.success) {
        setState(() {
          if (result.entity != null) {
            _entity = result.entity;
            _quantities.clear();
            _deletedItems.clear();
          } else {
            _quantities[quantityKey] = quantity;
          }
        });
      }

      final message = result.message?.trim() ?? '';
      if (message.isNotEmpty) {
        CustomMessenger.of(context).toast(
          message,
          context: context,
          type: result.success ? ToastType.success : ToastType.error,
        );
      }
    } finally {
      if (mounted) {
        setState(() => _updatingQuantities.remove(quantityKey));
      }
    }
  }

  Future<void> _handleDeleteItem({
    required PHXSectionItemDetailEntity detail,
    required String quantityKey,
  }) async {
    if (_deletingItems.contains(quantityKey)) return;

    final onItemDeleted = widget.onItemDeleted;
    final cartItemId = detail.id ?? 0;
    if (onItemDeleted == null || cartItemId <= 0) return;

    setState(() => _deletingItems.add(quantityKey));
    try {
      final result = await onItemDeleted(cartItemId);
      if (!mounted) return;

      if (result.success) {
        setState(() {
          if (result.entity != null) {
            _entity = result.entity;
            _quantities.clear();
            _deletedItems.clear();
          } else {
            _deletedItems.add(quantityKey);
            _quantities.remove(quantityKey);
          }
        });
      }

      final message = result.message?.trim() ?? '';
      if (message.isNotEmpty) {
        CustomMessenger.of(context).toast(
          message,
          context: context,
          type: result.success ? ToastType.success : ToastType.error,
        );
      }
    } finally {
      if (mounted) {
        setState(() => _deletingItems.remove(quantityKey));
      }
    }
  }
}

class _SwipeToDeleteBook extends StatefulWidget {
  const _SwipeToDeleteBook({
    super.key,
    required this.child,
    required this.deleteAction,
  });

  final Widget child;
  final Widget deleteAction;

  @override
  State<_SwipeToDeleteBook> createState() => _SwipeToDeleteBookState();
}

class _SwipeToDeleteBookState extends State<_SwipeToDeleteBook> {
  static const double _minDragOffset = 1;

  final GlobalKey _mainKey = GlobalKey();
  final GlobalKey _deleteKey = GlobalKey();

  double _offset = 0;
  Size? _mainSize;
  Size? _deleteSize;

  void _getMainSize() {
    final renderBox = _mainKey.currentContext?.findRenderObject();
    if (!mounted || renderBox is! RenderBox) return;
    setState(() => _mainSize = renderBox.size);
  }

  void _getDeleteSize() {
    final renderBox = _deleteKey.currentContext?.findRenderObject();
    if (!mounted || renderBox is! RenderBox) return;
    setState(() => _deleteSize = renderBox.size);
  }

  void _handleSwipe(DragUpdateDetails details) {
    final primaryDelta = details.primaryDelta;
    final deleteSize = _deleteSize;
    if (primaryDelta == null || deleteSize == null) return;

    setState(() {
      if (primaryDelta < -_minDragOffset) {
        _offset = deleteSize.width + DimensV2.d12;
      } else if (primaryDelta > _minDragOffset) {
        _offset = 0;
      }
    });
  }

  Widget get _content => SizedBox(
        height: _mainSize?.height,
        width: _mainSize?.width,
        child: KeyedSubtree(key: _mainKey, child: widget.child),
      );

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (_mainSize == null) {
        _getMainSize();
      } else if (_deleteSize == null && _deleteKey.currentWidget != null) {
        _getDeleteSize();
      }
    });

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onHorizontalDragUpdate: _handleSwipe,
      child: _mainSize == null
          ? _content
          : SizedBox(
              height: _mainSize?.height,
              width: _mainSize?.width,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 50),
                    left: -_offset,
                    top: 0,
                    bottom: 0,
                    child: _content,
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 50),
                    left: (_mainSize?.width ?? 0) + DimensV2.d12 - _offset,
                    top: 0,
                    bottom: 0,
                    child: KeyedSubtree(key: _deleteKey, child: widget.deleteAction),
                  ),
                ],
              ),
            ),
    );
  }
}
