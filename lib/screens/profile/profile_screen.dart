import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:session_manage/screens/profile/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.find<ProfileController>();

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
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                profileController.callAPI();
              },
              child: Text('Call API')),
        ],
      ),
    );
  }
}
