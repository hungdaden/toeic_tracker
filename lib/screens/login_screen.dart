import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../providers/auth_provider.dart';
import '../widgets/dynamic_island_notification.dart';

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
      // Ẩn lỗi ngay khi người dùng đang gõ
      if (!_passwordsMatch) {
        setState(() {
          _passwordsMatch = true;
        });
      }

      // Hủy timer cũ nếu có
      if (_debounce?.isActive ?? false) _debounce!.cancel();

      // Đặt timer mới (delay 800ms)
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

    // Nếu không chứa '@', coi như là Username và tự động thêm hậu tố để Firebase chấp nhận
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
      Navigator.pop(context); // Quay lại sau khi đăng nhập thành công
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

    return Scaffold(
      appBar: AppBar(title: const Text('Tài khoản')),
      body: authProvider.isLoading
          ? const Center(child: SpinKitFadingCircle(color: Colors.white, size: 50.0))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),
                  Icon(Icons.lock_person_rounded, size: 80, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(height: 20),
                  Text(
                    _isLogin ? 'Đăng nhập' : 'Đăng ký',
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email hoặc Username',
                      prefixIcon: const Icon(Icons.person_outline_rounded),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Mật khẩu',
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      errorText: !_passwordsMatch ? 'Mật khẩu không khớp' : null,
                    ),
                    obscureText: true,
                  ),
                  if (!_isLogin) ...[
                    const SizedBox(height: 16),
                    TextField(
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        labelText: 'Nhập lại mật khẩu',
                        prefixIcon: const Icon(Icons.lock_outline),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        errorText: !_passwordsMatch ? 'Mật khẩu không khớp' : null,
                      ),
                      obscureText: true,
                    ),
                  ],
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(_isLogin ? 'Đăng nhập' : 'Đăng ký', style: const TextStyle(fontSize: 16)),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                        _confirmPasswordController.clear();
                      });
                    },
                    child: Text(_isLogin ? 'Chưa có tài khoản? Đăng ký ngay' : 'Đã có tài khoản? Đăng nhập'),
                  ),
                  const SizedBox(height: 24),
                  const Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text('HOẶC')),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 24),
                  OutlinedButton.icon(
                    onPressed: _signInWithGoogle,
                    icon: const Icon(Icons.g_mobiledata, size: 32),
                    label: const Text('Tiếp tục với Google'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
