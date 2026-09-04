import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';

export 'button_sizes.dart';
export 'button_enum.dart';

// ignore: must_be_immutable
/// Shared UIKit button supporting multiple styles and loading states.
class AppButtonV2 extends StatelessWidget {
  AppButtonV2({
    required this.child,
    this.type = ButtonType.filled,
    this.size = ButtonSize.medium,
    this.onTap,
    super.key,
    this.loading = false,
    this.loadingBuilder,
    this.width,
    this.height,
    this.buttonStyle,
    this.borderRadius = const BorderRadius.all(Radius.circular(AppRadiusV2.full)),
    this.cancelOutlinedBorderColor,
    this.cancelOutlinedBackgroundColor,
    this.isEnabled = true,
    this.overlayColor,
    this.padding,
    this.boxShadow,
  });

  /// The box shadow of the button
  final List<BoxShadow>? boxShadow;

  /// The padding inside the button
  final EdgeInsetsGeometry? padding;

  /// Whether the button is enabled or disabled
  final bool isEnabled;

  /// The widget that will be displayed inside the button
  final Widget child;

  /// The type of button that will be displayed
  final ButtonType type;

  /// The size of the button that will be displayed
  final ButtonSize size;

  /// The function that will be called when the button is pressed
  final Function()? onTap;

  /// The loading state of the button. If true, the button will display a loading indicator
  final bool loading;

  /// The builder for the loading indicator for overriding the default loading indicator
  final Widget Function(ButtonType)? loadingBuilder;

  /// The width of the button. Use carefully, as it may break the button's layout
  final double? width;

  /// The height of the button. Use carefully, as it may break the button's layout
  final double? height;

  /// The style of the button. Will override the default style.
  final ButtonStyle? buttonStyle;

  /// The border radius of the button. Will override the default border radius.
  BorderRadius borderRadius = BorderRadius.circular(AppRadiusV2.full);

  /// The border color used when [type] is `cancelOutlined`.
  final Color? cancelOutlinedBorderColor;

  /// The background color used when [type] is `cancelOutlined`.
  final Color? cancelOutlinedBackgroundColor;

  final Color? overlayColor;

  static Widget textOnly({
    required String text,
    required Function()? onTap,
  }) {
    return AppButtonV2(
      type: ButtonType.textOnly,
      onTap: onTap,
      child: Text(text),
    );
  }

  static Widget outline({
    required String text,
    required Function()? onTap,
    bool isLoading = false,
    ButtonSize size = ButtonSize.medium,
    Color? borderColor,
    Color? textColor,
    Color? backgroundColor,
    double? width,
    double? height,
    Widget? child,
  }) {
    ButtonStyle style;
    switch (size) {
      case ButtonSize.large:
        style = largeButtonStyle;
        break;
      case ButtonSize.medium:
        style = mediumButtonStyle;
        break;
    }
    return Builder(builder: (context) {
      final colors = context.mayColors;
      return AppButtonV2(
        onTap: onTap,
        loading: isLoading,
        width: width,
        height: height,
        loadingBuilder: (_) {
          return CircularProgressIndicator(
            strokeWidth: 3,
            color: textColor ?? colors.primaryText,
          );
        },
        type: ButtonType.outline,
        buttonStyle: style.copyWith(
          backgroundColor: WidgetStateProperty.all(backgroundColor ?? colors.surface),
          side: WidgetStateProperty.all(
            BorderSide(
              color: borderColor ?? colors.border,
              width: 1,
            ),
          ),
          overlayColor: resolveColorIfContain(
            WidgetState.pressed,
            colors.secondaryButton,
            elseColor: backgroundColor ?? colors.surface,
          ),
          textStyle: WidgetStateProperty.all(
            AppTextStylesV2.labelSemiBold,
          ),
          foregroundColor: resolveColorIfContain(
            WidgetState.disabled,
            colors.disabledText,
            elseColor: textColor ?? colors.primaryText,
          ),
        ),
        child: child ?? Text(text),
      );
    });
  }

  /// Builds the button based on the configured style and state.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    ButtonStyle style = buttonStyle ?? setStyle(colors);
    if (padding != null) {
      style = style.copyWith(padding: WidgetStateProperty.all(padding));
    }
    BoxDecoration? firstDecoration = {
      ButtonType.primary: BoxDecoration(
        borderRadius: borderRadius,
        color: colors.primaryButton,
      ),
    }[type];
    const color = AppColorsV2.genericWhite;

