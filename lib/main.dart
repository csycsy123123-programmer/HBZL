import 'package:flutter/material.dart';
import 'package:flutter_nb_net/flutter_net.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hbzl/src/dart/core/request_manager.dart';
import 'package:hbzl/src/dart/core/view/toast.dart';
import 'dart:developer' as developer;


import 'package:logger/logger.dart';

void main() {
  runApp(const MyApp());
  developer.log('123',name: '123456');
  var logger =Logger();
  //logger 方法示例
  logger.i("1231");
  logger.d("message");
  logger.f("message2");
  //get 方法示例
  String path="https://www.hanbaidt.cn:9091//shop/allProduct";
  // RequestManager.get(path).then((value) => logger.i("{$value},",));
  // String savePath = "C:\Users\admin\Desktop\1";
  // String downLoadUrl =
  //     "https://hanbaidt.cn:9091/file/normal/a3206bfd78b2458baaf6d2bb401ce9f9.png";
  // RequestManager.downloadFile(downLoadUrl, savePath, (result) {
  //   if(result){
  //     logger.i("成功");
  //   }
  //   else {
  //     logger.i("失败");
  //   }
  // });
  //toast 示例
  ToastUtil.show(msg: '1',toastLength: Toast.LENGTH_LONG);
  //nb net 示例
  NetOptions.instance
  // header
      .addHeaders({"Authorization": 'eyJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoidXNlciIsImV4cCI6MTcwNTIwNDgyNywidXNlcklkIjoiMTI1NjQyODQ3MjY4MzcyNDgxIiwiaWF0IjoxNzAzOTk1MjI3fQ.UUk2nRdzvGAm0FiPdzGWd7y736ryhbFyNSQYbsbUpMs'})
      .setBaseUrl("https://www.hanbaidt.cn:9091/")
  // 代理/https
  // .setHttpClientAdapter(IOHttpClientAdapter()
  //   ..onHttpClientCreate = (client) {
  //     client.findProxy = (uri) {
  //       return 'PROXY 192.168.20.43:8888';
  //     };
  //     client.badCertificateCallback =
  //         (X509Certificate cert, String host, int port) => true;
  //     return client;
  //   })
  // cookie
  //     .addInterceptor(CookieManager(CookieJar()))
  // dio_http_cache
  // .addInterceptor(DioCacheManager(CacheConfig(
  //   baseUrl: "https://www.wanandroid.com/",
  // )).interceptor)
  // dio_cache_interceptor
  //     .addInterceptor(DioCacheInterceptor(
  //     options: CacheOptions(
  //       store: MemCacheStore(),
  //       policy: CachePolicy.forceCache,
  //       hitCacheOnErrorExcept: [401, 403],
  //       maxStale: const Duration(days: 7),
  //       priority: CachePriority.normal,
  //       cipher: null,
  //       keyBuilder: CacheOptions.defaultCacheKeyBuilder,
  //       allowPostMethod: false,
  //     )))
  //  全局解析器
  // .setHttpDecoder(MyHttpDecoder.getInstance())
  //  超时时间
      .setConnectTimeout(const Duration(milliseconds: 3000))
  // 允许打印log，默认未 true
      .enableLogger(true)
      .create();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
    initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  /// Get 请求原始数据
  void requestGet() async {
    logger.i("m2331essage");
    var appResponse = await get("shop/allProduct");
    appResponse.when(success: (dynamic) {
      // var size = model.data?.length;
      logger.i("成功返回$dynamic");
    }, failure: (String msg, int code) {
      logger.e("失败了：msg=$msg/code=$code");
    });
  }

  /// Get 请求数据，不带泛型
  // void requestGet1() async {
  //   var appResponse = await get("banner/json", decodeType: BannerModel());
  //   appResponse.when(success: (model) {
  //     var size = model.data?.length;
  //     debugPrint("不带泛型成功返回$size条");
  //   }, failure: (String msg, int code) {
  //     debugPrint("失败了：msg=$msg/code=$code");
  //   });
  // }

  /// Get 请求数据，完整的泛型
  void requestGet2() async {
    // var appResponse = await get<BannerModel, BannerModel>("banner/json",
    //     decodeType: BannerModel());
    // appResponse.when(success: (model) {
    //   var size = model.data?.length;
    //   debugPrint("成功返回$size条");
    // }, failure: (String msg, int code) {
    //   debugPrint("失败了：msg=$msg/code=$code");
    // });
  }

  /// Post 请求
  void requestPost() async {
    // var appResponse = await post<UserWrapperModel, UserWrapperModel>(
    //     "user/login",
    //     decodeType: UserWrapperModel(),
    //     queryParameters: {"username": '你的账号', "password": '你的密码'});
    // appResponse.when(success: (UserWrapperModel model) {
    //   var nickname = model.data?.nickname;
    //   debugPrint("成功返回nickname=$nickname");
    // }, failure: (String msg, int code) {
    //   debugPrint("失败了：msg=$msg/code=$code");
    // });
  }

  /// Post 请求
  void requestPostFile() async {
    // var path =
    //     '/Users/apple/Library/Developer/CoreSimulator/Devices/89F6C1CC-378B-48B3-9B8F-BA43E7870781/data/Containers/Data/Application/05B810A0-7552-4C3A-8080-800C06A15EC7/tmp/image_picker_289C3878-B39A-41AC-907F-18AE7A9DAE6E-8483-00001BCFA0738BBB.jpg';
    // // /Users/apple/Library/Developer/CoreSimulator/Devices/89F6C1CC-378B-48B3-9B8F-BA43E7870781/data/Containers/Data/Application/05B810A0-7552-4C3A-8080-800C06A15EC7/tmp/image_cropper_CAE43778-5308-4CC7-8E37-4F3BF349F17A-8483-00001BBCCBDDBD46.jpg
    //
    // // await request('/v1/task/task/headPortrait', data: params, options: {
    // //   'method': 'post',
    // //   'contentType': 'formData',
    // // });
    //
    // var params = {'file': await MultipartFile.fromFile(path)};
    //
    // var appResponse = await post<UserWrapperModel, UserWrapperModel>(
    //     "v1/task/task/headPortrait",
    //     options: Options(contentType: 'formData'),
    //     decodeType: UserWrapperModel(),
    //     data: params);
    //
    // appResponse.when(success: (UserWrapperModel model) {
    //   var nickname = model.data?.nickname;
    //   debugPrint("成功返回nickname=$nickname");
    // }, failure: (String msg, int code) {
    //   debugPrint("失败了：msg=$msg/code=$code");
    // });
  }

  /// 自定义Decoder的 Post 请求
  void requestCustomDecoderPost() async {
    // var appResponse = await post<UserModel, UserModel>("user/login",
    //     decodeType: UserModel(),
    //     httpDecode: MyHttpDecoder.getInstance(),
    //     queryParameters: {"username": '', "password": ''});
    // appResponse.when(success: (UserModel model) {
    //   var nickname = model.nickname;
    //   debugPrint("成功返回nickname=$nickname");
    // }, failure: (String msg, int code) {
    //   debugPrint("失败了：msg=$msg/code=$code");
    // });
  }

  /// 自定义Decoder的 Get 请求
  void requestCustomGet() async {
    // var appResponse = await get<BannerBean, List<BannerBean>>("banner/json",
    //     decodeType: BannerBean(), httpDecode: MyHttpDecoder.getInstance());
    // appResponse.when(success: (List<BannerBean> model) {
    //   var size = model.length;
    //   debugPrint("成功返回$size条");
    // }, failure: (String msg, int code) {
    //   debugPrint("失败了：$msg");
    // });
  }

  /// 自定保存和携带 cookie 的请求
  void requestCookieGet() async {
    // var appResponse = await get<CollectModel, CollectModel>(
    //     "lg/collect/list/0/json",
    //     decodeType: CollectModel(),
    //     httpDecode: MyHttpDecoder.getInstance());
    // appResponse.when(success: (CollectModel model) {
    //   var size = model.datas?.length;
    //   debugPrint("成功返回$size条");
    // }, failure: (String msg, int code) {
    //   debugPrint("失败了：$msg");
    // });
  }

  /// 带缓存的 Get 请求
  void requestCacheGet() async {
    // var appResponse = await get<BannerModel, BannerModel>("banner/json",
    //     options: buildCacheOptions(const Duration(days: 7)),
    //     decodeType: BannerModel());
    // appResponse.when(success: (BannerModel model) {
    //   var size = model.data?.length;
    //   debugPrint("成功返回$size条");
    // }, failure: (String msg, int code) {
    //   debugPrint("失败了：msg=$msg/code=$code");
    // });
  }

  /// 通过回调解析返回的请求
  void requestCallBack() async {
    // var appResponse = await get<BannerModel, List<BannerBean>>("banner/json",
    //     options: buildCacheOptions(const Duration(days: 7)),
    //     decodeType: BannerModel(), converter: (response) {
    //       var errorCode = response.data['errorCode'];
    //
    //       /// 请求成功
    //       if (errorCode == 0) {
    //         var data = response.data['data'];
    //         var dataList = List<BannerBean>.from(
    //             data.map((item) => BannerBean.fromJson(item)).toList());
    //         return Result.success(dataList);
    //       } else {
    //         var errorMsg = response.data['errorMsg'];
    //         return Result.failure(msg: errorMsg, code: errorCode);
    //       }
    //     });
    // appResponse.when(success: (List<BannerBean> model) {
    //   debugPrint("成功返回${model.length}条");
    // }, failure: (String msg, int code) {
    //   debugPrint("失败了：msg=$msg/code=$code");
    // });
  }

  int a = 3;
}
