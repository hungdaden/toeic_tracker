import 'package:flutter/material.dart';

/// Shared centered loading indicator.
class CommonProgressIndicatorV2 extends StatelessWidget {
  const CommonProgressIndicatorV2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
