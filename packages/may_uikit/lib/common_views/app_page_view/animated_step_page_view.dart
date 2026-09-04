import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'app_expandable_page_view.dart';

/// Các kiểu hiệu ứng chuyển trang khi vuốt giữa các bước.
enum PageTransitionTypeV2 {
  /// Không dùng hiệu ứng chuyển trang.
  none,

  /// Hiệu ứng kết hợp phóng to/thu nhỏ và làm mờ.
  scaleFade,

  /// Hiệu ứng làm mờ đơn thuần.
  fade,

  /// Hiệu ứng trượt từ dưới lên.
  slideUp,
}

/// Widget PageView hỗ trợ hiệu ứng chuyển tiếp tùy chỉnh và tự động co giãn.
class AnimatedStepPageViewV2 extends StatefulWidget {
  /// Danh sách các widget hiển thị.
  final List<Widget>? children;

  /// Số lượng trang hiển thị.
  final int? itemCount;

  /// Hàm builder để tạo widget tương ứng với chỉ mục [index].
  final Widget Function(BuildContext, int)? itemBuilder;

  /// Controller điều khiển vị trí cuộn trang.
  final PageController? controller;

  /// Callback được gọi khi trang hiển thị thay đổi.
  final ValueChanged<int>? onPageChanged;

  /// Cuộn ngược hướng đọc hay không.
  final bool reverse;

  /// Thiết lập scroll physics.
  final ScrollPhysics? physics;

  /// Cho phép snap trang khi cuộn hay không.
  final bool pageSnapping;

  /// Hành vi drag start.
  final DragStartBehavior dragStartBehavior;

  /// Cho phép cuộn hỗ trợ người khuyết tật hay không.
  final bool allowImplicitScrolling;

  /// ID phục hồi trạng thái cuộn.
  final String? restorationId;

  /// Cách thức clip nội dung.
  final Clip clipBehavior;

  /// Thiết lập scroll behavior.
  final ScrollBehavior? scrollBehavior;

  /// Hướng cuộn trang.
  final Axis scrollDirection;

  /// Có thêm padding ở hai đầu trang hay không.
  final bool padEnds;

  /// Kiểu hiệu ứng chuyển tiếp giữa các bước.
  /// Mặc định là [PageTransitionTypeV2.scaleFade].
  final PageTransitionTypeV2 pageTransitionType;

  /// Hệ số co giãn khi chuyển tiếp (từ 0.0 đến 1.0). Mặc định là 0.3.
  final double scaleFactor;

  /// Độ mờ tối thiểu của các trang nằm ngoài tiêu điểm (từ 0.0 đến 1.0).
  /// Mặc định là 0.5.
  final double minOpacity;

  /// Tỷ lệ thu phóng tối thiểu (từ 0.0 đến 1.0). Mặc định là 0.95.
  final double minScale;

  /// Độ lệch dịch chuyển dọc đối với hiệu ứng [PageTransitionTypeV2.slideUp].
  /// Mặc định là 0.1.
  final double slideOffset;

  /// Bật/tắt tính năng tự động điều chỉnh chiều cao của PageView
  /// theo nội dung trang hiện tại.
  final bool enableExpandable;

  /// Khoảng thời gian thực hiện hiệu ứng co giãn chiều cao.
  final Duration animationDuration;

  /// Curve chuyển động thay đổi chiều cao.
  final Curve animationCurve;

  /// Thực hiện hiệu ứng cho trang đầu tiên hiển thị hay không.
  final bool animateFirstPage;

  /// Kích thước trang ước tính ban đầu.
  final double estimatedPageSize;

  /// Căn lề nội dung khi co giãn.
  final Alignment alignment;

