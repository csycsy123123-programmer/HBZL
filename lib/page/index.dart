import 'package:flutter/material.dart';
import 'package:hbzl/core/utils/click.dart';
import 'package:hbzl/core/utils/toast.dart';
import 'package:hbzl/utils/provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({required Key key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  List<BottomNavigationBarItem> getTabs(BuildContext context) => [
        // BottomNavigationBarItem(
        //     label: I18n.of(context).home, icon: Icon(Icons.home)),
        // BottomNavigationBarItem(
        //     label: I18n.of(context).category, icon: Icon(Icons.list)),
        // BottomNavigationBarItem(
        //     label: I18n.of(context).activity, icon: Icon(Icons.local_activity)),
        // BottomNavigationBarItem(
        //     label: I18n.of(context).message, icon: Icon(Icons.notifications)),
        // BottomNavigationBarItem(
        //     label: I18n.of(context).profile, icon: Icon(Icons.person)),
      ];

  List<Widget> getTabWidget(BuildContext context) => [
        Center(child: Text("dddd")),
        // Center(child: Text(I18n.of(context).category)),
        // Center(child: Text(I18n.of(context).activity)),
        // Center(child: Text(I18n.of(context).message)),
        // Center(child: Text(I18n.of(context).profile)),
      ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStatus>(
      builder: (BuildContext context, AppStatus status, Widget? child) {
        return SizedBox(
          width: 100,
          height: 100,
          child: Container(),
        );
      },
    );
  }

  // @override
  // Widget build2(BuildContext context) {
  //   var tabs = getTabs(context);
  //   return Consumer(
  //       builder: (BuildContext context, AppStatus status, Widget child) {
  //     return Scaffold(
  //         child: Scaffold(
  //           key: _scaffoldKey,
  //           appBar: AppBar(
  //             title: Text(tabs[status.tabIndex].label),
  //             actions: <Widget>[
  //               IconButton(
  //                   icon: Icon(Icons.security),
  //                   onPressed: () {
  //                     PrivacyUtils.showPrivacyDialog(context,
  //                         onAgressCallback: () {
  //                       Navigator.of(context).pop();
  //                       ToastUtils.success(I18n.of(context).agreePrivacy);
  //                     });
  //                   }),
  //               PopupMenuButton<String>(
  //                   itemBuilder: (BuildContext context) =>
  //                       <PopupMenuEntry<String>>[
  //                         PopupMenuItem<String>(
  //                           value: "sponsor",
  //                           child: ListTile(
  //                             contentPadding:
  //                                 EdgeInsets.symmetric(horizontal: 10),
  //                             leading: Icon(
  //                               Icons.attach_money,
  //                             ),
  //                             title: Text(I18n.of(context).sponsor),
  //                           ),
  //                         ),
  //                       ],
  //                   onSelected: (String action) {
  //                     Get.toNamed('/menu/$action-page');
  //                   })
  //             ],
  //           ),
  //           drawer: MenuDrawer(),
  //           body: IndexedStack(
  //             index: status.tabIndex,
  //             children: getTabWidget(context),
  //           ),
  //           bottomNavigationBar: BottomNavigationBar(
  //             items: tabs,
  //             //高亮  被点击高亮
  //             currentIndex: status.tabIndex,
  //             //修改 页面
  //             onTap: (index) {
  //               status.tabIndex = index;
  //             },
  //             type: BottomNavigationBarType.fixed,
  //             fixedColor: Theme.of(context).primaryColor,
  //           ),
  //         ),
  //         //监听导航栏返回,类似onKeyEvent
  //         onWillPop: () =>
  //             ClickUtils.exitBy2Click(status: _scaffoldKey.currentState));
  //   });
  // }
}
