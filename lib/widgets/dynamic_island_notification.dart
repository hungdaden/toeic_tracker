import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum NotificationType { success, error, info, warning }

class DynamicIslandNotification {
  static OverlayEntry? _activeEntry;

  static void show(
    BuildContext context, {
    required String title,
    required String message,
    NotificationType type = NotificationType.info,
    Duration duration = const Duration(seconds: 3),
    OverlayState? overlayState,
  }) {
    // Ưu tiên dùng overlayState truyền vào, nếu không có mới tìm trong context
    OverlayState? state;
    try {
      state = overlayState ?? Overlay.maybeOf(context);
    } catch (_) {
      return;
    }

    if (state == null) return;

    // Hủy notification cũ nếu đang hiển thị để tránh bị đè lớp
    if (_activeEntry != null) {
      try {
        _activeEntry!.remove();
      } catch (_) {}
      _activeEntry = null;
    }

    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (overlayContext) => _NotificationWidget(
        title: title,
        message: message,
        type: type,
        onDismiss: () {
          if (_activeEntry == overlayEntry) {
            _activeEntry = null;
          }
          try {
            overlayEntry.remove();
          } catch (_) {}
        },
        duration: duration,
      ),
    );

    _activeEntry = overlayEntry;
    state.insert(overlayEntry);
  }
}

class _NotificationWidget extends StatefulWidget {
  final String title;
  final String message;
  final NotificationType type;
  final VoidCallback onDismiss;
  final Duration duration;

  const _NotificationWidget({
    required this.title,
    required this.message,
    required this.type,
    required this.onDismiss,
    required this.duration,
  });

