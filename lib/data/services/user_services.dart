import 'dart:convert';
import 'package:session_manage/data/api/api_auth.dart';
import 'package:session_manage/data/api/api_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  final AuthApi authApi;
  final UserApi userApi;

  UserServices(this.authApi, this.userApi);

  Future<void> doLogin(
    String email,
    String password,
  ) async {
    final res = await authApi.getUser(email: email, password: password);

    await setToken(res['token'], res['refreshtoken'], res['expiresIn']);
  }

  Future<void> refreshToken() async {
    Map<String, dynamic> map = await authApi.refreshToken();
    setToken(map['token'], map['refreshtoken'], map['expiresIn']);
  }

  Future<void> setToken(token, refreshtoken, expiry) async {
    var currentTime = DateTime.now();
    var expiresIn = currentTime.add(Duration(seconds: expiry));

    Map<String, dynamic> map = {
      'token': token,
      'refreshtoken': refreshtoken,
      'expiresIn': expiresIn.toIso8601String()
    };

    print('$currentTime + $expiry = $expiresIn');

    String userData = jsonEncode(map);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userRefreshToken', userData);

    userApi.setToken(token);
  }

  Future<void> callAPI() async {
    await userApi.getSingleUser();
  }
}
