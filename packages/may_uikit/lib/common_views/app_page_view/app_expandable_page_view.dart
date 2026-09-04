import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'app_size_reporting_widget.dart';

/// Hàm builder tạo widget cho mỗi trang trong [AppExpandablePageViewV2].
typedef WidgetBuilderAEPV = Widget Function(BuildContext context, int index);

/// Widget PageView tự động co giãn kích thước
/// theo chiều cao/rộng của trang hiện tại.
class AppExpandablePageViewV2 extends StatefulWidget {
  /// Danh sách các widget hiển thị.
  final List<Widget>? children;

  /// Số lượng trang hiển thị.
  final int? itemCount;

  /// Hàm builder để tạo widget tương ứng với chỉ mục [index].
  final WidgetBuilderAEPV? itemBuilder;

  /// Controller điều khiển vị trí cuộn trang.
  final PageController? controller;

  /// Callback được gọi khi trang chính giữa viewport thay đổi.
  final ValueChanged<int>? onPageChanged;

  /// Cuộn trang theo chiều ngược lại hay không.
  final bool reverse;

  /// Khoảng thời gian thực hiện hiệu ứng thay đổi kích thước.
  final Duration animationDuration;

  /// Curve chuyển động thay đổi kích thước.
  final Curve animationCurve;

  /// Scroll physics định nghĩa cách thức cuộn.
  final ScrollPhysics? physics;

  /// Cho phép snap trang khi cuộn hay không.
  final bool pageSnapping;

  /// Cấu hình hành vi khi bắt đầu kéo/kéo thả trang.
  final DragStartBehavior dragStartBehavior;

  /// Cho phép tự động cuộn hỗ trợ người khuyết tật hay không.
  final bool allowImplicitScrolling;

  /// ID phục hồi trạng thái cuộn offset.
  final String? restorationId;

  /// Cách thức clip nội dung.
  final Clip clipBehavior;

  /// Có thực hiện hiệu ứng cho trang đầu tiên hiển thị hay không.
  final bool animateFirstPage;

  /// Căn lề của nội dung bên trong khi thực hiện hiệu ứng.
  final Alignment alignment;

  /// Kích thước ước lượng ban đầu của các trang.
  final double estimatedPageSize;

  /// Scroll behavior tùy chỉnh riêng biệt cho widget này.
  final ScrollBehavior? scrollBehavior;

  /// Hướng cuộn trang (ngang hoặc dọc).
  final Axis scrollDirection;

  /// Có tự động thêm padding hai đầu trang hay không.
  final bool padEnds;

  /// Khởi tạo [AppExpandablePageViewV2] với danh sách con [children].
  const AppExpandablePageViewV2({
    required this.children,
    this.controller,
    this.onPageChanged,
    this.reverse = false,
    this.animationDuration = const Duration(milliseconds: 100),
    this.animationCurve = Curves.decelerate,
    this.physics,
    this.pageSnapping = true,
    this.dragStartBehavior = DragStartBehavior.start,
    this.allowImplicitScrolling = false,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
    this.animateFirstPage = false,
    this.estimatedPageSize = 0.0,
    this.alignment = Alignment.bottomCenter,
    this.scrollBehavior,
    this.scrollDirection = Axis.horizontal,
    this.padEnds = true,
    super.key,
  })  : assert(estimatedPageSize >= 0.0),
        itemBuilder = null,
        itemCount = null;

  /// Khởi tạo [AppExpandablePageViewV2] theo cơ chế builder lazy-loaded.
  const AppExpandablePageViewV2.builder({
    required this.itemCount,
    required this.itemBuilder,
    this.controller,
    this.onPageChanged,
    this.reverse = false,
    this.animationDuration = const Duration(milliseconds: 100),
    this.animationCurve = Curves.decelerate,
    this.physics,
    this.pageSnapping = true,
    this.dragStartBehavior = DragStartBehavior.start,
    this.allowImplicitScrolling = false,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
    this.animateFirstPage = false,
    this.estimatedPageSize = 0.0,
    this.alignment = Alignment.bottomCenter,
    this.scrollBehavior,
    this.scrollDirection = Axis.horizontal,
    this.padEnds = true,
    super.key,
  })  : assert(estimatedPageSize >= 0.0),
        children = null;

  @override

  /// Tạo state cho [AppExpandablePageViewV2].
  State<AppExpandablePageViewV2> createState() => _AppExpandablePageViewV2State();
}

class _AppExpandablePageViewV2State extends State<AppExpandablePageViewV2> {
  late PageController _pageController;
  late List<double> _sizes;
  int _currentPage = 0;
  int _previousPage = 0;
  bool _shouldDisposePageController = false;
  bool _firstPageLoaded = false;

  double get _currentSize {
    final size = _sizes[_currentPage];
    if (size == 0.0) {
      return _previousSize;
    }
    return size;
  }

  double get _previousSize => _sizes[_previousPage];

  bool get isBuilder => widget.itemBuilder != null;

  bool get _isHorizontalScroll => widget.scrollDirection == Axis.horizontal;

  @override

  /// Khởi tạo trạng thái cho widget.
  void initState() {
    super.initState();
    _sizes = _prepareSizes();
    _pageController = widget.controller ?? PageController();
    _pageController.addListener(_updatePage);
    _currentPage = _pageController.initialPage.clamp(0, _sizes.length - 1);
    _previousPage = _currentPage - 1 < 0 ? 0 : _currentPage - 1;
    _shouldDisposePageController = widget.controller == null;
  }

  @override

