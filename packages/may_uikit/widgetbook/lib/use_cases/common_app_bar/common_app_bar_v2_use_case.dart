import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

const String _kReplayButtonLabel = 'Replay';

@UseCase(
  name: 'Playground',
  type: CommonAppBarV2,
)

/// Builds the playground used by Widgetbook to exercise the
/// [HeaderColorCurtainRevealV2] effect of [CommonAppBarV2].
Widget commonAppBarV2UseCase(BuildContext context) {
  final enableHeaderColorReveal = context.knobs.boolean(
    label: 'Enable header color reveal',
    initialValue: true,
  );
  final revealDurationMs = context.knobs.int.slider(
    label: 'Reveal duration (ms)',
    initialValue: 600,
    min: 200,
    max: 1500,
  );

  return _CommonAppBarV2Host(
    enableHeaderColorReveal: enableHeaderColorReveal,
    revealDurationMs: revealDurationMs,
  );
}

/// Stateful host that owns a [ValueKey] counter to force a re-mount of the
/// underlying [CommonAppBarV2] (and therefore a re-trigger of the curtain
/// reveal animation) when the user taps the "Replay" button.
class _CommonAppBarV2Host extends StatefulWidget {
  const _CommonAppBarV2Host({
    required this.enableHeaderColorReveal,
    required this.revealDurationMs,
  });

  final bool enableHeaderColorReveal;
  final int revealDurationMs;

  /// Creates the mutable state for this widget.
  @override
  State<_CommonAppBarV2Host> createState() => _CommonAppBarV2HostState();
}

class _CommonAppBarV2HostState extends State<_CommonAppBarV2Host> {
  int _replayKey = 0;

  /// Builds the demo screen with a tappable "Replay" button that bumps
  /// [_replayKey] to force the underlying [CommonAppBarV2] to re-mount and
  /// re-play the curtain-reveal animation.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    return Scaffold(
      backgroundColor: colors.background,
      body: Stack(
        children: [
          Positioned.fill(
            // Re-key the whole app bar so the curtain reveal animation
            // re-runs from scratch on every Replay tap.
            child: CommonAppBarV2(
              key: ValueKey(
                'appbar_$_replayKey'
                '_${widget.enableHeaderColorReveal}'
                '_${widget.revealDurationMs}',
              ),
              title: 'Nhận xét tuần',
              body: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacingV2.lg,
                  AppSpacingV2.x4l,
                  AppSpacingV2.lg,
                  AppSpacingV2.lg,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Curtain Reveal Demo',
                      style: AppTextStylesV2.title1SemiBold.copyWith(
                        color: colors.primaryText,
                      ),
                    ),
                    const SizedBox(height: AppSpacingV2.sm),
                    Text(
                      widget.enableHeaderColorReveal
                          ? 'Animation: ON. Tap "Replay" to re-trigger.\n'
                              'The header color wipes down from the top of '
                              'the screen on screen entry.'
                          : 'Animation: OFF. Toggle the "Enable header color '
                              'reveal" knob and tap "Replay" to see the '
                              'wipe-down curtain effect.',
                      style: AppTextStylesV2.bodyRegular.copyWith(
                        color: colors.secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: AppSpacingV2.lg,
            right: AppSpacingV2.lg,
            bottom: AppSpacingV2.lg,
            child: SafeArea(
              top: false,
              child: AppButtonV2(
                type: ButtonType.primary,
                size: ButtonSize.medium,
                onTap: () {
                  setState(() {
                    _replayKey++;
                  });
                },
                child: const Text(_kReplayButtonLabel),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
