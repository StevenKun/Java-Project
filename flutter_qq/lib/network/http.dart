import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterqq/network/GlobalConfig.dart';
import 'package:flutterqq/network/ResultCode.dart';

class DioManager {
  static DioManager _dioInstance;

  static DioManager getInstance() {
    if (_dioInstance == null) {
      _dioInstance = new DioManager();
    }
    return _dioInstance;
  }

  var dio = new Dio();

  DioManager() {
    dio.options.baseUrl = "http://39.106.227.134";
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;

    dio.interceptors
        .add(LogInterceptor(responseBody: GlobalConfig.isDebug)); //是否开启请求日志
    //dio.interceptors.add(CookieManager(CookieJar()));//缓存相关类，具体设置见https://github.com/flutterchina/cookie_jar
  }

  //get请求
  get(String url, Map<String, dynamic> params, Function successCallBack,
      Function errorCallBack) async {
    _requestHttp(url, successCallBack, 'get', params, errorCallBack);
  }

  //post请求
  post(String url, Map<String, dynamic> params, Function successCallBack,
      Function errorCallBack) async {
    _requestHttp(url, successCallBack, "post", params, errorCallBack);
  }

  _requestHttp(String url, Function successCallBack, String method,
      Map<String, dynamic> params, Function errorCallBack) async {
    var response;
    try {
      if (method == 'get') {
        if (params != null) {
          response = await dio.get(url, queryParameters: params);
        } else {
          response = await dio.get(url);
        }
      } else if (method == 'post') {
        if (params != null) {
          response = await dio.post(url, data: params);
        } else {
          response = await dio.post(url);
        }
      }
    } on DioError catch (error) {
      // 请求错误处理
      var errorResponse;

      if (error.response != null) {
        errorResponse = error.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      // 请求超时
      if (error.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = ResultCode.CONNECT_TIMEOUT;
      }
      // 一般服务器错误
      else if (error.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorResponse.statusCode = ResultCode.RECEIVE_TIMEOUT;
      }

      // debug模式才打印
      if (GlobalConfig.isDebug) {
        print('请求异常: ' + error.toString());
        print('请求异常url: ' + url);
        print('请求头: ' + dio.options.headers.toString());
        print('method: ' + dio.options.method);
      }
      _error(errorCallBack, error.message);
      return '';
    }

    // debug模式打印相关数据
    if (GlobalConfig.isDebug) {
      print('请求url: ' + url);
      print('请求头: ' + dio.options.headers.toString());
      if (params != null) {
        print('请求参数: ' + params.toString());
      }
      if (response != null) {
        print('返回参数: ' + response.toString());
      }
    }

    String dataStr = json.encode(response.data);
    Map<String, dynamic> dataMap = json.decode(dataStr);

    if (dataMap == null || dataMap['state'] == 0) {
      _error(
          errorCallBack,
          '错误码：' +
              dataMap['errorCode'].toString() +
              ',' +
              response.data.toString());
    } else if (successCallBack != null) {
      successCallBack(dataMap);
    }
  }

  _error(Function errorCallBack, String error) {
    if (errorCallBack != null) {
      errorCallBack(error);
    }
  }
}
