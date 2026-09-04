import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../may_uikit.dart';

/// Dữ liệu cho từng tab trong [FloatingBottomBarV2].
class FloatingBottomBarItemV2 {
  /// Khởi tạo [FloatingBottomBarItemV2].
  const FloatingBottomBarItemV2({
    required this.title,
    required this.activeIcon,
    required this.inactiveIcon,
    this.count,
    this.activeBackgroundGradient,
    this.activeBackgroundImage,
    this.activeBackgroundBlur,
  });

  /// Tiêu đề tab.
  final String title;

  /// Icon khi tab đang active.
  final Widget activeIcon;

  /// Icon khi tab không active.
  final Widget inactiveIcon;

  /// Badge count đếm số lượng hiển thị góc trên-phải tab.
  final int? count;

  /// Gradient nền khi active. Nếu null thì dùng màu mặc định.
  final Gradient? activeBackgroundGradient;

  /// Ảnh nền khi active.
  final ImageProvider? activeBackgroundImage;

  /// Độ blur nền khi active.
  final double? activeBackgroundBlur;
}

/// Bottom navigation bar nổi với animation trượt indicator.
///
/// Hỗ trợ kéo thả để chuyển tab và nhấn tap thông thường.
class FloatingBottomBarV2 extends StatefulWidget {
  /// Khởi tạo [FloatingBottomBarV2].
  const FloatingBottomBarV2({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.isShrinked = false,
    this.shrinkTrigger = 0,
  });

  /// Whether the bar should appear in its shrunk state.
  final bool isShrinked;

  /// A trigger value to reset the bar's expanded state on new scroll events.
  final int shrinkTrigger;

  /// Index tab đang được chọn.
  final int currentIndex;

  /// Callback khi người dùng chọn tab.
  final ValueChanged<int> onTap;

  /// Danh sách các tab.
  final List<FloatingBottomBarItemV2> items;

  /// Creates the mutable state for the floating bottom bar.
  @override
  State<FloatingBottomBarV2> createState() => _FloatingBottomBarV2State();
}

