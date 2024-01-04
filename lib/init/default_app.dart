import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:provider/provider.dart';

import '../core/http/http_request.dart';
import '../core/utils/toast.dart';
import '../page/first_page.dart';
import '../router/RouteMap.dart';
import '../utils/provider.dart';
import '../utils/sputils.dart';

//默认App的启动
class DefaultApp {
  //运行app
  static void run() {
    WidgetsFlutterBinding.ensureInitialized();
    initFirst().then((value) => runApp(Store.init(ToastUtils.init(MyApp()))));
    initApp();
  }

  /// 必须要优先初始化的内容
  static Future<void> initFirst() async {
    await SPUtils.init();
  }

  /// 程序初始化操作
  static void initApp() {
    Http.init();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(builder: (context, appTheme, _) {
      return GetMaterialApp(
        title: 'Flutter Project',
        theme: ThemeData(
          brightness: appTheme.brightness,
          primarySwatch: appTheme.themeColor,
        ),
        getPages: RouteMap.getPages,
        defaultTransition: Transition.rightToLeft,
      );
    });
  }
}
