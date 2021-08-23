import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:session_manage/data/api/api_auth.dart';
import 'package:session_manage/data/api/api_user.dart';
import 'package:session_manage/data/services/user_services.dart';
import 'package:session_manage/dio/logging.dart';
import 'package:session_manage/screens/profile/profile_screen.dart';
import 'package:session_manage/screens/profile/profile_binding.dart';
import 'package:session_manage/screens/home/home_binding.dart';
import 'package:session_manage/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Application extends StatelessWidget {
  Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dioLogger = PrettyDioLogger(
        requestHeader: true,
        responseHeader: false,
        requestBody: true,
        responseBody: false,
        error: true,
        compact: false,
        maxWidth: 90);

    Get.put(AuthApi(Dio(BaseOptions(
      receiveDataWhenStatusError: true,
      baseUrl:
          'https://aquaapimanagementservice.azure-api.net/aquaclientapi-uat/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ))
      ..interceptors.add(dioLogger)));

    Get.put(UserApi(Dio(BaseOptions(
      receiveDataWhenStatusError: true,
      baseUrl:
          'https://aquaapimanagementservice.azure-api.net/aquaclientapi-uat/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ))
      ..interceptors.add(Logging())
      ..interceptors.add(dioLogger)));

    Get.put(UserServices(Get.find<AuthApi>(), Get.find<UserApi>()));

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
            name: "/home", page: () => HomeScreen(), binding: HomeBinding()),
        GetPage(
            name: "/profile",
            page: () => ProfileScreen(),
            binding: ProfileBinding()),
      ],
      initialRoute: "/home",
    );
  }
}
