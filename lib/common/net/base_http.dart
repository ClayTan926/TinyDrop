import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tinydrop/config/global_config.dart';
import 'package:tinydrop/utils/log_utils.dart';

class BaseHttp {
  static const String Tag = "BaseHttp";

  //测试地址
  static const String DEV_SERVER_URL = "www.";

  //正式地址
  static const String RELEASE_SERVER_URL = "www.";

  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 5000;
  static Dio dio;

  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  static String getServerAddress() {
    if (GlobalConfig.isDebug) {
      return RELEASE_SERVER_URL;
    } else {
      return DEV_SERVER_URL;
    }
  }

  /// request method--
  static Future<Response<dynamic>> request(String url,
      {Map data, method, headers}) async {
    data = data ?? {}; //请求数据
    method = method ?? 'GET'; //请求方式
    headers = headers ?? {}; //请求头部

    /// restful 请求处理
    /// /gysw/search/hist/:user_id        user_id=27
    /// 最终生成 url 为     /gysw/search/hist/27
    data.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });
    Dio dio = createInstance();
    var result;
    LogUtils.v(
        "请求地址：【$method' + '  ' + '$getServerAddress()$url】请求头部：$headers请求参数：$data",
        Tag);
    try {
      Response response = await dio.request(url,
          data: data, options: new Options(method: method, headers: headers));
      result = response;
      LogUtils.v("响应数据： $response", Tag);
    } on DioError catch (e) {
      LogUtils.v("请求出错：$e", Tag);
    }

    return result;
  }

  static Dio createInstance() {
    if (dio == null) {
      BaseOptions options = new BaseOptions(
        baseUrl: getServerAddress(),
        connectTimeout: CONNECT_TIMEOUT,
        receiveTimeout: RECEIVE_TIMEOUT,
      );

      dio = new Dio(options);
    }

    return dio;
  }

  /// 清空 dio 对象
  static clear() {
    dio = null;
  }
}
