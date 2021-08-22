import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:session_manage/data/api/api_auth.dart';
import 'package:session_manage/data/api/api_user.dart';
import 'package:session_manage/dio/logging.dart';
import 'package:session_manage/screens/details/details_screen.dart';
import 'package:session_manage/screens/details/detials_binding.dart';
import 'package:session_manage/screens/home/home_binding.dart';
import 'package:session_manage/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AuthApi(Dio(BaseOptions(
      receiveDataWhenStatusError: true,
      baseUrl: 'https://reqres.in/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ))
      ..interceptors.add(Logging())));

    Get.put(UserApi(Dio(BaseOptions(
      receiveDataWhenStatusError: true,
      baseUrl: 'https://reqres.in/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ))
      ..interceptors.add(Logging())));

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
            name: "/home", page: () => HomeScreen(), binding: HomeBinding()),
        GetPage(
            name: "/detail",
            page: () => DetailScreen(),
            binding: DetailBinding()),
      ],
      initialRoute: "/home",
    );
  }
}
