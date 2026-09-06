import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum NotificationType { success, error, info, warning }

class DynamicIslandNotification {
  static OverlayEntry? _activeEntry;
  static int _activeCount = 0;

  static void _hideStatusBar() {
    try {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom],
      );
    } catch (_) {}
  }

  static void _restoreStatusBar() {
    try {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    } catch (_) {}
  }

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
  late Animation<double> _bloomAnimation;
  late Animation<double> _contentOpacityAnimation;
  late Animation<double> _contentScaleAnimation;
  Timer? _dismissTimer;
  bool _isDismissing = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 580),
      reverseDuration: const Duration(milliseconds: 280),
    );

    // Đường cong Bung Nở Đàn Hồi (Apple Spring Overshoot):
    // Phôi tai thỏ giãn nở nhẹ quá đà (~1.08x) rồi nảy nhịp nhẹ về kích thước chuẩn
    _bloomAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Cubic(0.34, 1.56, 0.64, 1.0),
      reverseCurve: Curves.easeInCubic,
    );

    // Nội dung bên trong mờ hiện và phóng nhẹ từ lõi viên thuốc
    _contentOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.38, 0.85, curve: Curves.easeIn),
        reverseCurve: const Interval(0.55, 1.0, curve: Curves.easeOut),
      ),
    );

    _contentScaleAnimation = Tween<double>(begin: 0.75, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.38, 0.95, curve: Curves.easeOutBack),
      ),
    );

    try {
      HapticFeedback.mediumImpact();
    } catch (_) {}

    // Ẩn thanh trạng thái (đồng hồ, sóng, wifi) để Dynamic Island che trùm lên
    DynamicIslandNotification._activeCount++;
    DynamicIslandNotification._hideStatusBar();

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
    DynamicIslandNotification._activeCount =
        (DynamicIslandNotification._activeCount - 1).clamp(0, 999);
    if (DynamicIslandNotification._activeCount == 0) {
      DynamicIslandNotification._restoreStatusBar();
    }
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

    // Query status bar / notch inset. Ưu tiên viewPadding để không bị ảnh hưởng khi ẩn status bar
    final double viewPaddingTop = MediaQuery.viewPaddingOf(context).top;
    final double paddingTop = MediaQuery.paddingOf(context).top;
    final double rawTopInset = viewPaddingTop > 0 ? viewPaddingTop : paddingTop;
    final double screenWidth = MediaQuery.sizeOf(context).width;

    // Phôi ban đầu: đúng khuôn notch vật lý của iPhone 12 (width: 140, height: ~34px)
    final double collapsedWidth = 140.0;
    final double collapsedHeight = rawTopInset > 0 ? rawTopInset * 0.75 : 28.0;

    // Kích thước mở rộng: Tăng thêm bề ngang (~320px)
    final double expandedWidth = (screenWidth * 0.82).clamp(310.0, 335.0);
    // Tối ưu kích thước theo đúng sơ đồ:
    // Màu đen là tai thỏ (0 -> rawTopInset)
    // Màu đỏ là Dynamic Island mở rộng xuống dưới
    // Màu xanh là vùng nội dung xuất hiện (nằm hoàn toàn bên dưới tai thỏ, cách tai thỏ và đáy viên thuốc hợp lý)
    final double expandedHeight = rawTopInset > 0 ? rawTopInset + 58.0 : 66.0;

    // Khoảng đệm đỉnh: Đặt nội dung nằm hoàn toàn bên dưới tai thỏ vật lý theo đúng vùng màu xanh
    final double contentTopPadding = rawTopInset > 0 ? rawTopInset + 8.0 : 10.0;

    // 2 góc sát cạnh trên màn hình phẳng tuyệt đối (Radius.zero), không bo cong.
    // 2 góc dưới bo cong tròn giọt nước Dynamic Island (26.0) hài hòa với chiều cao mới.
    const BorderRadius islandBorderRadius = BorderRadius.only(
      topLeft: Radius.zero,
      topRight: Radius.zero,
      bottomLeft: Radius.circular(26.0),
      bottomRight: Radius.circular(26.0),
    );

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final progress = _bloomAnimation.value;
        final clampedProgress = progress.clamp(0.0, 1.0);

        // Bung nở đàn hồi từ phôi tai thỏ
        final currentWidth = collapsedWidth + (expandedWidth - collapsedWidth) * progress;
        final currentHeight = collapsedHeight + (expandedHeight - collapsedHeight) * progress;

        final borderColor = Color.lerp(
          Colors.white.withValues(alpha: 0.12),
          color.withValues(alpha: 0.40),
          clampedProgress,
        )!;

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
                  borderRadius: islandBorderRadius,
                  boxShadow: [
                    // Deep ambient occlusion shadow tỏa êm xuống dưới, không tỏa ngược lên bezel
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.58 * clampedProgress),
                      blurRadius: 24,
                      spreadRadius: 0,
                      offset: const Offset(0, 8),
                    ),
                    // Hào quang màu trạng thái nở êm theo progress
                    BoxShadow(
                      color: color.withValues(alpha: 0.30 * clampedProgress),
                      blurRadius: 18,
                      spreadRadius: 0,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: islandBorderRadius,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 18.0, sigmaY: 18.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        // Nền màu ĐEN TUYỀN (pure OLED black) 100% để hòa lẫn hoàn toàn tai thỏ vật lý
                        color: Colors.black,
                        borderRadius: islandBorderRadius,
                        // BỎ VIỀN TRÊN CÙNG (top: BorderSide.none), chỉ giữ viền cạnh trái/phải và viền dưới
                        border: Border(
                          top: BorderSide.none,
                          left: BorderSide(
                            color: borderColor.withValues(alpha: borderColor.a * clampedProgress),
                            width: 0.8,
                          ),
                          right: BorderSide(
                            color: borderColor.withValues(alpha: borderColor.a * clampedProgress),
                            width: 0.8,
                          ),
                          bottom: BorderSide(
                            color: borderColor.withValues(alpha: borderColor.a * clampedProgress),
                            width: 0.8,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: contentTopPadding,
                          bottom: 12.0,
                          left: 14.0,
                          right: 14.0,
                        ),
                        child: Center(
                          child: Opacity(
                            opacity: _contentOpacityAnimation.value,
                            child: Transform.scale(
                              scale: _contentScaleAnimation.value,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Leading glass icon chip nhỏ gọn
                                  Container(
                                    width: 26.0,
                                    height: 26.0,
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
                                          blurRadius: 6,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Icon(icon, color: color, size: 15),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  // Title & message nằm chính giữa Dynamic Island
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          widget.title,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12.0,
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
                                        const SizedBox(height: 0.5),
                                        Text(
                                          widget.message,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white.withValues(alpha: 0.85),
                                            fontSize: 10.5,
                                            height: 1.15,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  // Trailing balancing container chứa chấm trạng thái phát sáng cân xứng
                                  SizedBox(
                                    width: 26.0,
                                    height: 26.0,
                                    child: Center(
                                      child: Container(
                                        width: 6.5,
                                        height: 6.5,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: color,
                                          boxShadow: [
                                            BoxShadow(
                                              color: color.withValues(alpha: 0.85),
                                              blurRadius: 5,
                                            ),
                                          ],
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
