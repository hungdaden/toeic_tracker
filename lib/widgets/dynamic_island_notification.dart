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
  late Animation<double> _slideAnimation;
  Timer? _dismissTimer;
  bool _isDismissing = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
      reverseDuration: const Duration(milliseconds: 320),
    );

    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
      reverseCurve: Curves.easeInBack,
    );

    _slideAnimation = Tween<double>(begin: -30.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.45, curve: Curves.easeOutCubic),
        reverseCurve: Curves.easeInCubic,
      ),
    );

    _contentOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.35, 0.85, curve: Curves.easeIn),
        reverseCurve: const Interval(0.5, 1.0, curve: Curves.easeOut),
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

    // Kích thước ban đầu mô phỏng tai thỏ iPhone 12 (collapsed)
    final double collapsedWidth = 160.0;
    final double collapsedHeight = rawTopInset > 0 ? rawTopInset : 34.0;

    // Kích thước mở rộng: bám từ đỉnh màn hình top: 0 và mở rộng phủ trọn tai thỏ
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
        final currentTop = _slideAnimation.value;

        // Bo góc: đỉnh bo nhẹ khớp bezel màn hình, đáy bo cong tròn giọt nước Liquid Glass
        final double topCornerRadius = rawTopInset > 24 ? 14.0 : 28.0;
        final double bottomCornerRadius = 32.0;

        return Positioned(
          top: currentTop,
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
                    // Deep ambient occlusion
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.52),
                      blurRadius: 28,
                      spreadRadius: 1,
                      offset: const Offset(0, 12),
                    ),
                    // Notification type ambient halo glow
                    BoxShadow(
                      color: color.withValues(alpha: 0.26 * progress),
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                    // Specular rim light
                    BoxShadow(
                      color: Colors.white.withValues(alpha: 0.10 * progress),
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
                    filter: ImageFilter.blur(sigmaX: 22.0, sigmaY: 22.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color(0xFF090D18).withValues(alpha: 0.78),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xF0162035),
                            Color(0xE60E1526),
                            Color(0xF5080C16),
                          ],
                          stops: [0.0, 0.45, 1.0],
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(topCornerRadius),
                          topRight: Radius.circular(topCornerRadius),
                          bottomLeft: Radius.circular(bottomCornerRadius),
                          bottomRight: Radius.circular(bottomCornerRadius),
                        ),
                        border: Border.all(
                          color: Color.lerp(
                            Colors.white.withValues(alpha: 0.16),
                            color.withValues(alpha: 0.42),
                            progress,
                          )!,
                          width: 1.0,
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
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Leading glass icon chip
                              Container(
                                width: 34.0,
                                height: 34.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: color.withValues(alpha: 0.16),
                                  border: Border.all(
                                    color: color.withValues(alpha: 0.42),
                                    width: 1.0,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: color.withValues(alpha: 0.28),
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
                                  color: color.withValues(alpha: 0.12),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: color.withValues(alpha: 0.28),
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
        );
      },
    );
  }
}