  /// Cập nhật widget khi có thay đổi cấu hình từ widget cha [oldWidget].
  void didUpdateWidget(covariant AppExpandablePageViewV2 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller?.removeListener(_updatePage);
      _pageController = widget.controller ?? PageController();
      _pageController.addListener(_updatePage);
      _shouldDisposePageController = widget.controller == null;
    }
    if (_shouldReinitializeHeights(oldWidget)) {
      _reinitializeSizes();
    }
  }

  @override

  /// Giải phóng tài nguyên được sử dụng bởi widget.
  void dispose() {
    _pageController.removeListener(_updatePage);
    if (_shouldDisposePageController) {
      _pageController.dispose();
    }
    super.dispose();
  }

  @override

  /// Xây dựng giao diện cho widget sử dụng [context].
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      curve: widget.animationCurve,
      duration: _getDuration(),
      tween: Tween<double>(begin: _previousSize, end: _currentSize),
      builder: (context, value, child) => SizedBox(
        height: _isHorizontalScroll ? value : null,
        width: !_isHorizontalScroll ? value : null,
        child: child,
      ),
      child: _buildPageView(),
    );
  }

  bool _shouldReinitializeHeights(AppExpandablePageViewV2 oldWidget) {
    if (oldWidget.itemBuilder != null && isBuilder) {
      return oldWidget.itemCount != widget.itemCount;
    }
    return oldWidget.children?.length != widget.children?.length;
  }

  void _reinitializeSizes() {
    final currentPageSize = _sizes[_currentPage];
    _sizes = _prepareSizes();

    if (_currentPage >= _sizes.length) {
      final differenceFromPreviousToCurrent = _previousPage - _currentPage;
      _currentPage = _sizes.length - 1;
      widget.onPageChanged?.call(_currentPage);

      _previousPage = (_currentPage + differenceFromPreviousToCurrent).clamp(0, _sizes.length - 1);
    }

    _previousPage = _previousPage.clamp(0, _sizes.length - 1);
    _sizes[_currentPage] = currentPageSize;
  }

  Duration _getDuration() {
    if (_firstPageLoaded) {
      return widget.animationDuration;
    }
    return widget.animateFirstPage ? widget.animationDuration : Duration.zero;
  }

  Widget _buildPageView() {
    if (isBuilder) {
      return PageView.builder(
        controller: _pageController,
        itemBuilder: _itemBuilder,
        itemCount: widget.itemCount,
        onPageChanged: widget.onPageChanged,
        reverse: widget.reverse,
        physics: widget.physics,
        pageSnapping: widget.pageSnapping,
        dragStartBehavior: widget.dragStartBehavior,
        allowImplicitScrolling: widget.allowImplicitScrolling,
        restorationId: widget.restorationId,
        clipBehavior: widget.clipBehavior,
        scrollBehavior: widget.scrollBehavior,
        scrollDirection: widget.scrollDirection,
        padEnds: widget.padEnds,
      );
    }
    return PageView(
      controller: _pageController,
      onPageChanged: widget.onPageChanged,
      reverse: widget.reverse,
      physics: widget.physics,
      pageSnapping: widget.pageSnapping,
      dragStartBehavior: widget.dragStartBehavior,
      allowImplicitScrolling: widget.allowImplicitScrolling,
      restorationId: widget.restorationId,
      clipBehavior: widget.clipBehavior,
      scrollBehavior: widget.scrollBehavior,
      scrollDirection: widget.scrollDirection,
      padEnds: widget.padEnds,
      children: _sizeReportingChildren(),
    );
  }

  List<double> _prepareSizes() {
    if (isBuilder) {
      return List.filled(widget.itemCount!, widget.estimatedPageSize);
    } else {
      return widget.children!.map((child) => widget.estimatedPageSize).toList();
    }
  }

  void _updatePage() {
    final newPage = _pageController.page!.round();
    if (_currentPage != newPage) {
      setState(() {
        _firstPageLoaded = true;
        _previousPage = _currentPage;
        _currentPage = newPage;
      });
    }
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final item = widget.itemBuilder!(context, index);
    return OverflowPage(
      onSizeChange: (size) => setState(
        () => _sizes[index] = _isHorizontalScroll ? size.height : size.width,
      ),
      alignment: widget.alignment,
      scrollDirection: widget.scrollDirection,
      child: item,
    );
  }

  List<Widget> _sizeReportingChildren() => widget.children!
      .asMap()
      .map(
        (index, child) => MapEntry(
          index,
          OverflowPage(
            onSizeChange: (size) => setState(
              () => _sizes[index] = _isHorizontalScroll ? size.height : size.width,
            ),
            alignment: widget.alignment,
            scrollDirection: widget.scrollDirection,
            child: child,
          ),
        ),
      )
      .values
      .toList();
}

/// Trang phụ trợ xử lý báo cáo kích thước tràn vùng chứa.
class OverflowPage extends StatelessWidget {
  /// Callback khi kích thước trang thay đổi.
  final ValueChanged<Size> onSizeChange;

  /// Widget nội dung trang.
  final Widget child;

  /// Căn lề của nội dung bên trong.
  final Alignment alignment;

  /// Hướng cuộn trang.
  final Axis scrollDirection;

  /// Khởi tạo [OverflowPage].
  const OverflowPage({
    required this.onSizeChange,
    required this.child,
    required this.alignment,
    required this.scrollDirection,
    super.key,
  });

  @override

  /// Xây dựng giao diện cho trang tràn sử dụng [context].
  Widget build(BuildContext context) {
    return OverflowBox(
      minHeight: scrollDirection == Axis.horizontal ? 0 : null,
      minWidth: scrollDirection == Axis.vertical ? 0 : null,
      maxHeight: scrollDirection == Axis.horizontal ? double.infinity : null,
      maxWidth: scrollDirection == Axis.vertical ? double.infinity : null,
      alignment: alignment,
      child: AppSizeReportingWidgetV2(
        onSizeChange: onSizeChange,
        child: child,
      ),
    );
  }
}
