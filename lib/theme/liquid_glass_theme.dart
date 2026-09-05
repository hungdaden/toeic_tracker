import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Apple iOS Liquid Glass Theme Tokens and Utilities
class LiquidGlassTheme {
  const LiquidGlassTheme._();

  // Core Apple Dark Obsidian Canvas
  static const Color background = Color(0xFF090D16);
  static const Color backgroundSecondary = Color(0xFF0E1424);
  static const Color surfaceGlass = Color(0x1AFFFFFF); // White 10%
  static const Color surfaceGlassHeavy = Color(0x331E293B); // Dark slate 20%
  static const Color surfaceGlassLight = Color(0x2EFFFFFF); // White 18%

  // Borders & Specular Edges
  static const Color glassBorder = Color(0x26FFFFFF); // 15% white
  static const Color glassBorderLight = Color(0x40FFFFFF); // 25% white
  static const Color glassBorderSubtle = Color(0x14FFFFFF); // 8% white

  // Accent Brand Colors
  static const Color primaryAccent = Color(0xFF6366F1); // Indigo
  static const Color secondaryAccent = Color(0xFF06B6D4); // Cyan
  static const Color purpleAccent = Color(0xFFA855F7); // Purple
  static const Color emeraldAccent = Color(0xFF10B981); // Emerald Green
  static const Color amberAccent = Color(0xFFF59E0B); // Amber Fire
  static const Color roseAccent = Color(0xFFF43F5E); // Rose

  // TOEIC Specific Colors
  static const Color scoreTotal = Color(0xFF10B981);
  static const Color scoreListening = Color(0xFF38BDF8);
  static const Color scoreReading = Color(0xFFFB923C);
  static const Color scoreSpeaking = Color(0xFFA855F7);
  static const Color scoreWriting = Color(0xFFF43F5E);
  static const Color streakFire = Color(0xFFF97316);

  // iOS Glass Gradients
  static const LinearGradient glassSurfaceGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xEA111827),
      Color(0xF50F172A),
    ],
    stops: [0.0, 1.0],
  );

  static const LinearGradient glassCardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF161F33),
      Color(0xFF0F172A),
    ],
  );

  static const LinearGradient primaryButtonGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF6366F1),
      Color(0xFF4F46E5),
    ],
  );

  static const LinearGradient fireGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFF7A00),
      Color(0xFFFF3D00),
    ],
  );

  // Glass Specular Border Gradient
  static const LinearGradient borderHighlightGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0x4DFFFFFF),
      Color(0x0DFFFFFF),
      Color(0x26FFFFFF),
    ],
    stops: [0.0, 0.5, 1.0],
  );

  // Shadows
  static List<BoxShadow> get cardShadow => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.35),
          blurRadius: 24,
          offset: const Offset(0, 8),
        ),
        BoxShadow(
          color: primaryAccent.withValues(alpha: 0.05),
          blurRadius: 16,
          offset: const Offset(0, 2),
        ),
      ];

  static List<BoxShadow> get floatingDockShadow => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.5),
          blurRadius: 30,
          spreadRadius: 2,
          offset: const Offset(0, 12),
        ),
        BoxShadow(
          color: primaryAccent.withValues(alpha: 0.18),
          blurRadius: 20,
          offset: const Offset(0, 4),
        ),
      ];

  /// Calculates the top offset needed for screen content or scroll views
  /// when the body extends behind the AppBar and status bar.
  /// Matches UIKit's `appBarContentTop` (`paddingTop + kToolbarHeight`) plus comfortable spacing.
  static double getAppBarContentTop(
    BuildContext context, [
    double extraSpacing = 12.0,
    double? customAppBarHeight,
  ]) {
    final statusBar = MediaQuery.paddingOf(context).top;
    final barHeight = customAppBarHeight ?? kToolbarHeight;
    return statusBar + barHeight + extraSpacing;
  }

  /// Calculates the bottom padding needed for floating action buttons
  /// so they sit closely (5-7px) above [FloatingBottomBarV2] without being obstructed.
  static double getFloatingButtonBottomPadding(
    BuildContext context, [
    double extraOffset = 0.0,
  ]) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final isIos = !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;

    final double basePadding;
    if (isIos) {
      // In FloatingBottomBarV2 on iOS: bottom padding is fixed 24.0, height 56.0 -> top of bar is 80.0.
      // Scaffold's endFloat places FAB at (bottomInset + 16.0).
      // To place FAB bottom at exactly 86.0 (6px above bar):
      // basePadding = 86.0 - (bottomInset + 16.0) = 70.0 - bottomInset.
      // On iPhone (bottomInset = 34): 70 - 34 = 36.0.
      // Total from screen bottom: 34 + 16 + 36 = 86.0 -> exactly 6px above bar (80.0).
      basePadding = (70.0 - bottomInset).clamp(10.0, 70.0);
    } else if (bottomInset > 0) {
      // On Android with gesture nav: FloatingBottomBarV2 top is bottomInset + 12.0 + 56.0 = bottomInset + 68.0.
      // Scaffold's endFloat places FAB at (bottomInset + 16.0).
      // To place FAB bottom at (bottomInset + 74.0) (6px above bar):
      // basePadding = (bottomInset + 74.0) - (bottomInset + 16.0) = 58.0.
      basePadding = 58.0;
    } else {
      // No inset: top of bar is 80.0.
      // Scaffold's endFloat places FAB at 16.0.
      // To place FAB bottom at 86.0 (6px above bar):
      // basePadding = 86.0 - 16.0 = 70.0.
      basePadding = 70.0;
    }

    return (basePadding + extraOffset).clamp(0.0, 120.0);
  }
}

