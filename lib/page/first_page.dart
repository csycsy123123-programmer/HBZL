import 'package:flutter/material.dart';
import 'package:flutter_nb_net/flutter_net.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../core/http/request_manager.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      requestGet();
      logger.i("message.1231");
    });
    initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            BackButton(
              onPressed: () async {
                await Get.toNamed("/second");
                // 在导航完成后执行的其他代码
              },
            )
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
    logger.i("123");
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
}
