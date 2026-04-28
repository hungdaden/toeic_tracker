import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

class AuthProvider extends ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: kIsWeb
        ? '865926846836-rlcbc7mjgj2cikvmitprsqs3pm6qi0as.apps.googleusercontent.com'
        : (Platform.isIOS
              ? '865926846836-ol3m9s3605b02gt5tp3vdha4fainndtm.apps.googleusercontent.com'
              : null),
  );

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;
  User? get user => _user;
  bool get isAuthenticated => _user != null;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  AuthProvider() {
    _auth.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<String?> signInWithEmail(String email, String password) async {
    _setLoading(true);
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null; // Success
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Đăng nhập thất bại.";
    } catch (e) {
      return "Đã xảy ra lỗi không xác định: $e";
    } finally {
      _setLoading(false);
    }
  }

  Future<String?> signUpWithEmail(String email, String password) async {
    _setLoading(true);
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // Success
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Đăng ký thất bại.";
    } catch (e) {
      return "Đã xảy ra lỗi không xác định: $e";
    } finally {
      _setLoading(false);
    }
  }

  Future<String?> signInWithGoogle() async {
    _setLoading(true);
    try {
      if (kIsWeb) {
        // Trên Web, sử dụng phương thức signInWithPopup tích hợp sẵn của Firebase
        GoogleAuthProvider googleProvider = GoogleAuthProvider();
        await _auth.signInWithPopup(googleProvider);
        return null; // Success
      }

      // Trên Mobile (iOS/Android), sử dụng thư viện google_sign_in
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        _setLoading(false);
        return "Đã hủy đăng nhập Google.";
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
      return null; // Success
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Lỗi đăng nhập Google từ Firebase.";
    } catch (e) {
      return "Lỗi cấu hình Google Sign-In hoặc chưa cài đặt. Chi tiết: $e";
    } finally {
      _setLoading(false);
    }
  }

  Future<void> signOut() async {
    _setLoading(true);
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
    } catch (e) {
      debugPrint("Lỗi đăng xuất: $e");
    } finally {
      _setLoading(false);
    }
  }
}
