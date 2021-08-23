import 'dart:convert';

import 'package:dio/dio.dart';
import 'dart:math';

import 'package:session_manage/data/datamodel/auth.dart';

class AuthApi {
  final Dio dio;

  AuthApi(this.dio);

  Future<AuthDTO> signIn(String email, String password) async =>
      AuthDTO.fromJson((await dio
              .post("User/login", data: {'email': email, 'password': password}))
          .data as Map<String, dynamic>);

  Future<Map<String, dynamic>?> refreshToken(
      String accessToken, String refreshToken) async {
    var val = (((await dio.post("/Token",
        data: {'accessToken': accessToken, 'refreshToken': refreshToken}))));
    // print('refresh token: ${val.statusCode}');
    if (val.statusCode == 200) {
      return val.data as Map<String, dynamic>;
    } else {
      return null;
    }
  }

  String random(int len) {
    var random = Random.secure();
    var values = List<int>.generate(len, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }
}
