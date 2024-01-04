import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'sputils.dart';

//状态管理
class Store {
  Store._internal();

  //全局初始化
  static init(Widget child) {
    //多个Provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AppTheme(getDefaultTheme(), getDefaultBrightness())),
        ChangeNotifierProvider.value(value: AppStatus(TAB_HOME_INDEX)),
      ],
      child: child,
    );
  }

  //获取值 of(context)  这个会引起页面的整体刷新，如果全局是页面级别的
  static T value<T>(BuildContext context, {bool listen = false}) {
    return Provider.of<T>(context, listen: listen);
  }

  //获取值 of(context)  这个会引起页面的整体刷新，如果全局是页面级别的
  static T of<T>(BuildContext context, {bool listen = true}) {
    return Provider.of<T>(context, listen: listen);
  }

  // 不会引起页面的刷新，只刷新了 Consumer 的部分，极大地缩小你的控件刷新范围
  static Consumer connect<T>({builder, child}) {
    return Consumer<T>(builder: builder, child: child);
  }
}

MaterialColor getDefaultTheme() {
  return AppTheme.materialColors[SPUtils.getThemeIndex()];
}

Brightness getDefaultBrightness() {
  return SPUtils.getBrightness();
}

///主题
class AppTheme with ChangeNotifier {
  static final List<MaterialColor> materialColors = [
    Colors.blue,
    Colors.lightBlue,
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.grey,
    Colors.orange,
    Colors.amber,
    Colors.yellow,
    Colors.lightGreen,
    Colors.green,
    Colors.lime
  ];

  MaterialColor _themeColor;

  Brightness _brightness;

  AppTheme(this._themeColor, this._brightness);

  void setColor(MaterialColor color) {
    _themeColor = color;
    notifyListeners();
  }

  // void changeColor(int index) {
  //   _themeColor = materialColors[index];
  //   SPUtils.saveThemeIndex(index);
  //   notifyListeners();
  // }

  // void setBrightness(bool isLight) {
  //   notifyListeners();
  // }

  void changeBrightness(bool isDark) {
    _brightness = isDark ? Brightness.dark : Brightness.light;
    SPUtils.saveBrightness(isDark);
    notifyListeners();
  }

  get themeColor => _themeColor;

  get brightness => _brightness;
}

///用户账户信息
class UserProfile with ChangeNotifier {
  String _nickName;
  String _userId;
  String _avatarSite;

  UserProfile(this._nickName, this._avatarSite, this._userId);

  String get nickName => _nickName;

  // set nickName(String nickName) {
  //   _nickName = nickName;
  //   // SPUtils.saveNickName(nickName);
  //   notifyListeners();
  // }
}

///主页
const int TAB_HOME_INDEX = 0;

///分类
const int TAB_CATEGORY_INDEX = 1;

///活动
const int TAB_ACTIVITY_INDEX = 2;

///消息
const int TAB_MESSAGE_INDEX = 3;

///我的
const int TAB_PROFILE_INDEX = 4;

///应用状态
class AppStatus with ChangeNotifier {
  //主页tab的索引
  int _tabIndex;

  AppStatus(this._tabIndex);

  int get tabIndex => _tabIndex;

  set tabIndex(int index) {
    _tabIndex = index;
    notifyListeners();
  }
}
