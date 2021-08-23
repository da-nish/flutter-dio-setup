import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin DioRequestHandler {
  setToken(Response response) async {
    final res = response.data;

    Map<String, dynamic> map = {
      'token': res['token'],
      'refreshToken': res['refreshToken'],
      'expiresIn': res['expiresIn'],
    };

    String userData = jsonEncode(map);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userRefreshToken', userData);
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