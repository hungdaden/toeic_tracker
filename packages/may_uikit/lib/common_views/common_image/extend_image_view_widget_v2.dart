import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:may_uikit/may_uikit.dart';

/// Widget hỗ trợ xem ảnh toàn màn hình,
/// hỗ trợ thu phóng và kéo để đóng.
class ExtendImageViewWidgetV2 extends StatefulWidget {
  /// Khởi tạo [ExtendImageViewWidgetV2].
  const ExtendImageViewWidgetV2({
    required this.url,
    this.minScale = 0.5,
    this.maxScale = 3.0,
    super.key,
    this.fullScreenDoubleTapZoomScale,
    required this.title,
  });

  /// Đường dẫn hình ảnh cần hiển thị.
  final String url;

  /// Tỷ lệ thu nhỏ tối đa. Mặc định là 0.5.
  final double minScale;

  /// Tiêu đề hiển thị ở thanh điều hướng.
  final String title;

  /// Tỷ lệ phóng to tối đa. Mặc định là 3.0.
  final double maxScale;

  /// Tỷ lệ phóng to khi chạm đúp màn hình.
  final double? fullScreenDoubleTapZoomScale;

  /// Tạo state cho [ExtendImageViewWidgetV2].
  @override
  State<ExtendImageViewWidgetV2> createState() => _ExtendImageViewWidgetV2State();
}

class _ExtendImageViewWidgetV2State extends State<ExtendImageViewWidgetV2>
    with TickerProviderStateMixin {
  final TransformationController _transformationController = TransformationController();
  late AnimationController _animationController;
  Animation<Matrix4>? _animation;
  final bool _isFullScreenImageOpened = false;

  late double closingTreshold = MediaQuery.of(context).size.height / 10;

  double _opacity = 1;
  double _imagePosition = 0;
  Duration _animationDuration = Duration.zero;
  Duration _opacityDuration = Duration.zero;
  late double _currentScale = 1;
  TapDownDetails? _doubleTapDownDetails;

  /// Khởi tạo trạng thái ban đầu cho widget.
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    )
      ..addListener(() {
        _transformationController.value = _animation!.value;
        _currentScale = _transformationController.value.getMaxScaleOnAxis();
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // _animationController.reset();
        }
      });
  }

  /// Giải phóng các tài nguyên khi widget bị hủy.
  @override
  void dispose() {
    _animationController.dispose();
    _transformationController.dispose();
    super.dispose();
  }

  /// Xây dựng cấu trúc giao diện cho widget dựa trên [context].
  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic>? route = ModalRoute.of(context);
    final Animation<double>? routeAnimation = route?.animation;

    return AnimatedBuilder(
      animation: routeAnimation ?? const AlwaysStoppedAnimation(1.0),
      builder: (context, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: AppColorsV2.neutral900,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
            systemNavigationBarColor: AppColorsV2.neutral900,
          ),
          child: CommonScaffoldV2(
            backgroundColor: AppColorsV2.neutral900,
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        AnimatedOpacity(
                          duration: _opacityDuration,
                          opacity: _opacity,
                          child: Container(
                            color: AppColorsV2.neutral900,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                          ),
                        ),
                        AnimatedPositioned(
                          duration: _animationDuration,
                          top: _imagePosition + DimensV2.d50,
                          bottom: -_imagePosition,
                          left: 0,
                          right: 0,
                          child: InteractiveViewer(
                            constrained: true,
                            transformationController: _transformationController,
                            minScale: widget.minScale,
                            maxScale: widget.maxScale,
                            onInteractionStart: _onInteractionStart,
                            onInteractionUpdate: _onInteractionUpdate,
                            onInteractionEnd: _onInteractionEnd,
                            child: GestureDetector(
                              onDoubleTapDown: (details) => _doubleTapDownDetails = details,
                              onDoubleTap: _zoomInOut,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: _isFullScreenImageOpened
                                        ? EdgeInsets.zero
                                        : const EdgeInsets.symmetric(horizontal: DimensV2.d8),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(DimensV2.d20),
                                      child: CachedNetworkImage(
                                        imageUrl: widget.url,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: DimensV2.d2,
                          right: 0,
                          child: SafeArea(
                            child: Row(
                              children: [
                                Flexible(
                                  child: InkWell(
                                    onTap: () => Navigator.pop(context),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(DimensV2.d16),
                                          child: Icon(
                                            Icons.arrow_back_ios_new_rounded,
                                            color: AppColorsV2.genericWhite,
                                            size: DimensV2.d20,
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            widget.title,
                                            style: AppTextStylesV2.text18Semibold.copyWith(
                                              color: AppColorsV2.genericWhite,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const SizedBox(width: DimensV2.d16),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _onInteractionStart(ScaleStartDetails details) {
    _currentScale = _transformationController.value.getMaxScaleOnAxis();
    _animationDuration = Duration.zero;
    _opacityDuration = Duration.zero;
  }

  void _onInteractionUpdate(ScaleUpdateDetails details) {
    _currentScale = _transformationController.value.getMaxScaleOnAxis();

    if (details.focalPointDelta.dy < 0 && _imagePosition == 0) {
      return;
    }

    if (details.pointerCount == 1 && _currentScale <= 1.1) {
      setState(() {
        _imagePosition += details.focalPointDelta.dy / 2;

        double scaleFactor = 1 - (_imagePosition / (closingTreshold * 15));
        scaleFactor = scaleFactor.clamp(0.5, 1.0);

        final double screenWidth = MediaQuery.of(context).size.width;
        final double screenHeight = MediaQuery.of(context).size.height;
        final double imageWidth = screenWidth * scaleFactor;
        final double imageHeight = screenHeight * scaleFactor;

        final double offsetX = (screenWidth - imageWidth) / 2;
        final double offsetY = (screenHeight - imageHeight) / 2;

        _transformationController.value = Matrix4.identity()
          ..translate(offsetX, offsetY)
          ..scale(scaleFactor);

        _opacity = (1 - (_imagePosition / closingTreshold)).clamp(0, 1).toDouble();
      });
    }
  }

  void _onInteractionEnd(ScaleEndDetails details) {
    _currentScale = _transformationController.value.getMaxScaleOnAxis();
    setState(() {
      _animationDuration = const Duration(milliseconds: 300);
    });

    if (_imagePosition > closingTreshold) {
      setState(() {
        _imagePosition = MediaQuery.of(context).size.height;
      });
      Navigator.of(context).pop();
    } else {
      setState(() {
        _imagePosition = 0;
        _opacity = 1;
        _opacityDuration = const Duration(milliseconds: 300);
      });
    }
  }

  void _zoomInOut() {
    final Offset tapPosition = _doubleTapDownDetails!.localPosition;
    final double zoomScale = widget.fullScreenDoubleTapZoomScale ?? widget.maxScale;

    final double x = -tapPosition.dx * (zoomScale - 1);
    final double y = -tapPosition.dy * (zoomScale - 1);

    final Matrix4 zoomedMatrix = Matrix4.identity()
      ..translate(x, y)
      ..scale(zoomScale);

    final Matrix4 widgetMatrix =
        _transformationController.value.isIdentity() ? zoomedMatrix : Matrix4.identity();

    _animation = Matrix4Tween(
      begin: _transformationController.value,
      end: widgetMatrix,
    ).animate(
      CurveTween(curve: Curves.easeOut).animate(_animationController),
    );

    _animationController.forward(from: 0);
    _currentScale = _transformationController.value.isIdentity() ? zoomScale : widget.minScale;
  }
}