  /// Khởi tạo [AnimatedStepPageViewV2] với danh sách trang [children].
  const AnimatedStepPageViewV2({
    required this.children,
    this.controller,
    this.onPageChanged,
    this.reverse = false,
    this.physics,
    this.pageSnapping = true,
    this.dragStartBehavior = DragStartBehavior.start,
    this.allowImplicitScrolling = false,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
    this.scrollBehavior,
    this.scrollDirection = Axis.horizontal,
    this.padEnds = true,
    this.pageTransitionType = PageTransitionTypeV2.scaleFade,
    this.scaleFactor = 0.3,
    this.minOpacity = 0.5,
    this.minScale = 0.95,
    this.slideOffset = 0.1,
    this.enableExpandable = false,
    this.animationDuration = const Duration(milliseconds: 100),
    this.animationCurve = Curves.decelerate,
    this.animateFirstPage = false,
    this.estimatedPageSize = 0.0,
    this.alignment = Alignment.bottomCenter,
    super.key,
  })  : assert(scaleFactor >= 0.0 && scaleFactor <= 1.0),
        assert(minOpacity >= 0.0 && minOpacity <= 1.0),
        assert(minScale >= 0.0 && minScale <= 1.0),
        itemBuilder = null,
        itemCount = null;

  /// Khởi tạo [AnimatedStepPageViewV2] bằng cơ chế builder lazy-loaded.
  const AnimatedStepPageViewV2.builder({
    required this.itemCount,
    required this.itemBuilder,
    this.controller,
    this.onPageChanged,
    this.reverse = false,
    this.physics,
    this.pageSnapping = true,
    this.dragStartBehavior = DragStartBehavior.start,
    this.allowImplicitScrolling = false,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
    this.scrollBehavior,
    this.scrollDirection = Axis.horizontal,
    this.padEnds = true,
    this.pageTransitionType = PageTransitionTypeV2.scaleFade,
    this.scaleFactor = 0.3,
    this.minOpacity = 0.5,
    this.minScale = 0.95,
    this.slideOffset = 0.1,
    this.enableExpandable = false,
    this.animationDuration = const Duration(milliseconds: 100),
    this.animationCurve = Curves.decelerate,
    this.animateFirstPage = false,
    this.estimatedPageSize = 0.0,
    this.alignment = Alignment.bottomCenter,
    super.key,
  })  : assert(scaleFactor >= 0.0 && scaleFactor <= 1.0),
        assert(minOpacity >= 0.0 && minOpacity <= 1.0),
        assert(minScale >= 0.0 && minScale <= 1.0),
        children = null;

  @override
  /// Tạo state cho [AnimatedStepPageViewV2].
  State<AnimatedStepPageViewV2> createState() => _AnimatedStepPageViewV2State();
}

class _AnimatedStepPageViewV2State extends State<AnimatedStepPageViewV2> {
  late PageController _pageController;
  bool _shouldDisposePageController = false;

  bool get isBuilder => widget.itemBuilder != null;

  @override
  /// Khởi tạo trạng thái cho widget.
  void initState() {
    super.initState();
    _pageController = widget.controller ?? PageController();
    _shouldDisposePageController = widget.controller == null;
  }

