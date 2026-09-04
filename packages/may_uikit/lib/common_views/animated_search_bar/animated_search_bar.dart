import 'package:flutter/material.dart';

import '../../may_uikit.dart';
import '../../resources/generated/assets.gen.dart';

/// A search bar component with a smooth right-to-left expand/collapse animation.
/// Uses [PressableCardContainerV2] as the container base.
class AnimatedSearchBarV2 extends StatefulWidget {
  /// Creates an [AnimatedSearchBarV2] with customized callbacks and animation configurations.
  const AnimatedSearchBarV2({
    super.key,
    this.controller,
    this.focusNode,
    this.scrollController,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.onExpandChanged,
    this.hintText,
    this.height = DimensV2.d36,
    this.collapsedWidth = DimensV2.d36,
    this.expandedWidth,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeOutCubic,
    this.backgroundColor,
    this.searchIconColor,
    this.textColor,
    this.hintColor,
    this.autoFocus = true,
  });

  /// Controller for managing search query text.
  final TextEditingController? controller;

  /// Focus node for managing search text field focus.
  final FocusNode? focusNode;

  /// Optional scroll controller to automatically scroll back to top when searching or expanding.
  final ScrollController? scrollController;

  /// Callback fired when search query changes.
  final ValueChanged<String>? onChanged;

  /// Callback fired when search query is submitted from keyboard.
  final ValueChanged<String>? onSubmitted;

  /// Callback fired when search text is cleared or search bar collapses.
  final VoidCallback? onClear;

  /// Callback fired when search bar expands or collapses.
  final ValueChanged<bool>? onExpandChanged;

  /// Placeholder hint text.
  final String? hintText;

  /// Height of the search bar container.
  final double height;

  /// Width of the search bar when collapsed into an icon.
  final double collapsedWidth;

  /// Width of the search bar when expanded. Defaults to screen width minus padding if null.
  final double? expandedWidth;

  /// Animation duration.
  final Duration duration;

  /// Animation curve.
  final Curve curve;

  /// Background color of the search card.
  final Color? backgroundColor;

  /// Color for the search SVG icon.
  final Color? searchIconColor;

  /// Text style color for the entered search query.
  final Color? textColor;

  /// Text style color for the placeholder hint.
  final Color? hintColor;

  /// Auto-focus text field upon expanding.
  final bool autoFocus;

  @override
  ///
  State<AnimatedSearchBarV2> createState() => _AnimatedSearchBarV2State();
}

