import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'firebase_options.dart';
import 'providers/user_provider.dart';
import 'providers/auth_provider.dart';
import 'screens/main_screen.dart';
import 'screens/maintenance_screen.dart';
import 'screens/launch_screen.dart';
import 'widgets/dynamic_island_notification.dart';
import 'theme/app_theme.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: "assets/.env");
  } catch (e) {
    debugPrint('Warning: Không thể load assets/.env: $e');
  }

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e, stack) {
    debugPrint('Firebase.initializeApp error: $e\n$stack');
  }

  // Kích hoạt bộ nhớ đệm Local (Cache) an toàn
  try {
    FirebaseFirestore.instance.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );
  } catch (e) {
    debugPrint('Firestore settings error: $e');
  }

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
  final bool skipLaunchScreen;
  final Duration? launchDuration;

  const ToeicTrackerApp({
    super.key,
    this.skipLaunchScreen = false,
    this.launchDuration,
  });

  @override
  State<ToeicTrackerApp> createState() => _ToeicTrackerAppState();
}

class _ToeicTrackerAppState extends State<ToeicTrackerApp> {
  bool _isMaintenance = false;
  bool _isFirstLoad = true;
  late bool _showLaunchScreen;

  @override
  void initState() {
    super.initState();
    _showLaunchScreen = !widget.skipLaunchScreen;
    _listenMaintenanceMode();
  }

  void _listenMaintenanceMode() {
    try {
      FirebaseFirestore.instance
          .collection('config')
          .doc('system')
          .snapshots()
          .listen(
            (snapshot) {
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
            },
            onError: (error) {
              debugPrint('Maintenance mode listener error: $error');
              if (mounted && _isFirstLoad) {
                setState(() {
                  _isFirstLoad = false;
                });
              }
            },
          );
    } catch (e) {
      debugPrint('Firestore listen maintenance mode error: $e');
      if (mounted && _isFirstLoad) {
        setState(() {
          _isFirstLoad = false;
        });
      }
    }
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
      builder: (context, child) {
        return Listener(
          behavior: HitTestBehavior.translucent,
          onPointerDown: (event) {
            try {
              final currentFocus = FocusManager.instance.primaryFocus;
              if (currentFocus != null && currentFocus.context != null) {
                final renderObject = currentFocus.context!.findRenderObject();
                if (renderObject is RenderBox && renderObject.hasSize) {
                  final pos = renderObject.localToGlobal(Offset.zero);
                  final bounds = pos & renderObject.size;
                  if (!bounds.contains(event.position)) {
                    currentFocus.unfocus();
                  }
                }
              }
            } catch (_) {}
          },
          child: child ?? const SizedBox.shrink(),
        );
      },
      home: AnimatedSwitcher(
        duration: const Duration(milliseconds: 600),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        child: _showLaunchScreen
            ? LaunchScreen(
                key: const ValueKey('mun_ai_launch_screen'),
                duration:
                    widget.launchDuration ?? const Duration(milliseconds: 2700),
                onFinish: () {
                  if (mounted) {
                    setState(() {
                      _showLaunchScreen = false;
                    });
                  }
                },
              )
            : (_isMaintenance
                  ? const MaintenanceScreen(key: ValueKey('maintenance_screen'))
                  : const MainScreen(key: ValueKey('main_screen'))),
      ),
    );
  }
}
