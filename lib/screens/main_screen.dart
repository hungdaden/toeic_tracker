import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:may_uikit/may_uikit.dart';
import 'dashboard_screen.dart';
import 'leaderboard_screen.dart';
import 'user_list_screen.dart';
import 'home_screen.dart';
import 'mun_ai_screen.dart';
import 'login_screen.dart';
import '../providers/auth_provider.dart';
import '../theme/liquid_glass_theme.dart';

class MainScreen extends StatefulWidget {
  final int initialIndex;
  const MainScreen({super.key, this.initialIndex = 0});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _currentIndex;
  late PageController _pageController;

  final List<Widget> _pages = [
    const HomeScreen(),
    const DashboardScreen(),
    const MunAIScreen(),
    const LeaderboardScreen(),
    const UserListScreen(),
  ];

  // Quản lý cử chỉ vuốt ngang từ mép màn hình (Edge Swipe)
  double? _edgeStartX;
  double? _edgeStartY;
  bool _isLeftEdge = false;
  bool _isRightEdge = false;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabSelected(int index) {
    if (index == 4) {
      final authProvider = context.read<AuthProvider>();
      if (!authProvider.isAuthenticated) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
        return;
      }
    }
    if (index != _currentIndex) {
      HapticUtil.lightImpact();
      setState(() {
        _currentIndex = index;
      });
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 320),
          curve: Curves.easeOutCubic,
        );
      }
    }
  }

  void _handleEdgePointerDown(PointerDownEvent event, double screenWidth) {
    const edgeThreshold = 48.0; // Vùng cảm ứng mép 48px từ viền trái/phải màn hình
    if (event.position.dx <= edgeThreshold) {
      _edgeStartX = event.position.dx;
      _edgeStartY = event.position.dy;
      _isLeftEdge = true;
      _isRightEdge = false;
    } else if (event.position.dx >= screenWidth - edgeThreshold) {
      _edgeStartX = event.position.dx;
      _edgeStartY = event.position.dy;
      _isRightEdge = true;
      _isLeftEdge = false;
    } else {
      _edgeStartX = null;
      _edgeStartY = null;
      _isLeftEdge = false;
      _isRightEdge = false;
    }
  }

  void _handleEdgePointerUp(PointerUpEvent event) {
    if (_edgeStartX != null && _edgeStartY != null) {
      final deltaX = event.position.dx - _edgeStartX!;
      final deltaY = (event.position.dy - _edgeStartY!).abs();

      // Đảm bảo cử chỉ vuốt ngang chiếm ưu thế so với cuộn dọc và vượt ngưỡng kích hoạt
      if (deltaX.abs() > 40.0 && deltaX.abs() > deltaY * 1.1) {
        if (_isLeftEdge && deltaX > 40.0) {
          // Vuốt từ mép trái sang phải -> Chuyển về màn hình trước đó
          if (_currentIndex > 0) {
            _onTabSelected(_currentIndex - 1);
          }
        } else if (_isRightEdge && deltaX < -40.0) {
          // Vuốt từ mép phải sang trái -> Chuyển sang màn hình tiếp theo
          if (_currentIndex < _pages.length - 1) {
            _onTabSelected(_currentIndex + 1);
          }
        }
      }
    }
    _edgeStartX = null;
    _edgeStartY = null;
    _isLeftEdge = false;
    _isRightEdge = false;
  }

  void _handleEdgePointerCancel(PointerCancelEvent event) {
    _edgeStartX = null;
    _edgeStartY = null;
    _isLeftEdge = false;
    _isRightEdge = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LiquidGlassTheme.background,
      extendBody: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          return Listener(
            behavior: HitTestBehavior.translucent,
            onPointerDown: (event) => _handleEdgePointerDown(event, screenWidth),
            onPointerUp: _handleEdgePointerUp,
            onPointerCancel: _handleEdgePointerCancel,
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: _pages,
            ),
          );
        },
      ),
      bottomNavigationBar: FloatingBottomBarV2(
        currentIndex: _currentIndex,
        onTap: _onTabSelected,
        items: [
          FloatingBottomBarItemV2(
            title: 'Trang chủ',
            activeIcon: const Icon(Icons.home_rounded, size: 22, color: Colors.white),
            inactiveIcon: Icon(Icons.home_outlined, size: 22, color: Colors.white.withValues(alpha: 0.55)),
            activeBackgroundGradient: LiquidGlassTheme.primaryButtonGradient,
          ),
          FloatingBottomBarItemV2(
            title: 'Thống kê',
            activeIcon: const Icon(Icons.insert_chart_rounded, size: 22, color: Colors.white),
            inactiveIcon: Icon(Icons.insert_chart_outlined_rounded, size: 22, color: Colors.white.withValues(alpha: 0.55)),
            activeBackgroundGradient: const LinearGradient(
              colors: [Color(0xFF06B6D4), Color(0xFF0284C7)],
            ),
          ),
          FloatingBottomBarItemV2(
            title: 'Mun AI',
            activeIcon: const FaIcon(FontAwesomeIcons.cat, size: 20, color: Colors.white),
            inactiveIcon: FaIcon(FontAwesomeIcons.cat, size: 20, color: Colors.white.withValues(alpha: 0.55)),
            activeBackgroundGradient: const LinearGradient(
              colors: [Color(0xFFA855F7), Color(0xFF7C3AED)],
            ),
          ),
          FloatingBottomBarItemV2(
            title: 'Bảng vàng',
            activeIcon: const Icon(Icons.emoji_events_rounded, size: 22, color: Colors.white),
            inactiveIcon: Icon(Icons.emoji_events_outlined, size: 22, color: Colors.white.withValues(alpha: 0.55)),
            activeBackgroundGradient: const LinearGradient(
              colors: [Color(0xFFF59E0B), Color(0xFFD97706)],
            ),
          ),
          FloatingBottomBarItemV2(
            title: 'Hồ sơ',
            activeIcon: const Icon(Icons.person_rounded, size: 22, color: Colors.white),
            inactiveIcon: Icon(Icons.person_outline_rounded, size: 22, color: Colors.white.withValues(alpha: 0.55)),
            activeBackgroundGradient: const LinearGradient(
              colors: [Color(0xFF10B981), Color(0xFF059669)],
            ),
          ),
        ],
      ),
    );
  }
}
