// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Huỷ`
  String get cancel {
    return Intl.message('Huỷ', name: 'cancel', desc: '', args: []);
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
  }

  /// `Thử lại`
  String get retry {
    return Intl.message('Thử lại', name: 'retry', desc: '', args: []);
  }

  /// `Bạn có chắc chắn muốn xoá tài khoản?`
  String get deleteAccountConfirm {
    return Intl.message(
      'Bạn có chắc chắn muốn xoá tài khoản?',
      name: 'deleteAccountConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Bạn có chắc chắn muốn đăng xuất?`
  String get logoutConfirm {
    return Intl.message(
      'Bạn có chắc chắn muốn đăng xuất?',
      name: 'logoutConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Hệ thống đang bảo trì`
  String get maintenanceTitle {
    return Intl.message(
      'Hệ thống đang bảo trì',
      name: 'maintenanceTitle',
      desc: '',
      args: [],
    );
  }

  /// `Bữa đã dùng`
  String get mealUsed {
    return Intl.message('Bữa đã dùng', name: 'mealUsed', desc: '', args: []);
  }

  /// `Bữa sáng`
  String get mealType {
    return Intl.message('Bữa sáng', name: 'mealType', desc: '', args: []);
  }

  /// `Đăng ký`
  String get register {
    return Intl.message('Đăng ký', name: 'register', desc: '', args: []);
  }

  /// `Đã đăng ký`
  String get registered {
    return Intl.message('Đã đăng ký', name: 'registered', desc: '', args: []);
  }

  /// `Chưa đăng ký`
  String get unregistered {
    return Intl.message(
      'Chưa đăng ký',
      name: 'unregistered',
      desc: '',
      args: [],
    );
  }

  /// `Sáng`
  String get themeLight {
    return Intl.message('Sáng', name: 'themeLight', desc: '', args: []);
  }

  /// `Tối`
  String get themeDark {
    return Intl.message('Tối', name: 'themeDark', desc: '', args: []);
  }

  /// `Tự động`
  String get themeAuto {
    return Intl.message('Tự động', name: 'themeAuto', desc: '', args: []);
  }

  /// `Chỉnh sửa`
  String get actionEdit {
    return Intl.message('Chỉnh sửa', name: 'actionEdit', desc: '', args: []);
  }

  /// `Chia sẻ`
  String get actionShare {
    return Intl.message('Chia sẻ', name: 'actionShare', desc: '', args: []);
  }

  /// `Xóa`
  String get actionDelete {
    return Intl.message('Xóa', name: 'actionDelete', desc: '', args: []);
  }

  /// `Đóng`
  String get actionClose {
    return Intl.message('Đóng', name: 'actionClose', desc: '', args: []);
  }

  /// `Đăng xuất`
  String get actionLogout {
    return Intl.message('Đăng xuất', name: 'actionLogout', desc: '', args: []);
  }

  /// `Xác nhận`
  String get actionConfirm {
    return Intl.message('Xác nhận', name: 'actionConfirm', desc: '', args: []);
  }

  /// `Tìm kiếm`
  String get searchPlaceholder {
    return Intl.message(
      'Tìm kiếm',
      name: 'searchPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Trống`
  String get emptyDataTitle {
    return Intl.message('Trống', name: 'emptyDataTitle', desc: '', args: []);
  }

  /// `Dữ liệu đang trống`
  String get emptyDataDescription {
    return Intl.message(
      'Dữ liệu đang trống',
      name: 'emptyDataDescription',
      desc: '',
      args: [],
    );
  }

  /// `Tôi đã hiểu`
  String get actionUnderstand {
    return Intl.message(
      'Tôi đã hiểu',
      name: 'actionUnderstand',
      desc: '',
      args: [],
    );
  }

  /// `Cài đặt`
  String get actionSettings {
    return Intl.message('Cài đặt', name: 'actionSettings', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
