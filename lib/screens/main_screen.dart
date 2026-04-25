import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dashboard_screen.dart';
import 'leaderboard_screen.dart';
import 'user_list_screen.dart';
import 'home_screen.dart';
import 'mun_ai_screen.dart';
import '../providers/user_provider.dart';

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
      extendBody: false, // Quan trọng: Tắt tràn viền để không che lấp dữ liệu bên dưới
      body: _pages[_currentIndex < 4 ? _currentIndex : 0],
      bottomNavigationBar: SafeArea(
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12, top: 24), // Thu dọn khoảng không để AI trồi lên không lấn vào chữ
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              // Thanh nền chính (Dark Floating Pill)
              Container(
                height: 65,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E), // Đen xám mịn
                  borderRadius: BorderRadius.circular(32.5),
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4)),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildNavItem(0, Icons.home_rounded, 'Trang chủ'),
                    _buildNavItem(1, Icons.person_rounded, 'Cá nhân'),
                    const SizedBox(width: 70), // Khoảng trống lớn ở giữa cho Mun AI
                    _buildNavItem(3, Icons.emoji_events_rounded, 'Xếp hạng'),
                    _buildNavItem(4, Icons.group_rounded, 'Hồ sơ', isProfile: true),
                  ],
                ),
              ),
              // Nút tròn 3 lớp nổi bật ở chính giữa
              Positioned(
                top: -20, // Thò lên trên thanh nền 20px
                child: _buildCenterAIBtn(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCenterAIBtn() {
    final isSelected = _currentIndex == 2;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = 2),
      child: AnimatedScale(
        scale: isSelected ? 1.15 : 1.0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.elasticOut,
        child: Container(
          width: 76,
          height: 76,
          decoration: const BoxDecoration(
            color: Colors.white, // Viền trắng ngoài cùng
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4)),
            ],
          ),
          padding: const EdgeInsets.all(4),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFA5B4FC), // Viền tím nhạt
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(5),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF4F46E5) : const Color(0xFF6366F1), // Nhấn đậm hơn khi chọn
                shape: BoxShape.circle,
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: Icon(
                  FontAwesomeIcons.cat, // Icon mèo đang ngồi
                  key: ValueKey<bool>(isSelected),
                  color: Colors.white,
                  size: isSelected ? 34 : 30, // Phóng to nhẹ khi được chọn
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label, {bool isProfile = false}) {
    final isSelected = _currentIndex == index;
    final color = isSelected ? const Color(0xFF6366F1) : Colors.grey.shade500;
    
    return Expanded( 
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          if (isProfile) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const UserListScreen()));
          } else {
            setState(() => _currentIndex = index);
          }
        },
        child: AnimatedScale(
          scale: isSelected ? 1.2 : 1.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutBack,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(height: 2),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: TextStyle(
                  fontSize: isSelected ? 11 : 10,
                  color: color,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
                child: Text(label),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
