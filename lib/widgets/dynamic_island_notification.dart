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

    // Phân loại kiểu màn hình:
    // - Dynamic Island (Viên thuốc - iPhone 14 Pro, 14 Pro Max, 15 series, 16 series): rawTopInset >= 54.0 (59.0 hoặc 62.0)
    // - Tai thỏ (Notch - iPhone X, 11, 12, 13, 14 thường): 40.0 <= rawTopInset < 54.0 (44.0 - 50.0)
    // - Màn hình phẳng (iPhone SE, iPad, Android flat): rawTopInset < 40.0
    final bool isDynamicIsland = rawTopInset >= 54.0;
    final bool isNotch = rawTopInset >= 40.0 && rawTopInset < 54.0;

    // Vị trí top:
    // - Dynamic Island nổi độc lập tách biệt mép đỉnh: (rawTopInset - 37.0) / 2 (~11px)
    // - Tai thỏ dính sát mép trên: 0.0 để liền mạch với notch vật lý
    // - Màn hình phẳng: cách mép trên 10px hoặc rawTopInset + 6.0
    final double targetTop = isDynamicIsland
        ? ((rawTopInset - 37.0) / 2).clamp(8.0, 14.0)
        : (isNotch ? 0.0 : (rawTopInset > 0 ? rawTopInset + 6.0 : 10.0));

    // Kích thước phôi ban đầu (Collapsed):
    // - Dynamic Island: Phôi viên thuốc vật lý chuẩn Apple (125.0 x 37.0)
    // - Tai thỏ: Phôi notch vật lý (140.0 x ~34.0)
    // - Màn hình phẳng: Phôi nhỏ (120.0 x 32.0)
    final double collapsedWidth = isDynamicIsland
        ? 125.0
        : (isNotch ? 140.0 : 120.0);
    final double collapsedHeight = isDynamicIsland
        ? 37.0
        : (isNotch ? (rawTopInset * 0.72).clamp(30.0, 36.0) : 32.0);

    // Kích thước mở rộng (Expanded):
    // - Bề ngang: ~320px chuẩn thanh lịch
    final double expandedWidth = (screenWidth * 0.82).clamp(310.0, 335.0);
    // - Chiều cao:
    //   + Dynamic Island (14 Pro trở lên): 72.0px (phần viên thuốc 37px ở trên + phần text 35px ở dưới,
    //     đảm bảo text nằm HOÀN TOÀN BÊN DƯỚI viên thuốc vật lý, đủ breathing room không bị tràn pixel)
    //   + Tai thỏ: rawTopInset + 26.0px (rút bớt đúng 50% chiều cao pop-down so với 52px trước đây)
    //   + Màn hình phẳng: 44.0px
    final double expandedHeight = isDynamicIsland
        ? 72.0
        : (isNotch ? rawTopInset + 26.0 : 44.0);

    // Bo góc (BorderRadius):
    // - Dynamic Island / Màn hình phẳng: Bo tròn trọn vẹn 4 góc capsule viên thuốc (Radius.circular(24.0))
    // - Tai thỏ: 2 góc trên phẳng tuyệt đối (Radius.zero), 2 góc dưới bo cong giọt nước (Radius.circular(16.0))
    final BorderRadius islandBorderRadius = isDynamicIsland || !isNotch
        ? BorderRadius.circular(24.0)
        : const BorderRadius.only(
            topLeft: Radius.zero,
            topRight: Radius.zero,
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
          );

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final progress = _bloomAnimation.value;
        final clampedProgress = progress.clamp(0.0, 1.0);

        // Bung nở đàn hồi từ phôi
        final currentWidth = collapsedWidth + (expandedWidth - collapsedWidth) * progress;
        final currentHeight = collapsedHeight + (expandedHeight - collapsedHeight) * progress;

        final borderColor = Color.lerp(
          Colors.white.withValues(alpha: 0.12),
          color.withValues(alpha: 0.40),
          clampedProgress,
        )!;

        // Viền:
        // - Dynamic Island / Màn hình phẳng: Viền hairline 4 cạnh trọn vẹn
        // - Tai thỏ: Bỏ viền trên, chỉ giữ viền 2 bên và viền dưới
        final Border islandBorder = isDynamicIsland || !isNotch
            ? Border.all(
                color: borderColor.withValues(alpha: borderColor.a * clampedProgress),
                width: 0.8,
              )
            : Border(
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
              );

        return Positioned(
          top: targetTop,
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
                    // Deep ambient occlusion shadow tỏa êm xuống dưới
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
                        // Nền màu ĐEN TUYỀN (pure OLED black) 100% để hòa lẫn hoàn toàn tai thỏ / viên thuốc vật lý
                        color: Colors.black,
                        borderRadius: islandBorderRadius,
                        border: islandBorder,
                      ),
                      child: isDynamicIsland
                          ? Column(
                              children: [
                                // Khoảng đệm che viên thuốc vật lý mượt mà theo animation
                                SizedBox(
                                  height: 37.0 * clampedProgress,
                                ),
                                // Vùng nội dung: Icon, Text và Chấm màu nằm cùng một dòng căn thẳng hàng
                                Expanded(
                                  child: ClipRect(
                                    child: Center(
                                      child: _buildContentRow(color, icon),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : (isNotch
                              ? Column(
                                  children: [
                                    // Khoảng đệm che notch vật lý mượt mà theo animation (nâng nhẹ lên để nội dung có thêm khoảng trống dưới chân)
                                    SizedBox(
                                      height: (rawTopInset > 0 ? (rawTopInset - 5.0) : 0.0) * clampedProgress,
                                    ),
                                    // Vùng nội dung compact rút gọn dưới tai thỏ, nâng lên một chút tạo khoảng trống dưới chân nội dung
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 3.5),
                                        child: Center(
                                          child: _buildContentRow(color, icon),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Center(
                                  child: _buildContentRow(color, icon),
                                )),
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

  Widget _buildContentRow(Color color, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Opacity(
        opacity: _contentOpacityAnimation.value,
        child: Transform.scale(
          scale: _contentScaleAnimation.value,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Leading glass icon chip nhỏ gọn
              Container(
                width: 22.0,
                height: 22.0,
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
                  child: Icon(icon, color: color, size: 13),
                ),
              ),
              const SizedBox(width: 8),
              // Title & message nằm chính giữa
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.center,
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
                          fontSize: 11.5,
                          letterSpacing: -0.2,
                          height: 1.1,
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
                          fontSize: 9.5,
                          height: 1.1,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Trailing balancing container chứa chấm trạng thái phát sáng cân xứng
              SizedBox(
                width: 20.0,
                height: 20.0,
                child: Center(
                  child: Container(
                    width: 5.5,
                    height: 5.5,
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
    );
  }
}
