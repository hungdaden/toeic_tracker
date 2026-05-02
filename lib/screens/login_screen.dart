import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../providers/auth_provider.dart';

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
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || (!_isLogin && confirmPassword.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập đầy đủ thông tin.')),
      );
      return;
    }

    if (!_isLogin && password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mật khẩu nhập lại không khớp.')),
      );
      return;
    }

    String? error;
    if (_isLogin) {
      error = await authProvider.signInWithEmail(email, password);
    } else {
      error = await authProvider.signUpWithEmail(email, password);
    }

    if (!mounted) return;

    if (error != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
    } else {
      Navigator.pop(context); // Quay lại sau khi đăng nhập thành công
    }
  }

  void _signInWithGoogle() async {
    final authProvider = context.read<AuthProvider>();
    final error = await authProvider.signInWithGoogle();

    if (!mounted) return;

    if (error != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
    } else {
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
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.email),
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
