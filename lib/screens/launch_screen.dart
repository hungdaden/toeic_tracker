import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:may_uikit/may_uikit.dart';
import '../theme/liquid_glass_theme.dart';

class LaunchScreen extends StatefulWidget {
  final VoidCallback? onFinish;
  final Duration duration;

  const LaunchScreen({
    super.key,
    this.onFinish,
    this.duration = const Duration(milliseconds: 2700),
  });

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  Timer? _timer;
  final List<Timer> _stepTimers = [];

  int _loadingStep = 0;
  final List<String> _loadingMessages = const [
    'Đang khởi tạo trợ lý Mun AI...',
    'Đồng bộ hóa dữ liệu học tập',
    'Sẵn sàng bứt phá mục tiêu điểm số!',
  ];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _animationController.forward();

    // Chia đều thời lượng để hiển thị đầy đủ tất cả các câu loading
    final stepCount = _loadingMessages.length;
    if (widget.duration > Duration.zero && stepCount > 1) {
      final stepIntervalMs = (widget.duration.inMilliseconds / stepCount)
          .round();
      for (int i = 1; i < stepCount; i++) {
        final stepTimer = Timer(Duration(milliseconds: stepIntervalMs * i), () {
          if (mounted) {
            setState(() {
              _loadingStep = i;
            });
          }
        });
        _stepTimers.add(stepTimer);
      }
    }

    // Kết thúc màn hình Launch sau widget.duration
    if (widget.duration > Duration.zero) {
      _timer = Timer(widget.duration, () {
        if (mounted) {
          widget.onFinish?.call();
        }
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          widget.onFinish?.call();
        }
      });
    }
  }

  @override
  void dispose() {
    for (final t in _stepTimers) {
      t.cancel();
    }
    _timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LiquidGlassTheme.background,
      body: Stack(
        children: [
          // 1. Lớp ánh sáng nền Neon Glow (Ambient Background Orbs)
          Positioned(
            top: -100,
            left: -80,
            child: _buildAmbientOrb(
              color: const Color(0xFFA855F7).withValues(alpha: 0.18),
              radius: 340,
            ),
          ),
          Positioned(
            bottom: -60,
            right: -60,
            child: _buildAmbientOrb(
              color: const Color(0xFF6366F1).withValues(alpha: 0.15),
              radius: 300,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.45,
            right: -40,
            child: _buildAmbientOrb(
              color: const Color(0xFF06B6D4).withValues(alpha: 0.08),
              radius: 200,
            ),
          ),

          // 2. Nội dung trung tâm: Logo Mun AI & Shimmer Loading từ UI Kit
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 3),

                    // Mun AI Mascot Logo với hiệu ứng Liquid Glass Glow
                    ScaleTransition(
                      scale: _scaleAnimation,
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: _buildMunAILogo(),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Mun AI Title & Tagline
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Mun AI',
                                style: TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  letterSpacing: -0.5,
                                  shadows: [
                                    Shadow(
                                      color: Color(0xFFA855F7),
                                      blurRadius: 20,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFA855F7),
                                      Color(0xFF6366F1),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(
                                        0xFFA855F7,
                                      ).withValues(alpha: 0.4),
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                                child: const Text(
                                  'PRO',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Trợ lý học tập TOEIC thông minh',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withValues(alpha: 0.7),
                              letterSpacing: 0.2,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Spacer(flex: 3),

                    // 3. Shimmer Loading Card sử dụng UI Kit (may_uikit)
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: _buildUIKitShimmerCard(context),
                    ),

                    const Spacer(flex: 1),

                    // Version & Ecosystem Footer
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          'TOEIC TRACKER • POWERED BY GEMINI 2.0',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.5,
                            color: Colors.white.withValues(alpha: 0.35),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Logo Mun AI với viền kính Crystal Glass và Neon Gradient
  Widget _buildMunAILogo() {
    return Container(
      width: 96,
      height: 96,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFA855F7), Color(0xFF6366F1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.35),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFA855F7).withValues(alpha: 0.5),
            blurRadius: 36,
            spreadRadius: 2,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: const Color(0xFF6366F1).withValues(alpha: 0.3),
            blurRadius: 18,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Hiệu ứng phản quang góc trên bên trái
          Positioned(
            top: 4,
            left: 8,
            child: Container(
              width: 36,
              height: 18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withValues(alpha: 0.4),
                    Colors.white.withValues(alpha: 0.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          // Biểu tượng Mun AI Cat Mascot
          const FaIcon(FontAwesomeIcons.cat, color: Colors.white, size: 46),
        ],
      ),
    );
  }

  Widget _buildUIKitShimmerCard(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 260),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 11),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.035),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
          width: 0.8,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Trạng thái văn bản với hiệu ứng chuyển đổi mượt mà
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: Text(
              _loadingMessages[_loadingStep],
              key: ValueKey<int>(_loadingStep),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.white.withValues(alpha: 0.7),
                letterSpacing: 0.2,
              ),
            ),
          ),

          const SizedBox(height: 9),

          // Thanh Shimmer Loading tinh giản, thanh thoát từ UI Kit (may_uikit)
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Container(
              height: 3,
              width: 140,
              color: Colors.white.withValues(alpha: 0.06),
              child: ShimmerLoadingV2(
                isLoading: true,
                baseColor: const Color(0xFF1E293B),
                highlightColor: const Color(0xFFA855F7).withValues(alpha: 0.7),
                child: const RoundedRectangleShimmerV2(
                  width: 140,
                  height: 3,
                  radius: 4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Quầng sáng Ambient Glow
  Widget _buildAmbientOrb({required Color color, required double radius}) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(colors: [color, color.withValues(alpha: 0.0)]),
      ),
    );
  }
}