class _AnimatedSearchBarV2State extends State<AnimatedSearchBarV2>
    with SingleTickerProviderStateMixin {
  late TextEditingController _textController;
  late FocusNode _focusNode;
  late AnimationController _animController;
  late Animation<double> _expandAnimation;

  bool _isExpanded = false;

  @override
  ///
  void initState() {
    super.initState();
    _textController = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();

    _animController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _expandAnimation = CurvedAnimation(
      parent: _animController,
      curve: widget.curve,
    );

    _textController.addListener(_onTextChanged);
  }

  @override
  ///
  void dispose() {
    if (widget.controller == null) {
      _textController.dispose();
    } else {
      _textController.removeListener(_onTextChanged);
    }
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    _animController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final sc = widget.scrollController;
    if (sc != null && sc.hasClients && sc.offset > 0) {
      sc.animateTo(
        0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
      );
    }
    if (mounted) setState(() {});
    widget.onChanged?.call(_textController.text);
  }

  void _expand() {
    if (_isExpanded) return;
    setState(() => _isExpanded = true);
    widget.onExpandChanged?.call(true);

    final sc = widget.scrollController;
    if (sc != null && sc.hasClients && sc.offset > 0) {
      sc.animateTo(
        0,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
      );
    }

    _animController.forward().then((_) {
      if (widget.autoFocus && mounted) {
        _focusNode.requestFocus();
      }
    });
  }

  void _collapse() {
    if (!_isExpanded) return;
    _focusNode.unfocus();
    setState(() => _isExpanded = false);

    _animController.reverse().then((_) {
      if (mounted) {
        _textController.clear();
        widget.onClear?.call();
        widget.onExpandChanged?.call(false);
      }
    });
  }

  @override
  ///
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final calcExpandedWidth = widget.expandedWidth ?? (screenWidth - DimensV2.d76);
    final colors = context.mayColors;
    final cardColor = widget.backgroundColor ?? colors.bgCard;

    return AnimatedBuilder(
      animation: _expandAnimation,
      builder: (context, child) {
        final animValue = _expandAnimation.value;
        final currentWidth = Tween<double>(
          begin: widget.collapsedWidth,
          end: calcExpandedWidth,
        ).evaluate(_expandAnimation);

        final currentRadius = Tween<double>(
          begin: DimensV2.d100,
          end: DimensV2.d20,
        ).evaluate(_expandAnimation);

        final isFullyCollapsed = _expandAnimation.isDismissed;

        return Material(
          color: AppColorsV2.transparent,
          child: SizedBox(
            width: currentWidth,
            height: widget.height,
            child: PressableCardContainerV2(
              onTap: isFullyCollapsed ? _expand : null,
              height: widget.height,
              borderRadius: currentRadius,
              pressedOffset: 2.0,
              color: cardColor,
              padding: EdgeInsets.zero,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(currentRadius),
                child: SizedBox(
                  width: currentWidth,
                  height: widget.height,
                  child: Stack(
                  clipBehavior: Clip.hardEdge,
                  children: [
                    // Collapsed Action Icon View (Icon_search_v2.svg)
                    Positioned.fill(
                      child: Opacity(
                        opacity: (1.0 - (animValue * 2.0)).clamp(0.0, 1.0),
                        child: Center(
                          child: AdaptiveImageV2(
                            url: Assets.icons.iconSearchV2.keyName,
                            width: DimensV2.d20,
                            height: DimensV2.d20,
                            tintColor:
                                widget.searchIconColor ?? colors.txContentPrimaryDefault,
                          ),
                        ),
                      ),
                    ),

                    // Expanded Search Bar View (search_v2.svg + TextField + Close)
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      width: calcExpandedWidth,
                      child: IgnorePointer(
                        ignoring: animValue < 0.5,
                        child: Opacity(
                          opacity: ((animValue - 0.3) * 1.42).clamp(0.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: DimensV2.d12,
                              right: DimensV2.d6,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AdaptiveImageV2(
                                  url: Assets.icons.searchV2.keyName,
                                  width: DimensV2.d20,
                                  height: DimensV2.d20,
                                  tintColor:
                                      widget.searchIconColor ?? colors.txContentSecondaryDefault,
                                ),
                                const SizedBox(width: DimensV2.d8),
                                Expanded(
                                  child: TextField(
                                    controller: _textController,
                                    focusNode: _focusNode,
                                    onSubmitted: widget.onSubmitted,
                                    style: AppTextStylesV2.text14Medium.copyWith(
                                      color: widget.textColor ?? colors.txContentPrimaryDefault,
                                    ),
                                    cursorColor: colors.primaryButton,
                                    decoration: InputDecoration(
                                      hintText: widget.hintText ?? 'Tìm kiếm...',
                                      hintStyle: AppTextStylesV2.text14Medium.copyWith(
                                        color:
                                            widget.hintColor ?? colors.txContentSecondaryDefault,
                                      ),
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      filled: false,
                                      fillColor: AppColorsV2.transparent,
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: DimensV2.d4),
                                GestureDetector(
                                  onTap: _collapse,
                                  behavior: HitTestBehavior.opaque,
                                  child: Padding(
                                    padding: const EdgeInsets.all(DimensV2.d4),
                                    child: Icon(
                                      Icons.close_rounded,
                                      size: DimensV2.d20,
                                      color: colors.txContentSecondaryDefault,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
      },
    );
  }
}
