import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:hbzl/core/http/request_manager.dart';
import 'package:hbzl/core/utils/path.dart';

class Http {
  Http._internal();

  ///网络请求配置
  static final Dio dio = Dio(BaseOptions(
    baseUrl: "https://www.hanbaidt.cn:9091",
    headers: {"Authorization"	:"eyJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoidXNlciIsImV4cCI6MTcwNTU4MTk0MywidXNlcklkIjoiMTIwMDgyNDQ5NDYyOTg0NzA1IiwiaWF0IjoxNzA0MzcyMzQzfQ.B5F8aHvRWnLxTnpw70yzxi1a7YaiR8QCldldmavsrAM"},
    connectTimeout: const Duration(milliseconds: 5000),
    receiveTimeout: const Duration(milliseconds: 3000),
  ));

  ///初始化dio
  static void init() {
    ///初始化cookie
    PathUtils.getDocumentsDirPath().then((value) {
      var cookieJar =
      PersistCookieJar(storage: FileStorage("$value/.cookies/"));
      dio.interceptors.add(CookieManager(cookieJar));
    });

    //添加拦截器
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
      logger.i("请求之前");
      return handler.next(options);
    }, onResponse: (Response response, handler) {
      logger.i("响应之前");
      return handler.next(response);
    }, onError: (DioException e, handler) {
      logger.i("错误之前");
      handleError(e);
      return handler.next(e);
    }));
  }

  ///error统一处理
  static void handleError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        logger.w("连接超时");
        break;
      case DioExceptionType.sendTimeout:
        logger.w("请求超时");
        break;
      case DioExceptionType.receiveTimeout:
        logger.w("响应超时");
        break;
      case DioExceptionType.badResponse:
        logger.w("出现异常");
        break;
      case DioExceptionType.cancel:
        logger.w("请求取消");
        break;
      default:
        logger.w("未知错误");
        break;
    }
  }

  ///get请求
  static Future get(String url, [Map<String, dynamic>? params]) async {
    Response response;
    response = await dio.get(url, queryParameters: params);
    return response.data;
  }

  ///post 表单请求
  static Future post(String url, [Map<String, dynamic>? params]) async {
    Response response = await dio.post(url, queryParameters: params);
    return response.data;
  }

  ///post body请求
  static Future postJson(String url, [Map<String, dynamic>? data]) async {
    Response response = await dio.post(url, data: data);
    return response.data;
  }

  ///下载文件
  static Future downloadFile(urlPath, savePath) async {
    late Response response;
    try {
      response = await dio.download(urlPath, savePath,
          onReceiveProgress: (int count, int total) {
            //进度
            logger.i("$count $total");
          });
    } on DioException catch (e) {
      handleError(e);
    }
    return response.data;
  }
}
