import 'dart:ui';

import 'package:flutter/material.dart';

import '../../resources/dimens.dart';
import '../../resources/radius.dart';
import '../../resources/styles/app_color.dart';
import '../../resources/styles/app_text_style.dart';
import '../../themes/main_theme.dart';

/// Circular glass action button used by chat composer controls.
class ChatGlassIconButtonV2 extends StatefulWidget {
  /// Creates a themed glass button around [child].
  const ChatGlassIconButtonV2({
    super.key,
    required this.child,
    this.onTap,
    this.size = DimensV2.d40,
    this.enabled = true,
    this.semanticsLabel,
  });

  /// Icon or compact content centered inside the glass surface.
  final Widget child;

  /// Called when the enabled button is tapped.
  final VoidCallback? onTap;

  /// Square width and height of the button.
  final double size;

  /// Whether the button accepts pointer interaction.
  final bool enabled;

  /// Optional accessibility label announced for the button.
  final String? semanticsLabel;

  /// Creates the interactive state for [ChatGlassIconButtonV2].
  @override
  State<ChatGlassIconButtonV2> createState() => _ChatGlassIconButtonV2State();
}

class _ChatGlassIconButtonV2State extends State<ChatGlassIconButtonV2> {
  bool _isHovered = false;
  bool _isPressed = false;

  bool get _isEnabled => widget.enabled && widget.onTap != null;

  double get _scale {
    if (_isPressed) return 1.15;
    if (_isHovered) return 1.05;
    return 1;
  }

  void _handleHover(bool value) {
    if (!_isEnabled || _isHovered == value) return;
    setState(() => _isHovered = value);
  }

  void _handleTapDown(TapDownDetails _) {
    if (!_isEnabled || _isPressed) return;
    setState(() => _isPressed = true);
  }

  void _handleTapEnd() {
    if (!_isPressed) return;
    setState(() => _isPressed = false);
  }

