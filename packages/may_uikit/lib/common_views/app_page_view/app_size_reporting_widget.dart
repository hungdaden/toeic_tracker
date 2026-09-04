import 'package:flutter/material.dart';

/// Widget báo cáo sự thay đổi kích thước của child widget.
class AppSizeReportingWidgetV2 extends StatefulWidget {
  /// Khởi tạo [AppSizeReportingWidgetV2].
  const AppSizeReportingWidgetV2({
    required this.child,
    required this.onSizeChange,
    super.key,
  });

  /// Widget con cần theo dõi kích thước.
  final Widget child;

  /// Callback được gọi khi kích thước thay đổi.
  final ValueChanged<Size> onSizeChange;

  @override
  /// Tạo state cho [AppSizeReportingWidgetV2].
  State<AppSizeReportingWidgetV2> createState() => _AppSizeReportingWidgetV2State();
}

class _AppSizeReportingWidgetV2State extends State<AppSizeReportingWidgetV2> {
  final _widgetKey = GlobalKey();
  Size? _oldSize;

  @override
  /// Xây dựng giao diện cho widget sử dụng [context].
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _notifySize());
    return NotificationListener<SizeChangedLayoutNotification>(
      onNotification: (_) {
        WidgetsBinding.instance.addPostFrameCallback((_) => _notifySize());
        return true;
      },
      child: SizeChangedLayoutNotifier(
        child: Container(
          key: _widgetKey,
          child: widget.child,
        ),
      ),
    );
  }

  void _notifySize() {
    if (!mounted) return;
    final context = _widgetKey.currentContext;
    if (context == null) {
      return;
    }
    final size = context.size;
    if (_oldSize != size) {
      _oldSize = size;
      widget.onSizeChange(size!);
    }
  }
}
