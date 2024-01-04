import 'dart:ui';

import 'package:hbzl/utils/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPUtils {
  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  SPUtils._internal();

  static late SharedPreferences _spf;

  static Future<SharedPreferences> init() async {
    _spf = await SharedPreferences.getInstance();
    return _spf;
  }

  ///深色模式
  static Future<bool> saveBrightness(bool isDark) {
    return _spf.setBool('key_brightness', isDark);
  }

  static int getThemeIndex() {
    if (_spf.containsKey('key_theme_color')) {
      return _spf.getInt('key_theme_color') ?? 0;
    }
    return 0;
  }

  static Brightness getBrightness() {
    bool isDark = _spf.containsKey('key_brightness')
        ? _spf.getBool('key_brightness') ?? false
        : false;
    return isDark ? Brightness.dark : Brightness.light;
  }
}
