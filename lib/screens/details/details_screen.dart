import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:session_manage/screens/home/home_controller.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final apiService = Get.find<ApiService>();
    // final homeController = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Screen"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
    );
  }
}
