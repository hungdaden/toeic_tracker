import 'package:flutter/material.dart';
import 'package:may_uikit/resources/styles/app_color.dart';

/// Shared raw scrollbar wrapper with UIKit defaults.
class CommonScrollbarV2 extends StatelessWidget {
  const CommonScrollbarV2({
    required this.child,
    this.controller,
    this.thumbVisibility = false,
    this.padding,
    super.key,
  });

  final Widget child;
  final ScrollController? controller;
  final bool thumbVisibility; // shows a scroll bar indicator to provide a visual indication in test
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      controller: controller,
      padding: padding,
      thumbVisibility: thumbVisibility,
      thickness: 4,
      radius: const Radius.circular(3),
      interactive: true,
      thumbColor: AppColorsV2.neutral500,
      child: child,
    );
  }
}
