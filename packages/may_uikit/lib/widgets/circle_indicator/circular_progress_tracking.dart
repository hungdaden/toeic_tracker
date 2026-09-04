import 'package:flutter/material.dart';

import '../../may_uikit.dart';

/// A widget that displays a circular progress indicator alongside progress labels and a title.
class CircularProgressTracking extends StatelessWidget {
  const CircularProgressTracking({
    super.key,
    required this.progress,
    required this.progressLabel,
    required this.progressSubLabel,
    required this.title,
    this.progressTitleColor,
    this.progressSubLabelColor,
    this.titleColor,
  });

  /// The progress ratio, typically between 0.0 and 1.0
  final double progress;

  /// Main label inside or next to the progress (e.g. "12/30")
  final String progressLabel;

  /// Secondary label next to the progress (e.g. "Bữa đã dùng")
  final String progressSubLabel;

  /// Main title of the tracking target (e.g. "Bữa sáng")
  final String title;

  final Color? progressTitleColor;
  final Color? progressSubLabelColor;
  final Color? titleColor;

  /// Builds the widget tree for this progress tracking using [context].
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    return PrimaryContainerV2(
      color: colors.btnBgCriticalOutlineDisable,
      child: Row(
        children: [
          CircleStepIndicatorV2(
            progress: progress,
          ),
          const SizedBox(width: DimensV2.d12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                progressLabel,
                style: AppTextStylesV2.text16Semibold.copyWith(
                  color: progressTitleColor ?? colors.txContentPrimaryDefault,
                ),
              ),
              Text(
                progressSubLabel,
                style: AppTextStylesV2.text13Medium.copyWith(
                  color: progressSubLabelColor ?? colors.txDirectBtn,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
