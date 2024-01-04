import 'package:flutter/material.dart';
import 'package:flutter_nb_net/flutter_net.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hbzl/core/http/request_manager.dart';
import 'package:hbzl/core/utils/toast.dart';
import 'dart:developer' as developer;

import 'package:logger/logger.dart';

import 'init/app_init.dart';

void main() {
  developer.log('123', name: '123456');
  var logger = Logger();
  //logger 方法示例
  logger.i("1231");
  logger.d("message");
  logger.f("message2");
  //get 方法示例
  String path = "https://www.hanbaidt.cn:9091//shop/allProduct";
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
  // ToastUtils.toast('1');
  //nb net 示例
  NetOptions.instance
      // header
      .addHeaders({
        "Authorization":
            'eyJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoidXNlciIsImV4cCI6MTcwNTIwNDgyNywidXNlcklkIjoiMTI1NjQyODQ3MjY4MzcyNDgxIiwiaWF0IjoxNzAzOTk1MjI3fQ.UUk2nRdzvGAm0FiPdzGWd7y736ryhbFyNSQYbsbUpMs'
      })
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
  AppInit.run();
}