/// A full-screen ambient canvas that injects soft, glowing colorful orbs
/// behind frosted glass surfaces so they refract light with rich depth.
class LiquidGlassScaffoldWrapper extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final bool autoApplyTopPadding;

  const LiquidGlassScaffoldWrapper({
    super.key,
    required this.child,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.extendBody = true,
    this.extendBodyBehindAppBar = true,
    this.autoApplyTopPadding = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LiquidGlassTheme.background,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: bottomNavigationBar,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background ambient light orbs
          const Positioned(
            top: -120,
            left: -80,
            child: _AmbientGlowOrb(
              color: Color(0xFF4F46E5),
              diameter: 340,
              opacity: 0.22,
            ),
          ),
          const Positioned(
            top: 100,
            right: -100,
            child: _AmbientGlowOrb(
              color: Color(0xFF06B6D4),
              diameter: 300,
              opacity: 0.16,
            ),
          ),
          const Positioned(
            bottom: 80,
            left: -60,
            child: _AmbientGlowOrb(
              color: Color(0xFF8B5CF6),
              diameter: 320,
              opacity: 0.14,
            ),
          ),
          const Positioned(
            bottom: -80,
            right: -40,
            child: _AmbientGlowOrb(
              color: Color(0xFF10B981),
              diameter: 280,
              opacity: 0.12,
            ),
          ),
          // Subtle dark overlay to keep high contrast for text
          Positioned.fill(
            child: ColoredBox(
              color: Colors.black.withValues(alpha: 0.25),
            ),
          ),
          // Screen child
          autoApplyTopPadding
              ? Padding(
                  padding: EdgeInsets.only(
                    top: LiquidGlassTheme.getAppBarContentTop(
                      context,
                      0,
                      appBar?.preferredSize.height,
                    ),
                  ),
                  child: child,
                )
              : child,
        ],
      ),
    );
  }
}

class _AmbientGlowOrb extends StatelessWidget {
  final Color color;
  final double diameter;
  final double opacity;

  const _AmbientGlowOrb({
    required this.color,
    required this.diameter,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              color.withValues(alpha: opacity),
              color.withValues(alpha: opacity * 0.4),
              Colors.transparent,
            ],
            stops: const [0.0, 0.45, 1.0],
          ),
        ),
      ),
    );
  }
}

/// An iOS Liquid Glass Container with backdrop filter, specular border,
/// and smooth curved corners.
class LiquidGlassContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double blurSigma;
  final Color? surfaceColor;
  final Color? borderColor;
  final double borderWidth;
  final Gradient? gradient;
  final List<BoxShadow>? shadows;
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  const LiquidGlassContainer({
    super.key,
    required this.child,
    this.borderRadius = 22.0,
    this.padding = const EdgeInsets.all(16.0),
    this.margin,
    this.blurSigma = 18.0,
    this.surfaceColor,
    this.borderColor,
    this.borderWidth = 1.0,
    this.gradient,
    this.shadows,
    this.onTap,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveRadius = BorderRadius.circular(borderRadius);

    Widget container = Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: effectiveRadius,
        boxShadow: shadows ?? LiquidGlassTheme.cardShadow,
      ),
      child: ClipRRect(
        borderRadius: effectiveRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: effectiveRadius,
              color: gradient != null ? null : surfaceColor,
              gradient: gradient ?? (surfaceColor == null ? LiquidGlassTheme.glassSurfaceGradient : null),
              border: Border.all(
                color: borderColor ?? LiquidGlassTheme.glassBorder,
                width: borderWidth,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );

    if (onTap != null) {
      container = GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: container,
      );
    }

    return container;
  }
}

/// A compact Liquid Glass Chip for scores and tags.
class LiquidGlassChip extends StatelessWidget {
  final String label;
  final String? value;
  final Color accentColor;
  final IconData? icon;
  final VoidCallback? onTap;

  const LiquidGlassChip({
    super.key,
    required this.label,
    this.value,
    required this.accentColor,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: accentColor.withValues(alpha: 0.12),
              border: Border.all(
                color: accentColor.withValues(alpha: 0.35),
                width: 1.0,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 14, color: accentColor),
                  const SizedBox(width: 6),
                ],
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.85),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (value != null) ...[
                  const SizedBox(width: 6),
                  Text(
                    value!,
                    style: TextStyle(
                      color: accentColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