    BoxDecoration? secondDecoration = {
      ButtonType.primary: BoxDecoration(
        borderRadius: borderRadius,
        color: AppColorsV2.transparent,
        boxShadow: [
          BoxShadow(
            color: AppColorsV2.genericWhite.withValues(alpha: 0.2),
            blurStyle: BlurStyle.inner,
            offset: const Offset(0, 1),
          ),
        ],
      ),
    }[type];

    BoxDecoration? thirdDecoration = {
      ButtonType.primary: BoxDecoration(
        borderRadius: borderRadius,
        color: colors.primaryButton,
      ),
    }[type];

    BoxDecoration? fourthDecoration = {
      ButtonType.primary: BoxDecoration(
        borderRadius: borderRadius,
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [color, color.withValues(alpha: 0)]),
      ),
    }[type];
    final button = SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: style,
        onPressed: isEnabled ? onTap : null,
        child: Center(
          child: loading
              ? SizedBox(
                  width: DimensV2.d20,
                  height: DimensV2.d20,
                  child: loadingBuilder?.call(type) ??
                      CircularProgressIndicator(
                        strokeWidth: 3,
                        color: type == ButtonType.primary || type == ButtonType.filled
                            ? AppColorsV2.genericWhite
                            : colors.primaryButton,
                      ),
                )
              : child,
        ),
      ),
    );
    Widget result;
    switch (type) {
      case ButtonType.primary:
        result = PrimaryContainerV2(
          padding: EdgeInsets.zero,
          color: AppColorsV2.transparent,
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              button,
              Positioned.fill(
                child: Container(
                  margin: const EdgeInsets.all(1),
                  decoration: firstDecoration,
                ),
              ),
              Positioned.fill(
                child: Container(
                  margin: const EdgeInsets.all(1).copyWith(top: 2),
                  decoration: secondDecoration,
                ),
              ),
              Positioned.fill(
                child: Container(
                  margin: const EdgeInsets.all(1).copyWith(top: 4),
                  decoration: thirdDecoration,
                ),
              ),
              Positioned.fill(
                child: Opacity(
                  opacity: 0.2,
                  child: Container(
                    decoration: fourthDecoration,
                  ),
                ),
              ),
              button,
            ],
          ),
        );
        break;
      default:
        result = button;
        break;
    }

    if (boxShadow != null) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          boxShadow: boxShadow,
        ),
        child: result,
      );
    }
    return result;
  }

  /// Resolves the effective button style from the current [colors].
  ButtonStyle setStyle(MayThemeColorsV2 colors) {
    ButtonStyle style;
    switch (size) {
      case ButtonSize.large:
        style = largeButtonStyle;
        break;
      case ButtonSize.medium:
        style = mediumButtonStyle;
        break;
    }
    switch (type) {
      case ButtonType.primary:
        final overrideStyle = ElevatedButton.styleFrom(
          backgroundColor: AppColorsV2.transparent,
          shadowColor: AppColorsV2.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        );
        style = style.copyWith(
          backgroundColor: resolveColorIfContain(
            WidgetState.disabled,
            colors.disabledButton,
            elseColor: AppColorsV2.transparent,
          ),
          overlayColor: resolveColorIfContain(
            WidgetState.pressed,
            colors.pressedPrimaryButton,
            elseColor: colors.primaryButton,
          ),
          foregroundColor: WidgetStatePropertyAll(
            colors.onPrimaryButton,
          ),
          shadowColor: overrideStyle.shadowColor,
          shape: overrideStyle.shape,
        );
        break;
      case ButtonType.filled:
        style = style.copyWith(
          backgroundColor: resolveColorIfContain(
            WidgetState.disabled,
            colors.disabledButton,
            elseColor: colors.primaryButton,
          ),
          overlayColor: overlayColor != null
              ? WidgetStateProperty.all(overlayColor)
              : resolveColorIfContain(
                  WidgetState.pressed,
                  colors.pressedPrimaryButton,
                  elseColor: colors.pressedPrimaryButton,
                ),
          foregroundColor: WidgetStatePropertyAll(
            colors.onPrimaryButton,
          ),
        );
        break;
      case ButtonType.secondary:
        style = style.copyWith(
          backgroundColor: resolveColorIfContain(
            WidgetState.disabled,
            colors.disabledButton,
            elseColor: colors.secondaryButton,
          ),
          overlayColor: resolveColorIfContain(
            WidgetState.pressed,
            colors.pressedPrimaryButton,
          ),
          textStyle: WidgetStateProperty.all(
            AppTextStylesV2.labelSemiBold.copyWith(
              color: colors.primaryText,
            ),
          ),
          foregroundColor: resolveColorIfContain(
            WidgetState.disabled,
            colors.disabledText,
            elseColor: colors.primaryText,
          ),
        );
        break;
      case ButtonType.textOnly:
        style = style.copyWith(
          backgroundColor: WidgetStateProperty.all(AppColorsV2.transparent),
          textStyle: WidgetStateProperty.all(
            AppTextStylesV2.labelSemiBold.copyWith(
              color: colors.primaryText,
            ),
          ),
          overlayColor: WidgetStateProperty.all(AppColorsV2.transparent),
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) {
              return states.contains(WidgetState.pressed)
                  ? colors.pressedPrimaryButton
                  : states.contains(WidgetState.disabled)
                      ? colors.disabledButton
                      : colors.primaryButton;
            },
          ),
        );
        break;
      case ButtonType.outline:
        style = style.copyWith(
          backgroundColor: WidgetStateProperty.all(colors.surface),
          side: WidgetStateProperty.all(
            BorderSide(
              color: colors.border,
              width: 1,
            ),
          ),
          overlayColor: resolveColorIfContain(
            WidgetState.pressed,
            colors.secondaryButton,
            elseColor: colors.pressedPrimaryButton,
          ),
          textStyle: WidgetStateProperty.all(
            AppTextStylesV2.labelSemiBold.copyWith(
              color: colors.primaryText,
            ),
          ),
          foregroundColor: resolveColorIfContain(
            WidgetState.disabled,
            colors.disabledText,
            elseColor: colors.primaryText,
          ),
        );
        break;
      case ButtonType.cancelOutlined:
        style = style.copyWith(
          backgroundColor: WidgetStateProperty.all(cancelOutlinedBackgroundColor ?? colors.surface),
          side: WidgetStateProperty.all(
            BorderSide(
              color: cancelOutlinedBorderColor ?? colors.error,
              width: 1,
            ),
          ),
          overlayColor: overlayColor != null
              ? WidgetStateProperty.all(overlayColor)
              : resolveColorIfContain(
                  WidgetState.pressed,
                  colors.secondaryButton,
                  elseColor: colors.pressedPrimaryButton,
                ),
          textStyle: WidgetStateProperty.all(
            AppTextStylesV2.labelSemiBold.copyWith(
              color: colors.error,
            ),
          ),
          foregroundColor: resolveColorIfContain(
            WidgetState.disabled,
            colors.disabledText,
            elseColor: colors.primaryText,
          ),
        );
        break;

      case ButtonType.cancel:
        style = style.copyWith(
          backgroundColor: WidgetStateProperty.all(colors.error.withValues(alpha: 0.1)),
          side: WidgetStateProperty.all(
            BorderSide(
              color: cancelOutlinedBorderColor ?? colors.error,
              width: 1,
            ),
          ),
          overlayColor: overlayColor != null
              ? WidgetStateProperty.all(overlayColor)
              : resolveColorIfContain(
                  WidgetState.pressed,
                  colors.secondaryButton,
                  elseColor: colors.pressedPrimaryButton,
                ),
          textStyle: WidgetStateProperty.all(
            AppTextStylesV2.labelSemiBold.copyWith(
              color: colors.error,
            ),
          ),
          foregroundColor: resolveColorIfContain(
            WidgetState.disabled,
            colors.disabledText,
            elseColor: colors.primaryText,
          ),
        );
        break;
    }
    style = style.copyWith(
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
    );
    return style;
  }

  static WidgetStateProperty<Color?>? resolveColorIfContain(
    WidgetState state,
    Color color, {
    Color? elseColor,
  }) {
    return WidgetStateProperty.resolveWith(
      (states) {
        return states.contains(state) ? color : elseColor;
      },
    );
  }

// resolve if contain all
  WidgetStateProperty<Color?>? resolveColorIfContainAll(List<WidgetState> states, Color color,
      [Color? orNotColor]) {
    return WidgetStateProperty.resolveWith(
      (states) {
        return states.every((element) => states.contains(element)) ? color : orNotColor;
      },
    );
  }
}
