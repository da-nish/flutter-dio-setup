import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:session_manage/data/services/user_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin DioErrorHandler {
  handle401(DioError err, ErrorInterceptorHandler handler) async {
    final opts = Options(
        method: err.requestOptions.method, headers: err.requestOptions.headers);

    // refresh token
    final userServices = Get.find<UserServices>();
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('userRefreshToken')) {
      final String? data = prefs.getString('userRefreshToken');
      Map<String, dynamic> map = jsonDecode(data!);
      await userServices.refreshToken(map['token'], map['refreshToken']);
      final newToken = await userServices.userApi.getToken;

      //IMP
      err.requestOptions.headers["Authorization"] = "Bearer $newToken";

      final cloneReq = await userServices.userApi.dio.request(
        err.requestOptions.path,
        options: opts,
        data: err.requestOptions.data,
        queryParameters: err.requestOptions.queryParameters,
      );

      return handler.resolve(cloneReq);
    }
    return handler.next(err);
  }
}


/*
getDioException(DioError error) {
  switch (error.type) {
    case DioErrorType.cancel:
      break;
    case DioErrorType.connectTimeout:
      break;
    case DioErrorType.other:
      break;
    case DioErrorType.receiveTimeout:
      break;
    case DioErrorType.response:
      switch (error.response!.statusCode) {
        case 400:
          break;
        case 401:
          break;
        case 404:
          break;
        case 500:
          break;
        default:
          var responseCode = error.response!.statusCode;
          break;
      }
      break;
    case DioErrorType.sendTimeout:
      break;
  }

  //  try {

  // } on SocketException catch (e) {
  //   // Helper.printError(e.toString());
  //   return '';
  // }on FormatException catch (e) {
  //   // Helper.printError(e.toString());
  //   return '';
  // } catch (_) {
  //   return '';
  // }
}

*/