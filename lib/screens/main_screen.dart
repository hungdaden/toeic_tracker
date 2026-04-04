import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dashboard_screen.dart';
import 'leaderboard_screen.dart';
import 'user_list_screen.dart';
import 'home_screen.dart';
import '../providers/user_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  
  final List<Widget> _pages = [
    const HomeScreen(),
    const DashboardScreen(),
    const LeaderboardScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // removed auto redirect

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 3) {
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const UserListScreen()));
          } else {
             setState(() => _currentIndex = index);
          }
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Cá nhân'),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: 'Xếp hạng'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Hồ sơ'),
        ],
      ),
    );
  }
}