class _FloatingBottomBarV2State extends State<FloatingBottomBarV2> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late AnimationController _widthController;
  late Animation<double> _widthAnimation;
  int _lastHapticIndex = -1;
  bool _forceExpanded = false;
  double? _pointerStartDx;

  /// Initializes the animation controllers used by the bar interactions.
  @override
  void initState() {
    super.initState();
    _lastHapticIndex = widget.currentIndex;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
      value: widget.currentIndex.toDouble(),
      lowerBound: 0.0,
      upperBound: (widget.items.isEmpty ? 0 : widget.items.length - 1).toDouble(),
    );

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 200),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeOutBack),
    );

    _widthController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 200),
    );
    _widthAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(parent: _widthController, curve: Curves.easeOutCubic),
    );
  }

  /// Updates animations when the selected tab changes from the parent widget.
  @override
  void didUpdateWidget(covariant FloatingBottomBarV2 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isShrinked != widget.isShrinked ||
        oldWidget.shrinkTrigger != widget.shrinkTrigger) {
      if (widget.isShrinked) {
        _forceExpanded = false;
      }
    }

    if (oldWidget.currentIndex != widget.currentIndex) {
      _scaleController.forward().then((_) {
        if (mounted) _scaleController.reverse();
      });
      _widthController.forward().then((_) {
        if (mounted) _widthController.reverse();
      });
      _controller.animateTo(
        widget.currentIndex.toDouble(),
        curve: Curves.easeOutCubic,
        duration: const Duration(milliseconds: 350),
      );
    }
  }

  /// Releases the animation controllers owned by this state.
  @override
  void dispose() {
    _controller.dispose();
    _scaleController.dispose();
    _widthController.dispose();
    super.dispose();
  }

  void _handlePointerUpdate(double dx, double tabWidth) {
    final newPos = ((dx / tabWidth) - 0.5).clamp(0.0, (widget.items.length - 1).toDouble());
    _controller.value = newPos;

    final currentHapticIndex = newPos.round();
    if (currentHapticIndex != _lastHapticIndex) {
      _lastHapticIndex = currentHapticIndex;
      HapticUtil.mediumImpact();
    }
  }

  void _handlePointerRelease() {
    _pointerStartDx = null;
    _scaleController.reverse();
    _widthController.reverse();
    final target = _controller.value.roundToDouble();
    _controller.animateTo(
      target,
      curve: Curves.easeOutCubic,
      duration: const Duration(milliseconds: 350),
    );
    widget.onTap(target.toInt());
  }

  /// Builds the floating bottom bar with its animated active indicator.
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 20,
          left: 0,
          right: 0,
          bottom: 0,
          child: ClipRect(
            child: Stack(
              fit: StackFit.expand,
              children: [
                ShaderMask(
                  blendMode: BlendMode.dstIn,
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColorsV2.transparent,
                        AppColorsV2.transparent,
                        AppColorsV2.genericWhite.withValues(alpha: 0.7),
                        AppColorsV2.genericWhite,
                      ],
                      stops: const [0.0, 0.32, 0.72, 1.0],
                    ).createShader(bounds);
                  },
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: const SizedBox.expand(),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColorsV2.genericBlack.withValues(alpha: 0.0),
                        AppColorsV2.genericBlack.withValues(alpha: 0.0),
                        AppColorsV2.genericBlack.withValues(alpha: 0.18),
                        AppColorsV2.genericBlack.withValues(alpha: 0.58),
                      ],
                      stops: const [0.0, 0.42, 0.72, 1.0],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedScale(
          scale: (widget.isShrinked && !_forceExpanded) ? 0.89 : 1.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              widget.items.length >= 4 ? DimensV2.d16 : DimensV2.d32,
              DimensV2.d20,
              widget.items.length >= 4 ? DimensV2.d16 : DimensV2.d32,
              (!kIsWeb && Platform.isIOS)
                  ? DimensV2.d24
                  : (MediaQuery.viewPaddingOf(context).bottom > 0
                      ? MediaQuery.viewPaddingOf(context).bottom + DimensV2.d12
                      : DimensV2.d24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColorsV2.neutral900,
                    borderRadius: BorderRadius.circular(DimensV2.d52),
                    boxShadow: [
                      BoxShadow(
                        color: AppColorsV2.bottomBarShadow.withValues(alpha: 0.19),
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                      BoxShadow(
                        color: AppColorsV2.bottomBarShadow.withValues(alpha: 0.16),
                        blurRadius: 14,
                        offset: const Offset(0, 14),
                      ),
                      BoxShadow(
                        color: AppColorsV2.bottomBarShadow.withValues(alpha: 0.10),
                        blurRadius: 18,
                        offset: const Offset(0, 31),
                      ),
                      BoxShadow(
                        color: AppColorsV2.bottomBarShadow.withValues(alpha: 0.03),
                        blurRadius: 22,
                        offset: const Offset(0, 54),
                      ),
                      BoxShadow(
                        color: AppColorsV2.bottomBarShadow.withValues(alpha: 0.00),
                        blurRadius: 24,
                        offset: const Offset(0, 85),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: DimensV2.d4, vertical: DimensV2.d4),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final tabWidth = constraints.maxWidth / widget.items.length;
                        return Listener(
                          behavior: HitTestBehavior.translucent,
                          onPointerDown: (event) {
                            if (widget.isShrinked && !_forceExpanded) {
                              setState(() {
                                _forceExpanded = true;
                              });
                            }
                            _pointerStartDx = event.localPosition.dx;
                            _scaleController.forward();
                            _widthController.forward();
                          },
                          onPointerMove: (event) {
                            if (_pointerStartDx != null) {
                              final distance = (event.localPosition.dx - _pointerStartDx!).abs();
                              if (distance > 3.0) {
                                _handlePointerUpdate(event.localPosition.dx, tabWidth);
                              }
                            }
                          },
                          onPointerUp: (event) {
                            _handlePointerRelease();
                          },
                          onPointerCancel: (event) {
                            _handlePointerRelease();
                          },
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onPanUpdate: (details) =>
                                _handlePointerUpdate(details.localPosition.dx, tabWidth),
                            onPanEnd: (_) => _handlePointerRelease(),
                            onTapUp: (details) {
                              final tappedIndex = (details.localPosition.dx / tabWidth).floor();
                              if (tappedIndex >= 0 && tappedIndex < widget.items.length) {
                                if (tappedIndex != widget.currentIndex) {
                                  _lastHapticIndex = tappedIndex;
                                  HapticUtil.mediumImpact();
                                }
                                widget.onTap(tappedIndex);
                              }
                              _scaleController.reverse();
                              _widthController.reverse();
                            },
                            child: AnimatedBuilder(
                              animation: _controller,
                              builder: (context, child) {
                                final t = _controller.value;
                                final activeIndex = t.round();
                                final activeItem = widget.items[activeIndex];

                                Widget backgroundWidget = DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: activeItem.activeBackgroundGradient == null &&
                                            activeItem.activeBackgroundImage == null
                                        ? AppColorsV2.genericWhite
                                        : null,
                                    gradient: activeItem.activeBackgroundGradient,
                                    image: activeItem.activeBackgroundImage != null
                                        ? DecorationImage(
                                            image: activeItem.activeBackgroundImage!,
                                            fit: BoxFit.cover,
                                          )
                                        : null,
                                    borderRadius: BorderRadius.circular(DimensV2.d100),
                                  ),
                                );

                                if (activeItem.activeBackgroundBlur != null) {
                                  backgroundWidget = DecoratedBox(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(DimensV2.d100),
                                      color: AppColorsV2.neutral100.withValues(alpha: 0.9),
                                    ),
                                    child: ImageFiltered(
                                      imageFilter: ImageFilter.blur(
                                        sigmaX: activeItem.activeBackgroundBlur!,
                                        sigmaY: activeItem.activeBackgroundBlur!,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: DimensV2.d18,
                                          vertical: DimensV2.d12,
                                        ),
                                        child: backgroundWidget,
                                      ),
                                    ),
                                  );
                                }

                                return AnimatedBuilder(
                                  animation: Listenable.merge([_scaleAnimation, _widthAnimation]),
                                  builder: (context, child) {
                                    final extraWidth = tabWidth * _widthAnimation.value * 0.3;
                                    final currentWidth = tabWidth + extraWidth;
                                    final center = (t + 0.5) * tabWidth;
                                    final currentLeft = center - (currentWidth / 2);

                                    return Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Positioned(
                                          left: currentLeft,
                                          top: DimensV2.d0,
                                          bottom: DimensV2.d0,
                                          width: currentWidth,
                                          child: Transform.scale(
                                            scale: _scaleAnimation.value,
                                            child: backgroundWidget,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: widget.items.asMap().entries.map((entry) {
                                            final index = entry.key;
                                            final item = entry.value;
                                            final distance = (index - t).abs();
                                            final activeFactor = (1.0 - distance).clamp(0.0, 1.0);

                                            return Expanded(
                                              child: ColoredBox(
                                                color: AppColorsV2.transparent,
                                                child: _buildTabItem(item, activeFactor),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabItem(FloatingBottomBarItemV2 item, double activeFactor) {
    final String? displayCount = item.count != null && item.count! > 0
        ? (item.count! > 99 ? '99+' : '${item.count}')
        : null;

    final iconWidget = SizedBox(
      width: DimensV2.d24,
      height: DimensV2.d24,
      child: activeFactor > 0.5 ? item.activeIcon : item.inactiveIcon,
    );

    final Widget iconWithBadge = displayCount != null
        ? Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              iconWidget,
              Positioned(
                top: -DimensV2.d4,
                left: DimensV2.d13,
                child: AppUnreadBadgeV2(label: displayCount),
              ),
            ],
          )
        : iconWidget;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: DimensV2.d8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          iconWithBadge,
          const SizedBox(height: DimensV2.d6),
          Text(
            item.title,
            style: TextStyle.lerp(
              AppTextStylesV2.subHeadRegular.copyWith(
                color: AppColorsV2.neutral200,
              ),
              AppTextStylesV2.subHeadSemiBold.copyWith(
                color: AppColorsV2.neutral900,
              ),
              activeFactor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
