import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as GetX;
import 'package:session_manage/data/services/user_services.dart';
import 'package:session_manage/dio/dio_error_handler.dart';
import 'package:session_manage/dio/dio_request_handler.dart';
import 'package:session_manage/dio/dio_response_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logging extends Interceptor
    with DioErrorHandler, DioResponseHandler, DioRequestHandler {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print('REQUEST[${options.method}] => PATH: ${options.path}');

    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('userRefreshToken')) {
      final String? data = prefs.getString('userRefreshToken');
      Map<String, dynamic> map = jsonDecode(data!);
      // print('requesting : $map');

      DateTime expiresIn = DateTime.parse(map['expiresIn']);
      DateTime now = DateTime.now();
      print(expiresIn);
      print(now);
      if (now.isAfter(expiresIn)) {
        print('calling after expiry');
        final UserServices middleware = GetX.Get.find<UserServices>();
        await middleware.refreshToken();
      } else {
        print('token is active');
      }
    }

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );

    return super.onResponse(response, handler);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    print(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );

    switch (err.type) {
      case DioErrorType.cancel:
        break;
      case DioErrorType.connectTimeout:
        break;
      case DioErrorType.other:
        break;
      case DioErrorType.receiveTimeout:
        break;
      case DioErrorType.response:
        switch (err.response!.statusCode) {
          case 400:
            break;
          case 401:
            return handle401(err, handler);
          case 404:
            break;
          case 500:
            break;
          default:
            break;
        }
        break;
      case DioErrorType.sendTimeout:
        break;
    }

    return super.onError(err, handler);
  }
}