  @override
  /// Cập nhật widget khi có thay đổi cấu hình từ widget cha [oldWidget].
  void didUpdateWidget(covariant AnimatedStepPageViewV2 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      _pageController = widget.controller ?? PageController();
      _shouldDisposePageController = widget.controller == null;
    }
  }

  @override
  /// Giải phóng tài nguyên được sử dụng bởi widget.
  void dispose() {
    if (_shouldDisposePageController) {
      _pageController.dispose();
    }
    super.dispose();
  }

  @override
  /// Xây dựng giao diện cho widget sử dụng [context].
  Widget build(BuildContext context) {
    if (widget.enableExpandable) {
      return _buildExpandablePageView();
    }
    return _buildStandardPageView();
  }

  Widget _buildExpandablePageView() {
    if (isBuilder) {
      return AppExpandablePageViewV2.builder(
        itemCount: widget.itemCount!,
        itemBuilder: (context, index) => _buildAnimatedPage(
          widget.itemBuilder!(context, index),
          index,
        ),
        controller: _pageController,
        onPageChanged: widget.onPageChanged,
        reverse: widget.reverse,
        animationDuration: widget.animationDuration,
        animationCurve: widget.animationCurve,
        physics: widget.physics,
        pageSnapping: widget.pageSnapping,
        dragStartBehavior: widget.dragStartBehavior,
        allowImplicitScrolling: widget.allowImplicitScrolling,
        restorationId: widget.restorationId,
        clipBehavior: widget.clipBehavior,
        animateFirstPage: widget.animateFirstPage,
        estimatedPageSize: widget.estimatedPageSize,
        alignment: widget.alignment,
        scrollBehavior: widget.scrollBehavior,
        scrollDirection: widget.scrollDirection,
        padEnds: widget.padEnds,
      );
    }

    return AppExpandablePageViewV2(
      controller: _pageController,
      onPageChanged: widget.onPageChanged,
      reverse: widget.reverse,
      animationDuration: widget.animationDuration,
      animationCurve: widget.animationCurve,
      physics: widget.physics,
      pageSnapping: widget.pageSnapping,
      dragStartBehavior: widget.dragStartBehavior,
      allowImplicitScrolling: widget.allowImplicitScrolling,
      restorationId: widget.restorationId,
      clipBehavior: widget.clipBehavior,
      animateFirstPage: widget.animateFirstPage,
      estimatedPageSize: widget.estimatedPageSize,
      alignment: widget.alignment,
      scrollBehavior: widget.scrollBehavior,
      scrollDirection: widget.scrollDirection,
      padEnds: widget.padEnds,
      children: widget.children!
          .asMap()
          .entries
          .map((entry) => _buildAnimatedPage(entry.value, entry.key))
          .toList(),
    );
  }

  Widget _buildStandardPageView() {
    if (isBuilder) {
      return PageView.builder(
        controller: _pageController,
        itemCount: widget.itemCount,
        itemBuilder: (context, index) => _buildAnimatedPage(
          widget.itemBuilder!(context, index),
          index,
        ),
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
      children: widget.children!
          .asMap()
          .entries
          .map((entry) => _buildAnimatedPage(entry.value, entry.key))
          .toList(),
    );
  }

  Widget _buildAnimatedPage(Widget child, int index) {
    if (widget.pageTransitionType == PageTransitionTypeV2.none) {
      return child;
    }

    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, animatedChild) {
        double pageOffset = 0.0;

        if (_pageController.position.haveDimensions) {
          pageOffset = ((_pageController.page ?? 0) - index).abs();
        }

        return _applyTransition(animatedChild!, pageOffset);
      },
      child: child,
    );
  }

  Widget _applyTransition(Widget child, double pageOffset) {
    switch (widget.pageTransitionType) {
      case PageTransitionTypeV2.scaleFade:
        return _buildScaleFadeTransition(child, pageOffset);
      case PageTransitionTypeV2.fade:
        return _buildFadeTransition(child, pageOffset);
      case PageTransitionTypeV2.slideUp:
        return _buildSlideUpTransition(child, pageOffset);
      case PageTransitionTypeV2.none:
        return child;
    }
  }

  Widget _buildScaleFadeTransition(Widget child, double pageOffset) {
    final scale = (1 - (pageOffset * widget.scaleFactor)).clamp(widget.minScale, 1.0);

    final opacity = (1 - (pageOffset * widget.scaleFactor)).clamp(widget.minOpacity, 1.0);

    return Opacity(
      opacity: opacity,
      child: Transform.scale(
        scale: scale,
        child: child,
      ),
    );
  }

  Widget _buildFadeTransition(Widget child, double pageOffset) {
    final opacity = (1 - (pageOffset * widget.scaleFactor)).clamp(widget.minOpacity, 1.0);

    return Opacity(
      opacity: opacity,
      child: child,
    );
  }

  Widget _buildSlideUpTransition(Widget child, double pageOffset) {
    final opacity = (1 - (pageOffset * widget.scaleFactor)).clamp(widget.minOpacity, 1.0);

    final slideY = pageOffset * widget.slideOffset;

    return Opacity(
      opacity: opacity,
      child: Transform.translate(
        offset: Offset(0, slideY * 100), // Quy đổi ra pixel
        child: child,
      ),
    );
  }
}
