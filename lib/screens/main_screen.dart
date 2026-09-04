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

  final List<Widget> _pages = [
    const HomeScreen(),
    const DashboardScreen(),
    const MunAIScreen(),
    const LeaderboardScreen(),
    const UserListScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
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
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LiquidGlassTheme.background,
      extendBody: true,
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
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
            activeIcon: const Icon(FontAwesomeIcons.cat, size: 20, color: Colors.white),
            inactiveIcon: Icon(FontAwesomeIcons.cat, size: 20, color: Colors.white.withValues(alpha: 0.55)),
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
