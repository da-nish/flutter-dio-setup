import 'package:dio/dio.dart';
import 'package:session_manage/data/datamodel/user.dart';

class UserApi {
  UserApi(this.dio);

  final Dio dio;
  var _token;

  void token(String token) {
    _token = token;
    dio.options.headers["Authorization"] = "Bearer $token";
  }

  get getToken => _token;

  Future<UserDetails> userDetails() async => UserDetails.fromJson(
      (await dio.get("User/details")).data as Map<String, dynamic>);
}
