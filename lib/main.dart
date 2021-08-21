import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:session_manage/screens/details/details_screen.dart';
import 'package:session_manage/screens/details/detials_binding.dart';
import 'package:session_manage/screens/home/home_binding.dart';
import 'package:session_manage/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
