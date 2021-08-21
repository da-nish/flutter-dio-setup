import 'package:dio/dio.dart';
import 'package:session_manage/application.dart';

mixin DioErrorHandler {
  handle401(DioError err, ErrorInterceptorHandler handler) async {
    final opts = Options(
        method: err.requestOptions.method, headers: err.requestOptions.headers);

    //refresh token

    final cloneReq = await Application.userApi.dio.request(
        err.requestOptions.path,
        options: opts,
        data: err.requestOptions.data,
        queryParameters: err.requestOptions.queryParameters);

    return handler.resolve(cloneReq);
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