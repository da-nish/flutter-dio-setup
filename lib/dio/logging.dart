import 'package:dio/dio.dart';
import 'package:session_manage/dio/dio_error_handler.dart';
import 'package:session_manage/dio/dio_response_handler.dart';

class Logging extends Interceptor with DioErrorHandler, DioResponseHandler {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    // options.
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );

    switch (response.requestOptions.path) {
      case '/login':
        if (response.statusCode == 200) {
          setToken(response);
        }

        break;
      default:
    }

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
