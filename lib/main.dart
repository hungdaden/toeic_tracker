import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'firebase_options.dart';
import 'services/notification_service.dart';
import 'providers/user_provider.dart';
import 'providers/auth_provider.dart';
import 'screens/main_screen.dart';
import 'screens/maintenance_screen.dart';
import 'widgets/dynamic_island_notification.dart';
import 'theme/app_theme.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  print('APP_START: Hàm main đang chạy...');
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  // Kích hoạt bộ nhớ đệm Local (Cache) để tiết kiệm băng thông
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true, // Kích hoạt trên Web/Mobile
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED, // Không giới hạn kích thước cache
  );
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProxyProvider<AuthProvider, UserProvider>(
          create: (_) => UserProvider(),
          update: (_, authProvider, userProvider) {
            return userProvider!..updateAuthUid(authProvider.user?.uid);
          },
        ),
      ],
      child: const ToeicTrackerApp(),
    ),
  );
}

class ToeicTrackerApp extends StatefulWidget {
  const ToeicTrackerApp({super.key});

  @override
  State<ToeicTrackerApp> createState() => _ToeicTrackerAppState();
}

class _ToeicTrackerAppState extends State<ToeicTrackerApp> {
  bool _isMaintenance = false;
  bool _isFirstLoad = true;

  @override
  void initState() {
    super.initState();
    _listenMaintenanceMode();
  }

  void _listenMaintenanceMode() {
    FirebaseFirestore.instance
        .collection('config')
        .doc('system')
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        final newStatus = data['maintenanceMode'] == true;

        // Nếu Admin vừa bật bảo trì (Status đổi từ false sang true)
        if (newStatus && !_isMaintenance && !_isFirstLoad) {
          _showMaintenanceNotification();
        }

        if (mounted) {
          setState(() {
            _isMaintenance = newStatus;
            _isFirstLoad = false;
          });
        }
      }
    });
  }

  void _showMaintenanceNotification() {
    // Đợi 1 chút để Navigator sẵn sàng
    Future.delayed(const Duration(milliseconds: 500), () {
      if (navigatorKey.currentState?.overlay?.context != null) {
        DynamicIslandNotification.show(
          navigatorKey.currentState!.overlay!.context,
          title: 'Hệ thống Bảo trì',
          message: 'Admin vừa kích hoạt chế độ bảo trì định kỳ.',
          type: NotificationType.warning,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'TOEIC Tracker',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: _isMaintenance ? const MaintenanceScreen() : const MainScreen(),
    );
  }
}
