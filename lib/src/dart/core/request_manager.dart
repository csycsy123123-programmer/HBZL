import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

// 枚举类型 - 请求类型
enum HttpType { httpTypeGet, httpTypePost }
Logger logger =Logger();
class RequestManager {
  // 单例方法
  static Dio? _dioInstance;

  static Dio getRequestManager() {
    _dioInstance ??= Dio();
    return _dioInstance!;
  }

  // 对外抛出方法 - get请求
  static Future<Response> get(String requestUrl) async {
    return await _sendHttpRequest(HttpType.httpTypeGet, requestUrl);
  }

  // 对外抛出方法 - post请求
  static Future<Response> post(String requestUrl,
      {Map<String, dynamic>? queryParameters}) async {
    return await _sendHttpRequest(HttpType.httpTypePost, requestUrl,
        queryParameters: queryParameters);
  }

  // 对外抛出方法 - 下载文件
  static void downloadFile(String downLoadUrl, String savePath,
      void Function(bool result) func) async {
    DateTime timeStart = DateTime.now();
    logger.i('开始下载～当前时间：$timeStart');
    try {
      Dio dio = getRequestManager();
      var response = await dio.download(downLoadUrl, savePath,
          onReceiveProgress: (int count, int total) {
            String progressValue = (count / total * 100).toStringAsFixed(1);
            logger.i('当前下载进度:$progressValue%');
          }).whenComplete(() {
        DateTime timeEnd = DateTime.now();
        //用时多少秒
        int secondUse = timeEnd.difference(timeStart).inSeconds;
        logger.i('下载文件耗时$secondUse秒');
        func(true);
      });
    } catch (e) {
      logger.e("downloadFile报错：$e");
    }
  }

  // 私有方法 - 处理get请求、post请求
  static Future _sendHttpRequest(HttpType type, String requestUrl,
      {Map<String, dynamic>? queryParameters, dynamic data}) async {
    try {
      switch (type) {
        case HttpType.httpTypeGet:
          return await getRequestManager().get(requestUrl);
        case HttpType.httpTypePost:
          return await getRequestManager().post(requestUrl, queryParameters: queryParameters, data: data);
        default:
          throw Exception('报错了：请求只支持get和post');
      }
    } on DioException catch (e) {
      logger.e("报错:$e");
    }
  }
}
