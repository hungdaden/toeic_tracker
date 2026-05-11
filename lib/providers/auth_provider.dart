import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      // 1. KIỂM TRA CHẾ ĐỘ BẢO TRÌ
      final configDoc = await FirebaseFirestore.instance.collection('config').doc('system').get();
      if (configDoc.exists && (configDoc.data() as Map<String, dynamic>)['maintenanceMode'] == true) {
        return "Hệ thống đang bảo trì để nâng cấp. Vui lòng quay lại sau ít phút.";
      }

      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      
      if (result.user != null) {
        // KIỂM TRA TÀI KHOẢN CÓ BỊ KHÓA KHÔNG (Ép buộc lấy từ Server để tránh Cache cũ)
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .where('authUid', isEqualTo: result.user!.uid)
            .get(const GetOptions(source: Source.server));

        if (userDoc.docs.isNotEmpty) {
          final userData = userDoc.docs.first.data();
          if (userData['isDisabled'] == true) {
            await _auth.signOut();
            return "Tài khoản của bạn đã bị khóa bởi quản trị viên.";
          }
        }
      }
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
      // 1. KIỂM TRA CHẾ ĐỘ BẢO TRÌ
      final configDoc = await FirebaseFirestore.instance.collection('config').doc('system').get();
      if (configDoc.exists && (configDoc.data() as Map<String, dynamic>)['maintenanceMode'] == true) {
        return "Hệ thống đang bảo trì để nâng cấp. Vui lòng quay lại sau ít phút.";
      }

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
