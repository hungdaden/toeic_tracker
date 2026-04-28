import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'dashboard_screen.dart';
import 'leaderboard_screen.dart';
import 'user_list_screen.dart';
import 'home_screen.dart';
import 'mun_ai_screen.dart';
import 'login_screen.dart';
import '../providers/user_provider.dart';
import '../providers/auth_provider.dart';

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
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody:
          false, // Quan trọng: Tắt tràn viền để không che lấp dữ liệu bên dưới
      body: _pages[_currentIndex < 4 ? _currentIndex : 0],
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 60.0,
        items: const <Widget>[
          Icon(Icons.home_rounded, size: 30, color: Colors.white),
          Icon(Icons.person_rounded, size: 30, color: Colors.white),
          Icon(FontAwesomeIcons.cat, size: 30, color: Colors.white),
          Icon(Icons.emoji_events_rounded, size: 30, color: Colors.white),
          Icon(Icons.group_rounded, size: 30, color: Colors.white),
        ],
        color: const Color(0xFF1E1E1E), // Nền xám đen của thanh
        buttonBackgroundColor: const Color(
          0xFF4F46E5,
        ), // Màu nền của nút nổi lên
        backgroundColor: Colors.transparent, // Nền phía sau thanh
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 400),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        letIndexChange: (index) {
          if (index == 4) {
            final authProvider = context.read<AuthProvider>();
            if (authProvider.isAuthenticated) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const UserListScreen()),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            }
            return false;
          }
          return true;
        },
      ),
    );
  }
}
