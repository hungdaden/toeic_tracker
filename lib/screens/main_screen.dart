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
import 'exam_list_screen.dart';

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

  void _openExamList() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ExamListScreen()),
    );
  }

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 60.0,
        items: <Widget>[
          const Center(child: Icon(Icons.home_rounded, size: 28, color: Colors.white)),
          const Center(child: Icon(Icons.person_rounded, size: 28, color: Colors.white)),
          Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.all(_currentIndex == 2 ? 12 : 0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == 2 ? Colors.white.withOpacity(0.2) : Colors.transparent,
                boxShadow: _currentIndex == 2 
                  ? [BoxShadow(color: const Color(0xFF4F46E5).withOpacity(0.4), blurRadius: 15, spreadRadius: 5)] 
                  : [],
              ),
              child: Icon(
                FontAwesomeIcons.cat, 
                size: _currentIndex == 2 ? 32 : 28, 
                color: Colors.white
              ),
            ),
          ),
          const Center(child: Icon(Icons.emoji_events_rounded, size: 28, color: Colors.white)),
          const Center(child: Icon(Icons.group_rounded, size: 28, color: Colors.white)),
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
            if (!authProvider.isAuthenticated) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
              return false;
            }
          }
          return true;
        },
      ),
    );
  }
}
