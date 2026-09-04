import 'package:flutter/material.dart';
import '../may_uikit.dart';

/// A card component displaying order item details and a quantity selector.
class OrderSelectionCard extends StatelessWidget {
  /// Creates an [OrderSelectionCard].
  const OrderSelectionCard({
    super.key,
    required this.entity,
    this.quantity = 1,
    this.onQuantityChanged,
    this.padding = const EdgeInsets.all(AppSpacingV2.lg),
    this.borderRadius = AppRadiusV2.x3l,
  });

  /// The order item entity data.
  final PHXSectionItemEntity entity;

  /// The current selected quantity.
  final int quantity;

  /// Callback triggered when the quantity changes.
  final void Function(PHXSectionItemDetailEntity detail, int nextQuantity)? onQuantityChanged;

  /// Padding around the card content.
  final EdgeInsetsGeometry padding;

  /// Corner radius of the card.
  final double borderRadius;

  /// Builds the order selection card.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    final detail =
        (entity.details != null && entity.details!.isNotEmpty) ? entity.details!.first : null;
    final int? maximum = detail?.extra?.remaining;

    return CardV2(
      title: entity.title ?? '',
      icon: entity.imageUrl,
      padding: padding,
      borderRadius: borderRadius,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (detail != null) ...[
            const SizedBox(height: DimensV2.d4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  detail.title ?? 'Số lượng:',
                  style: AppTextStylesV2.text14Medium.copyWith(
                    color: colors.txContentTertiary,
                  ),
                ),
                buildQuantityControl(
                  context,
                  quantity: quantity,
                  maximum: maximum,
                  onChanged: (nextQuantity) => onQuantityChanged?.call(detail, nextQuantity),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

/// Builds the quantity control widget containing minus/plus buttons and quantity text.
///
/// * [quantity] is the current value of the quantity control.
/// * [maximum] is the upper limit of the quantity. If null, there is no limit.
/// * [isUpdating] disables button interaction during updates if set to true.
/// * [onChanged] is called when the quantity changes.
Widget buildQuantityControl(
  BuildContext context, {
  required int quantity,
  required int? maximum,
  bool isUpdating = false,
  required ValueChanged<int> onChanged,
}) {
  final colors = context.mayColors;
  final canDecrease = !isUpdating && quantity > 1;
  final canIncrease = !isUpdating && (maximum == null || quantity < maximum);

  return Container(
    decoration: BoxDecoration(
      color: colors.bgAppSurface,
      borderRadius: BorderRadius.circular(AppRadiusV2.full),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _QuantityButton(
          icon: Icons.remove,
          check: canDecrease,
          onTap: () => onChanged(quantity - 1),
          colors: colors,
        ),
        const SizedBox(width: DimensV2.d2),
        SizedBox(
          width: DimensV2.d20,
          child: Text(
            '$quantity',
            textAlign: TextAlign.center,
            style: AppTextStylesV2.text14Medium.copyWith(
              color: colors.txContentPrimaryDefault,
            ),
          ),
        ),
        const SizedBox(width: DimensV2.d2),
        _QuantityButton(
          icon: Icons.add,
          check: canIncrease,
          onTap: () => onChanged(quantity + 1),
          colors: colors,
        ),
      ],
    ),
  );
}

class _QuantityButton extends StatelessWidget {
  const _QuantityButton({
    required this.icon,
    required this.check,
    required this.onTap,
    required this.colors,
  });

  final IconData icon;
  final bool check;
  final VoidCallback onTap;
  final MayThemeColorsV2 colors;

  /// Builds the quantity button.
  @override
  Widget build(BuildContext context) {
    return GestureContainerV2(
      onTap: check ? onTap : null,
      padding: EdgeInsets.all(DimensV2.d4),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppRadiusV2.full)),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(DimensV2.d4),
        decoration: BoxDecoration(
          color: colors.bgIconButton,
          borderRadius: BorderRadius.circular(AppRadiusV2.full),
        ),
        child: Icon(
          icon,
          size: DimensV2.d20,
          color: check ? colors.txContentPrimaryDefault : colors.icDisable,
        ),
      ),
    );
  }
}
