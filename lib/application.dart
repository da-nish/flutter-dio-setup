import 'package:dio/dio.dart';
import 'package:session_manage/data/api/api_auth.dart';
import 'package:session_manage/data/api/api_user.dart';
import 'package:session_manage/dio/logging.dart';
import 'package:session_manage/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  static var authApi;
  static var userApi;

  Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    authApi = AuthApi(Dio(BaseOptions(
      receiveDataWhenStatusError: true,
      baseUrl: 'https://reqres.in/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    )));

    userApi = UserApi(Dio(BaseOptions(
      receiveDataWhenStatusError: true,
      baseUrl: 'https://reqres.in/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ))
      ..interceptors.add(Logging()));

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
