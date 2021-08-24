import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:session_manage/data/api/api_auth.dart';
import 'package:session_manage/data/api/api_user.dart';
import 'package:session_manage/data/datamodel/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  final AuthApi authApi;
  final UserApi userApi;

  UserServices(this.authApi, this.userApi);

  Future<void> doLogin(
    String email,
    String password,
  ) async {
    AuthDTO userObj = await authApi.signIn(email, password);

    await setToken(userObj.token, userObj.refreshToken, userObj.expiresIn);
    // userApi.token('token'); //for test 401
  }

  Future<void> refreshToken(String accessToken, String refreshToken) async {
    Map<String, dynamic>? map =
        await authApi.refreshToken(accessToken, refreshToken);
    if (map != null) {
      await setToken(map['token'], map['refreshToken'], map['expiresIn']);
    }
  }

  Future<void> setToken(token, refreshtoken, expiry) async {
    expiry = expiry - 1750;
    var currentTime = DateTime.now();
    var expiresIn = currentTime.add(Duration(seconds: expiry));

    Map<String, dynamic> map = {
      'token': token,
      'refreshToken': refreshtoken,
      'expiresIn': expiresIn.toIso8601String()
    };

    DateFormat dateFormat = DateFormat("HH:mm:ss");
    print(
        '${dateFormat.format(currentTime)} + $expiry = ${dateFormat.format(expiresIn)}');

    String userData = jsonEncode(map);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userRefreshToken', userData);

    userApi.token(token);
  }

  Future<void> callAPI() async {
    await userApi.userDetails();
  }
}
