import 'dart:convert';

import 'package:dio/dio.dart';
import 'dart:math';

class AuthApi {
  final Dio dio;

  AuthApi(this.dio);

  Future<Map<String, dynamic>> getUser(
      {required String email, required String password}) async {
    await dio.post('/login', data: {'email': email, 'password': password});

    Map<String, dynamic> map = {
      'token': random(15),
      'refreshtoken': random(5),
      'expiresIn': 10
    };
    return map;
  }

  Future<dynamic> refreshToken() async {
    await dio.get(
      '/unknown/2',
      //example token
    );

    Map<String, dynamic> map = {
      'token': random(15),
      'refreshtoken': random(5),
      'expiresIn': 10
    };

    print('refreshing token');
    return map;
  }

  String random(int len) {
    var random = Random.secure();
    var values = List<int>.generate(len, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  /* Future<AuthDTO> signIn(String email, String password) async =>
      AuthDTO.fromJson((await dio
              .post("User/login", data: {'email': email, 'password': password}))
          .data as Map<String, dynamic>);

  Future<void> resetPassword(String email) async =>
      (await dio.post("/User/resetpassword", data: {"email": email}));

  Future<AuthDTO> signInByCode(String code, String sid) async =>
      AuthDTO.fromJson((await dio.post("/User/2FA/$sid/$code")).data
          as Map<String, dynamic>);

  Future<void> resendCode(String sid) async =>
      (await dio.post("/User/2FA/resend", data: {"tfaSid": sid}));

  Future<SignUpLiveResponseDTO> signUpLive(SignUpLiveDTO dto) async =>
      SignUpLiveResponseDTO.fromJson(
          (await dio.post("/SignUp/live", data: dto.toJson())).data
              as Map<String, dynamic>);

  Future<void> signUpDemo(SignUpDemoDTO dto) async =>
      (await dio.post("/SignUp/demo", data: dto.toJson()));

  Future<void> verifyPhoneNumber(String twSid, String code) async =>
      (await dio.post("/SignUp/confirm", data: {"twSid": twSid, "code": code}));

  Future<void> resendPhoneVerification(String twSid) async =>
      (await dio.get("/SignUp/code/$twSid"));

  Future<EmailExistDTO> emailExist(String email) async =>
      EmailExistDTO.fromJson((await dio.get("/User/checkemail/$email")).data
          as Map<String, dynamic>); */

}
