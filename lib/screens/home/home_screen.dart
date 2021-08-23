import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:session_manage/screens/home/home_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  await homeController.login();
                  Get.toNamed("/profile");
                },
                child: Text('Login')),
          ],
        ),
      ),
    );
  }
}