  @override
  State<_NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<_NotificationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _expandAnimation;
  late Animation<double> _contentOpacityAnimation;
  late Animation<double> _contentSlideAnimation;
  Timer? _dismissTimer;
  bool _isDismissing = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 550),
      reverseDuration: const Duration(milliseconds: 300),
    );

    // Apple fluid spring ease curve for organic morphing from the notch
    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Cubic(0.16, 1.0, 0.3, 1.0),
      reverseCurve: Curves.easeInCubic,
    );

    // Content smoothly fades in and slightly floats up as the island expands
    _contentOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.35, 0.90, curve: Curves.easeOut),
        reverseCurve: const Interval(0.55, 1.0, curve: Curves.easeIn),
      ),
    );

    _contentSlideAnimation = Tween<double>(begin: 6.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.35, 0.90, curve: Curves.easeOutCubic),
      ),
    );

    try {
      HapticFeedback.lightImpact();
    } catch (_) {}

    _controller.forward();

    _dismissTimer = Timer(widget.duration, () {
      _dismiss();
    });
  }

  void _dismiss() {
    _dismissTimer?.cancel();
    _dismissTimer = null;
    if (!_isDismissing && mounted) {
      _isDismissing = true;
      _controller.reverse().then((_) {
        if (mounted) {
          widget.onDismiss();
        }
      });
    }
  }

  @override
  void dispose() {
    _dismissTimer?.cancel();
    _dismissTimer = null;
    _controller.dispose();
    super.dispose();
  }

  Color _getColor() {
    switch (widget.type) {
      case NotificationType.success:
        return const Color(0xFF10B981); // Emerald / Mint
      case NotificationType.error:
        return const Color(0xFFF43F5E); // Rose / Ruby
      case NotificationType.warning:
        return const Color(0xFFF59E0B); // Amber / Gold
      case NotificationType.info:
        return const Color(0xFF06B6D4); // Cyan / Electric Blue
    }
  }

  IconData _getIcon() {
    switch (widget.type) {
      case NotificationType.success:
        return Icons.check_circle_rounded;
      case NotificationType.error:
        return Icons.error_rounded;
      case NotificationType.warning:
        return Icons.warning_amber_rounded;
      case NotificationType.info:
        return Icons.info_outline_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor();
    final icon = _getIcon();

    // Query status bar / notch inset. iPhone 12 có topInset ~44-47px.
    final double rawTopInset = MediaQuery.paddingOf(context).top;
    final double screenWidth = MediaQuery.sizeOf(context).width;

    // Kích thước ban đầu xuất phát từ chính kích thước tai thỏ (t=0)
    final double collapsedWidth = 140.0;
    final double collapsedHeight = rawTopInset > 0 ? rawTopInset : 34.0;

    // Kích thước mở rộng: bám chặt từ đỉnh màn hình top: 0 và bung nở che trọn tai thỏ
    final double expandedWidth = (screenWidth - 20.0).clamp(280.0, 420.0);
    final double expandedHeight = rawTopInset > 0 ? rawTopInset + 54.0 : 66.0;

    // Khoảng đệm đỉnh giúp nội dung luôn nằm ở phần an toàn bên dưới tai thỏ
    final double contentTopPadding = rawTopInset > 0 ? rawTopInset + 2.0 : 10.0;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final progress = _expandAnimation.value.clamp(0.0, 1.0);
        final currentWidth = lerpDouble(collapsedWidth, expandedWidth, progress)!;
        final currentHeight = lerpDouble(collapsedHeight, expandedHeight, progress)!;

        // Bo góc: đỉnh khớp bezel viền máy, đáy bo cong tròn giọt nước Dynamic Island
        final double topCornerRadius = rawTopInset > 24 ? 14.0 : 28.0;
        final double bottomCornerRadius = 32.0;

        return Positioned(
          top: 0.0,
          left: (screenWidth - currentWidth) / 2,
          child: Material(
            color: Colors.transparent,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onVerticalDragUpdate: (details) {
                if (details.primaryDelta != null && details.primaryDelta! < -3) {
                  _dismiss();
                }
              },
              onTap: _dismiss,
              child: Container(
                width: currentWidth,
                height: currentHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(topCornerRadius),
                    topRight: Radius.circular(topCornerRadius),
                    bottomLeft: Radius.circular(bottomCornerRadius),
                    bottomRight: Radius.circular(bottomCornerRadius),
                  ),
                  boxShadow: [
                    // Deep ambient occlusion shadow nở êm theo progress (tránh giật bóng khi mới hiện)
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.55 * progress),
                      blurRadius: 28,
                      spreadRadius: 1,
                      offset: const Offset(0, 10),
                    ),
                    // Hào quang màu trạng thái nở êm theo progress
                    BoxShadow(
                      color: color.withValues(alpha: 0.28 * progress),
                      blurRadius: 22,
                      spreadRadius: 1,
                      offset: const Offset(0, 4),
                    ),
                    // Specular rim light nhẹ
                    BoxShadow(
                      color: Colors.white.withValues(alpha: 0.08 * progress),
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(topCornerRadius),
                    topRight: Radius.circular(topCornerRadius),
                    bottomLeft: Radius.circular(bottomCornerRadius),
                    bottomRight: Radius.circular(bottomCornerRadius),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 18.0, sigmaY: 18.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        // Nền màu ĐEN TUYỀN (pure OLED black) 100% để hòa lẫn hoàn toàn tai thỏ vật lý
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(topCornerRadius),
                          topRight: Radius.circular(topCornerRadius),
                          bottomLeft: Radius.circular(bottomCornerRadius),
                          bottomRight: Radius.circular(bottomCornerRadius),
                        ),
                        // Viền specular ánh kim kính mờ tinh tế định hình viên thuốc
                        border: Border.all(
                          color: Color.lerp(
                            Colors.white.withValues(alpha: 0.14),
                            color.withValues(alpha: 0.40),
                            progress,
                          )!,
                          width: 0.8,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: contentTopPadding,
                          bottom: 10.0,
                          left: 14.0,
                          right: 14.0,
                        ),
                        child: Opacity(
                          opacity: _contentOpacityAnimation.value,
                          child: Transform.translate(
                            offset: Offset(0.0, _contentSlideAnimation.value),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Leading glass icon chip
                                Container(
                                  width: 34.0,
                                  height: 34.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: color.withValues(alpha: 0.18),
                                    border: Border.all(
                                      color: color.withValues(alpha: 0.45),
                                      width: 1.0,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: color.withValues(alpha: 0.30),
                                        blurRadius: 8,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Icon(icon, color: color, size: 19),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                // Title & message text block
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        widget.title,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13,
                                          letterSpacing: -0.2,
                                          shadows: [
                                            Shadow(
                                              color: Colors.black45,
                                              blurRadius: 4,
                                              offset: Offset(0, 1),
                                            ),
                                          ],
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        widget.message,
                                        style: TextStyle(
                                          color: Colors.white.withValues(alpha: 0.82),
                                          fontSize: 11.5,
                                          height: 1.2,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                // Trailing pulsing indicator badge
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: color.withValues(alpha: 0.14),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: color.withValues(alpha: 0.32),
                                      width: 0.8,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 6,
                                        height: 6,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: color,
                                          boxShadow: [
                                            BoxShadow(
                                              color: color.withValues(alpha: 0.7),
                                              blurRadius: 4,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
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
