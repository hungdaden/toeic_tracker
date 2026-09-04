import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../utils/extenstion.dart';
import '../common_scrollbar/common_scrollbar.dart';

// ignore: must_be_immutable
/// iOS-only status bar tap detector that scrolls the attached view to top.
class CommonScrollbarWithIosStatusBarTapDetectorV2 extends HookWidget {
  const CommonScrollbarWithIosStatusBarTapDetectorV2({
    required this.child,
    required this.controller,
    this.onStatusBarTap,
    this.thumbVisibility = false,
    this.padding,
    super.key,
  });

  final Widget child;
  final ScrollController controller;
  final VoidCallback? onStatusBarTap;
  final bool thumbVisibility;
  final EdgeInsets? padding;

  void _onStatusBarTap(BuildContext context) {
    if (ModalRoute.of(context)?.isCurrent == true) {
      controller.scrollToTop();
    }
  }

  @override
  Widget build(BuildContext context) {
    VoidCallback? detachCallback;

    useEffect(() {
      if (kIsWeb || !Platform.isIOS) {
        return null;
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Use standard Navigator context instead of custom appNavigatorProvider
        final ctx = Navigator.of(context).context;

        final primaryScrollController = PrimaryScrollController.maybeOf(ctx);
        if (primaryScrollController == null) return;
        final scrollPositionWithSingleContext = _FakeScrollPositionWithSingleContext(
          context: context,
          onStatusBarTap: onStatusBarTap == null
              ? () => _onStatusBarTap(context)
              : () => onStatusBarTap?.call(),
        );
        primaryScrollController.attach(scrollPositionWithSingleContext);

        detachCallback = () {
          primaryScrollController.detach(scrollPositionWithSingleContext);
        };
      });

      return () {
        detachCallback?.call();
      };
    });

    return CommonScrollbarV2(
      controller: controller,
      thumbVisibility: thumbVisibility,
      padding: padding,
      child: child,
    );
  }
}

class _FakeScrollPositionWithSingleContext extends ScrollPositionWithSingleContext {
  _FakeScrollPositionWithSingleContext({
    required BuildContext context,
    this.onStatusBarTap,
  }) : super(
          physics: const NeverScrollableScrollPhysics(),
          context: _FakeScrollContext(context),
        );
  final VoidCallback? onStatusBarTap;

  @override
  Future<void> animateTo(
    double to, {
    required Duration duration,
    required Curve curve,
  }) async =>
      onStatusBarTap?.call();
}

class _FakeScrollContext extends ScrollContext {
  _FakeScrollContext(this._context);

  final BuildContext _context;

  @override
  AxisDirection get axisDirection => AxisDirection.down;

  @override
  BuildContext get notificationContext => _context;

  @override
  void saveOffset(double offset) {}

  @override
  void setCanDrag(bool value) {}

  @override
  void setIgnorePointer(bool value) {}

  @override
  void setSemanticsActions(Set<SemanticsAction> actions) {}

  @override
  BuildContext get storageContext => _context;

  @override
  TickerProvider get vsync => _FakeTickerProvider();

  @override
  double get devicePixelRatio => MediaQuery.devicePixelRatioOf(_context);
}

class _FakeTickerProvider extends TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}