  /// Builds the interactive Figma glass action surface for [context].
  @override
  Widget build(BuildContext context) {
    final padding = widget.size >= DimensV2.d44
        ? const EdgeInsets.all(DimensV2.d10)
        : const EdgeInsets.all(DimensV2.d8);

    return Semantics(
      button: true,
      enabled: _isEnabled,
      label: widget.semanticsLabel ?? 'chat_glass_icon_button',
      child: IgnorePointer(
        ignoring: !_isEnabled,
        child: MouseRegion(
          onEnter: (_) => _handleHover(true),
          onExit: (_) => _handleHover(false),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _isEnabled ? widget.onTap : null,
            onTapDown: _handleTapDown,
            onTapUp: (_) => _handleTapEnd(),
            onTapCancel: _handleTapEnd,
            child: AnimatedScale(
              scale: _scale,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOutBack,
              child: _ChatGlassSurface(
                width: widget.size,
                height: widget.size,
                blurSigma: DimensV2.d6,
                borderRadius: BorderRadius.circular(AppRadiusV2.full),
                padding: padding,
                shadows: _chatGlassComposerShadow(),
                surfaceOpacity: _isPressed ? 0.45 : (_isHovered ? 0.75 : 0.6),
                child: Center(child: widget.child),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Glass text field used to compose multi-line chat messages.
///
/// The field follows the compact 42-pixel chat composer specification while
/// keeping its colors connected to the active May UI Kit theme.
class ChatGlassComposerTextFieldV2 extends StatefulWidget {
  /// Creates a glass composer backed by [controller] and [focusNode].
  const ChatGlassComposerTextFieldV2({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.hintText,
    this.enabled = true,
    this.maxLines = 5,
  });

  /// Controls the message being edited.
  final TextEditingController controller;

  /// Controls focus without replacing the caller's keyboard lifecycle.
  final FocusNode focusNode;

  /// Placeholder displayed while [controller] is empty.
  final String hintText;

  /// Whether the user can edit and select the current value.
  final bool enabled;

  /// Maximum visible lines before the input scrolls internally.
  final int maxLines;

  static const double _horizontalPadding = DimensV2.d14;
  static const double _multiLineRadius = DimensV2.d18;
  static const double _singleLineRadius = AppRadiusV2.full;

  /// Creates the focus-aware state for [ChatGlassComposerTextFieldV2].
  @override
  State<ChatGlassComposerTextFieldV2> createState() => _ChatGlassComposerTextFieldV2State();
}

class _ChatGlassComposerTextFieldV2State extends State<ChatGlassComposerTextFieldV2> {
  bool _isHovered = false;
  bool _isFocused = false;

  bool get _isInteractive => widget.enabled && (_isHovered || _isFocused);

  /// Subscribes to the caller-owned focus node when the field is mounted.
  @override
  void initState() {
    super.initState();
    _isFocused = widget.focusNode.hasFocus;
    widget.focusNode.addListener(_handleFocusChanged);
  }

  /// Keeps the focus subscription correct when [widget] receives a new node.
  @override
  void didUpdateWidget(covariant ChatGlassComposerTextFieldV2 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.focusNode != widget.focusNode) {
      oldWidget.focusNode.removeListener(_handleFocusChanged);
      _isFocused = widget.focusNode.hasFocus;
      widget.focusNode.addListener(_handleFocusChanged);
    }
  }

  /// Removes the focus listener without disposing the caller-owned node.
  @override
  void dispose() {
    widget.focusNode.removeListener(_handleFocusChanged);
    super.dispose();
  }

  void _handleFocusChanged() {
    final nextIsFocused = widget.focusNode.hasFocus;
    if (_isFocused == nextIsFocused) return;
    setState(() => _isFocused = nextIsFocused);
  }

  void _handleHover(bool value) {
    if (!widget.enabled || _isHovered == value) return;
    setState(() => _isHovered = value);
  }

  int _estimateLineCount({
    required BuildContext context,
    required String text,
    required TextStyle style,
    required double maxWidth,
  }) {
    if (text.isEmpty || maxWidth <= DimensV2.d0) {
      return 1;
    }

    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: Directionality.of(context),
      maxLines: widget.maxLines,
    )..layout(maxWidth: maxWidth);

    final lineMetrics = textPainter.computeLineMetrics();
    return lineMetrics.isEmpty ? 1 : lineMetrics.length;
  }

  /// Builds the compact glass message input for [context].
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    final inputTextStyle = AppTextStylesV2.text14Medium.copyWith(
      color: widget.enabled ? colors.txContentPrimaryDefault : colors.disabledText,
      height: DimensV2.d22 / DimensV2.d14,
    );
    final hintTextStyle = inputTextStyle.copyWith(
      color: widget.enabled ? colors.txContentTertiary : colors.disabledText,
    );

    return MouseRegion(
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: AnimatedScale(
        scale: _isInteractive ? 1.01 : 1,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final resolvedMaxWidth = constraints.hasBoundedWidth
                ? constraints.maxWidth
                : MediaQuery.sizeOf(context).width;
            final inputTextMaxWidth =
                (resolvedMaxWidth - (ChatGlassComposerTextFieldV2._horizontalPadding * 2))
                    .clamp(DimensV2.d0, double.infinity)
                    .toDouble();

            return ValueListenableBuilder<TextEditingValue>(
              valueListenable: widget.controller,
              builder: (context, value, _) {
                final lineCount = _estimateLineCount(
                  context: context,
                  text: value.text,
                  style: inputTextStyle,
                  maxWidth: inputTextMaxWidth,
                );
                final radius = lineCount > 1
                    ? ChatGlassComposerTextFieldV2._multiLineRadius
                    : ChatGlassComposerTextFieldV2._singleLineRadius;

                return _ChatGlassSurface(
                  blurSigma: DimensV2.d6,
                  borderRadius: BorderRadius.circular(radius),
                  padding: const EdgeInsets.symmetric(
                    horizontal: ChatGlassComposerTextFieldV2._horizontalPadding,
                  ),
                  shadows: _chatGlassComposerShadow(),
                  surfaceOpacity: _isInteractive ? 0.75 : 0.6,
                  borderColor: _isInteractive ? colors.themeAccent : colors.bgBtnOutlineDefault,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minHeight: DimensV2.d40,
                    ),
                    child: TextField(
                      controller: widget.controller,
                      focusNode: widget.focusNode,
                      readOnly: !widget.enabled,
                      enableInteractiveSelection: widget.enabled,
                      enableSuggestions: true,
                      autocorrect: true,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      minLines: 1,
                      maxLines: widget.maxLines,
                      cursorColor: colors.txContentPrimaryDefault,
                      cursorWidth: DimensV2.d2,
                      cursorRadius: const Radius.circular(DimensV2.d100),
                      cursorHeight: DimensV2.d20,
                      style: inputTextStyle,
                      strutStyle: const StrutStyle(
                        fontSize: DimensV2.d14,
                        height: DimensV2.d22 / DimensV2.d14,
                        forceStrutHeight: true,
                      ),
                      decoration: InputDecoration(
                        isCollapsed: true,
                        filled: false,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: DimensV2.d9,
                        ),
                        hintText: widget.hintText,
                        hintStyle: hintTextStyle,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _ChatGlassSurface extends StatelessWidget {
  const _ChatGlassSurface({
    required this.child,
    required this.blurSigma,
    required this.borderRadius,
    required this.padding,
    required this.shadows,
    this.width,
    this.height,
    this.surfaceOpacity = 0.6,
    this.borderColor,
  });

  final Widget child;
  final double blurSigma;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;
  final List<BoxShadow> shadows;
  final double? width;
  final double? height;
  final double surfaceOpacity;
  final Color? borderColor;

  /// Builds the themed blur, border, and shadow around [child].
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: shadows,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: blurSigma,
            sigmaY: blurSigma,
          ),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: colors.bgTextInputDefault.withValues(
                alpha: surfaceOpacity,
              ),
              border: Border.all(
                color: borderColor ?? colors.bgBtnOutlineDefault,
                width: DimensV2.d1,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

List<BoxShadow> _chatGlassComposerShadow() {
  return [
    BoxShadow(
      color: AppColorsV2.genericBlack.withValues(alpha: 0.12),
      offset: const Offset(DimensV2.d0, DimensV2.d16),
      blurRadius: DimensV2.d30,
    ),
  ];
}
