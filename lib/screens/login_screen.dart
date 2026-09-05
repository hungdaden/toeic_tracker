import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:may_uikit/may_uikit.dart';
import '../providers/auth_provider.dart';
import '../widgets/dynamic_island_notification.dart';
import '../widgets/liquid_glass_app_bar.dart';
import '../theme/liquid_glass_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLogin = true;
  Timer? _debounce;
  bool _passwordsMatch = true;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_onPasswordChanged);
    _confirmPasswordController.addListener(_onPasswordChanged);
  }

  void _onPasswordChanged() {
    if (!_isLogin) {
      if (!_passwordsMatch) {
        setState(() {
          _passwordsMatch = true;
        });
      }

      if (_debounce?.isActive ?? false) _debounce!.cancel();

      _debounce = Timer(const Duration(milliseconds: 800), () {
        if (mounted) {
          setState(() {
            _passwordsMatch = _confirmPasswordController.text.isEmpty ||
                _passwordController.text == _confirmPasswordController.text;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _passwordController.removeListener(_onPasswordChanged);
    _confirmPasswordController.removeListener(_onPasswordChanged);
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() async {
    final authProvider = context.read<AuthProvider>();
    String emailOrUsername = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (emailOrUsername.isEmpty || password.isEmpty || (!_isLogin && confirmPassword.isEmpty)) {
      DynamicIslandNotification.show(
        context,
        title: 'Thông báo',
        message: 'Vui lòng nhập đầy đủ thông tin.',
        type: NotificationType.warning,
      );
      return;
    }

    String finalEmail = emailOrUsername;
    if (!emailOrUsername.contains('@')) {
      finalEmail = '$emailOrUsername@toeic.app';
    }

    if (!_isLogin && password != confirmPassword) {
      DynamicIslandNotification.show(
        context,
        title: 'Lỗi',
        message: 'Mật khẩu nhập lại không khớp.',
        type: NotificationType.error,
      );
      return;
    }

    String? error;
    if (_isLogin) {
      error = await authProvider.signInWithEmail(finalEmail, password);
    } else {
      error = await authProvider.signUpWithEmail(finalEmail, password);
    }

    if (!mounted) return;

    if (error != null) {
      DynamicIslandNotification.show(
        context,
        title: 'Lỗi',
        message: error,
        type: NotificationType.error,
      );
    } else {
      DynamicIslandNotification.show(
        context,
        title: 'Thành công',
        message: _isLogin ? 'Đăng nhập thành công!' : 'Đăng ký tài khoản thành công!',
        type: NotificationType.success,
      );
      Navigator.pop(context);
    }
  }

  void _signInWithGoogle() async {
    final authProvider = context.read<AuthProvider>();
    final error = await authProvider.signInWithGoogle();

    if (!mounted) return;

    if (error != null) {
      DynamicIslandNotification.show(
        context,
        title: 'Lỗi',
        message: error,
        type: NotificationType.error,
      );
    } else {
      DynamicIslandNotification.show(
        context,
        title: 'Thành công',
        message: 'Đăng nhập với Google thành công!',
        type: NotificationType.success,
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final topPadding = LiquidGlassTheme.getAppBarContentTop(context, 12);

    return LiquidGlassScaffoldWrapper(
      appBar: const LiquidGlassAppBar(title: 'Tài khoản'),
      child: authProvider.isLoading
          ? const Center(child: SpinKitFadingCircle(color: Colors.white, size: 50.0))
          : SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(20, topPadding, 20, 40),
              child: LiquidGlassContainer(
                borderRadius: 24,
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 12),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: LiquidGlassTheme.primaryAccent.withValues(alpha: 0.15),
                          border: Border.all(color: LiquidGlassTheme.primaryAccent.withValues(alpha: 0.3)),
                        ),
                        child: const Icon(Icons.lock_person_rounded, size: 50, color: LiquidGlassTheme.primaryAccent),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _isLogin ? 'Đăng nhập' : 'Đăng ký',
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 28),
                    TextField(
                      controller: _emailController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Email hoặc Username',
                        labelStyle: TextStyle(color: Colors.white.withValues(alpha: 0.6)),
                        prefixIcon: const Icon(Icons.person_outline_rounded, color: Colors.white70),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.2)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(color: LiquidGlassTheme.primaryAccent),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _passwordController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Mật khẩu',
                        labelStyle: TextStyle(color: Colors.white.withValues(alpha: 0.6)),
                        prefixIcon: const Icon(Icons.lock_outline_rounded, color: Colors.white70),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.2)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(color: LiquidGlassTheme.primaryAccent),
                        ),
                        errorText: !_passwordsMatch ? 'Mật khẩu không khớp' : null,
                      ),
                      obscureText: true,
                    ),
                    if (!_isLogin) ...[
                      const SizedBox(height: 16),
                      TextField(
                        controller: _confirmPasswordController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Nhập lại mật khẩu',
                          labelStyle: TextStyle(color: Colors.white.withValues(alpha: 0.6)),
                          prefixIcon: const Icon(Icons.lock_reset_rounded, color: Colors.white70),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.2)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(color: LiquidGlassTheme.primaryAccent),
                          ),
                          errorText: !_passwordsMatch ? 'Mật khẩu không khớp' : null,
                        ),
                        obscureText: true,
                      ),
                    ],
                    const SizedBox(height: 24),
                    GlassButtonV2(
                      title: _isLogin ? 'Đăng nhập' : 'Đăng ký',
                      onTap: _submit,
                    ),
                    const SizedBox(height: 14),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                          _confirmPasswordController.clear();
                        });
                      },
                      child: Text(
                        _isLogin ? 'Chưa có tài khoản? Đăng ký ngay' : 'Đã có tài khoản? Đăng nhập',
                        style: const TextStyle(color: LiquidGlassTheme.secondaryAccent),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.15))),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text('HOẶC', style: TextStyle(color: Colors.white.withValues(alpha: 0.45), fontSize: 12)),
                        ),
                        Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.15))),
                      ],
                    ),
                    const SizedBox(height: 16),
                    GlassButtonV2(
                      title: 'Tiếp tục với Google',
                      icon: const Icon(Icons.g_mobiledata_rounded, size: 28, color: Colors.white),
                      onTap: _signInWithGoogle,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
