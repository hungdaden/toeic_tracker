import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:may_uikit/may_uikit.dart';

import '../../resources/generated/assets.gen.dart';

/// Base card shell for UIKit cards.
///
/// Header pieces are optional:
/// - [icon] URL string (PNG from API) rendered as a network image on the left.
/// - [title] renders the header title.
/// - Khi [onTap] được truyền vào, trailing tự động hiển thị icon mũi tên
///   theo màu [MayThemeColorsV2.primaryButton].
///
/// [child] is the free-style body slot for each concrete card.
class CardV2 extends StatefulWidget {
  const CardV2({
    super.key,
    this.title,
    this.subtitle,
    this.icon,
    this.avatar,
    this.headerLeading,
    this.width,
    this.hasAvatar,
    this.colorBackground,
    this.borderColor,
    this.shadowColor,
    this.borderWidth = DimensV2.d_05,
    this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(AppSpacingV2.cardLg),
    this.borderRadius = AppRadiusV2.xl,
    this.isBoldTitle = true,
    this.isShowArrow = false,
    this.headerBodyGap = AppSpacingV2.sm,
    this.margin,
  });

  final String? title;
  final String? subtitle;
  final String? icon;
  final String? avatar;
  final Widget? headerLeading;
  final bool? hasAvatar;
  final Widget? child;
  final Color? colorBackground;
  final Color? borderColor;
  final Color? shadowColor;
  final double borderWidth;

  final GestureTapCallback? onTap;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final double? width;
  final bool isBoldTitle;
  final bool isShowArrow;
  final double headerBodyGap;
  final EdgeInsetsGeometry? margin;

  /// Creates state that keeps border and shadow colors stable during theme changes.
  @override
  State<CardV2> createState() => _CardV2State();
}

class _CardV2State extends State<CardV2> {
  Color? _lastCardBorderColor;
  Color? _lastCardShadowColor;

  bool get _hasTitle => widget.title?.isNotEmpty ?? false;

  bool get _hasSubtitle => widget.subtitle?.isNotEmpty ?? false;

  /// Builds the card with optional header, arrow, and body.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    final foregroundColor = colors.txContentPrimaryDefault;
    final effectiveColor = widget.colorBackground ?? colors.bgCard;
    final header = _buildHeader(context, colors);
    final body = widget.child;
    final content = <Widget>[
      if (header != null) header,
      if (header != null && body != null) SizedBox(height: widget.headerBodyGap),
      if (body != null) body,
    ];

    return PressableCardContainerV2(
      color: effectiveColor,
      borderColor: widget.borderColor ?? _stableBorderColor(colors),
      shadowColor: widget.shadowColor ?? _stableShadowColor(colors),
      borderWidth: widget.borderWidth,
      width: widget.width,
      padding: widget.padding,
      margin: widget.margin,
      borderRadius: widget.borderRadius,
      onTap: widget.onTap,
      child: IconTheme.merge(
        data: IconThemeData(color: foregroundColor),
        child: DefaultTextStyle.merge(
          style: AppTextStylesV2.bodyRegular.copyWith(color: foregroundColor),
          child: content.isEmpty
              ? const SizedBox.shrink()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: content,
                ),
        ),
      ),
    );
  }

  Color _stableBorderColor(MayThemeColorsV2 colors) {
    final color = colors.bdDefault;
    if (_lastCardBorderColor != null && _isDefaultColor(color, _lastCardBorderColor!)) {
      return _lastCardBorderColor!;
    }
    _lastCardBorderColor = color;
    return color;
  }

  Color _stableShadowColor(MayThemeColorsV2 colors) {
    final color = colors.sdDefault;
    if (_lastCardShadowColor != null && _isDefaultColor(color, _lastCardShadowColor!)) {
      return _lastCardShadowColor!;
    }
    _lastCardShadowColor = color;
    return color;
  }

  bool _isDefaultColor(Color color, Color defaultColor) {
    return color.toARGB32() == defaultColor.toARGB32();
  }

  Widget? _buildHeader(BuildContext context, MayThemeColorsV2 colors) {
    // Nếu có hasAvatar, ưu tiên dùng cờ đó. Nếu không, check theo widget.avatar != null
    // Tương tự cho icon (nếu cờ này được dùng chung cho cả icon/avatar fallback)
    final bool isSvg = (widget.avatar != null && widget.avatar!.toLowerCase().contains('.svg')) ||
        (widget.icon != null && widget.icon!.toLowerCase().contains('.svg'));

    final bool isExplicitlyNoAvatar = widget.hasAvatar == false;

    final bool showAvatar =
        !isExplicitlyNoAvatar && ((widget.hasAvatar == true) || (widget.avatar != null && !isSvg));

    final bool showIcon = (widget.icon != null && widget.icon!.trim().isNotEmpty) ||
        (!isExplicitlyNoAvatar &&
            ((widget.hasAvatar == false && widget.avatar != null) ||
                (widget.hasAvatar == null && isSvg)));

    if (widget.headerLeading == null && !showIcon && !showAvatar && !_hasTitle && !_hasSubtitle) {
      return null;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (widget.headerLeading != null) ...[
          widget.headerLeading!,
          const SizedBox(width: AppSpacingV2.sm),
        ] else if (showAvatar) ...[
          ThemedIconCircleV2(
            variant: ThemedIconCircleVariant.avatar,
            url: widget.avatar,
          ),
          const SizedBox(width: DimensV2.d6),
        ] else if (showIcon) ...[
          ThemedIconCircleV2(
            variant: ThemedIconCircleVariant.icon,
            url: widget.icon ?? widget.avatar,
          ),
          const SizedBox(width: DimensV2.d6),
        ],
        if (_hasTitle || _hasSubtitle)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_hasTitle)
                  Text(
                    widget.title!,
                    maxLines: _hasSubtitle ? 1 : 2,
                    overflow: TextOverflow.ellipsis,
                    style: widget.isBoldTitle
                        ? AppTextStylesV2.text16Semibold.copyWith(
                            color: colors.txContentPrimaryDefault,
                          )
                        : AppTextStylesV2.text14Medium.copyWith(
                            color: colors.txContentPrimaryDefault,
                          ),
                  ),
                if (_hasTitle && _hasSubtitle) const SizedBox(height: AppSpacingV2.x3s),
                if (_hasSubtitle)
                  Text(
                    widget.subtitle!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStylesV2.text13Medium.copyWith(
                      color: colors.txContentTertiary,
                    ),
                  ),
              ],
            ),
          )
        else
          const Spacer(),
        if (widget.isShowArrow) ...[
          SizedBox(width: _hasSubtitle ? AppSpacingV2.sm : DimensV2.d6),
          Container(
            width: DimensV2.d28,
            height: DimensV2.d28,
            decoration: BoxDecoration(
              color: context.mayColors.bgIcon,
              borderRadius: BorderRadius.circular(AppRadiusV2.full),
            ),
            child: Center(
              child: SvgPicture.asset(
                Assets.icons.icArrowRight.keyName,
                width: DimensV2.d12,
                height: DimensV2.d12,
                colorFilter: ColorFilter.mode(
                  context.mayColors.icColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
