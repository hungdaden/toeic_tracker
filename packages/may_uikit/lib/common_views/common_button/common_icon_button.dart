import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:may_uikit/may_uikit.dart';

import '../../resources/generated/assets.gen.dart';

/// Presets of common icon types for [CommonIconButtonV2].
enum CommonIconButtonType {
  add,
  edit,
  delete,
}

/// Icon-leading button with pressable card styling.
class CommonIconButtonV2 extends StatelessWidget {
  /// Creates a button with an asset icon before [label].
  const CommonIconButtonV2({
    super.key,
    this.iconPath,
    this.type,
    this.label,
    this.onTap,
    this.isEnabled = true,
    this.width,
    this.iconSize = DimensV2.d24,
    this.padding,
    this.customChild,
  });

  /// Optional asset path for the leading SVG icon.
  final String? iconPath;

  /// Optional preset type for common icons.
  final CommonIconButtonType? type;

  /// Optional button text shown after the icon.
  final String? label;

  /// Callback called when the enabled button is tapped.
  final VoidCallback? onTap;

  /// Whether the button can be pressed.
  final bool isEnabled;

  /// Optional fixed button width.
  final double? width;

  /// Size used for the leading icon.
  final double iconSize;

  /// Optional custom padding. Defaults to `EdgeInsets.all(AppSpacingV2.md)`.
  final EdgeInsetsGeometry? padding;

  /// Optional custom child widget to display inside the button.
  final Widget? customChild;

  String? get _resolvedIconPath {
    if (iconPath != null && iconPath!.isNotEmpty) {
      return iconPath;
    }
    if (type != null) {
      switch (type!) {
        case CommonIconButtonType.add:
          return Assets.icons.icAdd.path;
        case CommonIconButtonType.edit:
          return Assets.icons.icEdit.path;
        case CommonIconButtonType.delete:
          return Assets.icons.icDelete.path;
      }
    }
    return null;
  }

  /// Builds the button using [PressableCardContainerV2] for press feedback.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    final active = isEnabled && onTap != null;
    final foregroundColor = active ? colors.txContentPrimaryDefault : colors.disabledText;
    final resolvedPath = _resolvedIconPath;
    final hasIcon = resolvedPath != null && resolvedPath.isNotEmpty;
    final hasLabel = label != null && label!.isNotEmpty;

    return PressableCardContainerV2(
      color: active ? colors.bgCard : colors.disabledButton,
      borderColor: active ? colors.bdDefault : colors.btnCriticalOutlineDisable,
      shadowColor: active ? colors.sdDefault : AppColorsV2.transparent,
      borderRadius: AppRadiusV2.full,
      pressedOffset: active ? DimensV2.d4 : DimensV2.d0,
      padding: padding ?? const EdgeInsets.all(15.0),
      onTap: active ? onTap : null,
      child: customChild ??
          SizedBox(
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: width == null ? MainAxisSize.min : MainAxisSize.max,
              children: [
                if (hasIcon) _buildIconWidget(resolvedPath, foregroundColor),
                if (hasIcon && hasLabel) const SizedBox(width: AppSpacingV2.xs),
                if (hasLabel)
                  Flexible(
                    child: Text(
                      label!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStylesV2.text13Medium
                          .copyWith(color: colors.txContentSecondaryDefault),
                    ),
                  ),
              ],
            ),
          ),
    );
  }

  /// Render icon phù hợp với loại [iconPath]:
  /// - Network SVG  → [SvgPicture.network]
  /// - Network PNG/other → [CommonImageV2.network]
  /// - Local asset → [CommonImageV2.svg]
  Widget _buildIconWidget(String resolvedPath, Color foregroundColor) {
    if (type != null && (iconPath == null || iconPath!.isEmpty)) {
      final SvgGenImage genImage;
      switch (type!) {
        case CommonIconButtonType.add:
          genImage = Assets.icons.icAdd;
          break;
        case CommonIconButtonType.edit:
          genImage = Assets.icons.icEdit;
          break;
        case CommonIconButtonType.delete:
          genImage = Assets.icons.icDelete;
          break;
      }
      return genImage.svg(
        width: iconSize,
        height: iconSize,
        colorFilter: ColorFilter.mode(foregroundColor, BlendMode.srcIn),
      );
    }
    if (_isNetworkUrl(resolvedPath)) {
      if (_isSvgUrl(resolvedPath)) {
        return SvgPicture.network(
          resolvedPath,
          width: iconSize,
          height: iconSize,
          fit: BoxFit.contain,
          colorFilter: ColorFilter.mode(foregroundColor, BlendMode.srcIn),
        );
      }
      return CommonImageV2.network(
        url: resolvedPath,
        width: iconSize,
        height: iconSize,
        fit: BoxFit.contain,
      );
    }
    return CommonImageV2.svg(
      path: resolvedPath,
      width: iconSize,
      height: iconSize,
      foregroundColor: foregroundColor,
    );
  }

  bool _isNetworkUrl(String value) {
    return value.startsWith('http://') || value.startsWith('https://');
  }

  bool _isSvgUrl(String value) {
    final uri = Uri.tryParse(value);
    final path = uri?.path.toLowerCase() ?? value.toLowerCase();
    return path.endsWith('.svg');
  }
}
