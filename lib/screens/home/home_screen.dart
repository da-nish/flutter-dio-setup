import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:session_manage/data/api/api_auth.dart';
import 'package:session_manage/data/api/api_user.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        debugPrint("app in onresumed");
        break;
      case AppLifecycleState.inactive:
        debugPrint("app in inactive");
        break;
      case AppLifecycleState.paused:
        debugPrint("app in paused");
        break;
      case AppLifecycleState.detached:
        debugPrint("app in detached");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // final homeController = Get.find<HomeController>();

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
                onPressed: () {
                  final AuthApi _client = Get.find<AuthApi>();
                  _client.getUser(
                      email: 'eve.holt@reqres.in', password: "cityslicka");
                },
                child: Text('Auth API')),
            ElevatedButton(
                onPressed: () {
                  final UserApi _client = Get.find<UserApi>();
                  _client.getSingleUser();
                },
                child: Text('User API')),
            ElevatedButton(
              onPressed: () {
                // Get.defaultDialog(title: "This is dialog");
                // Get.snackbar("Title", "This is getx snackbar",
                //     snackPosition: SnackPosition.BOTTOM);
                Get.toNamed("/detail");
              },
              child: Text("Go to detail"),
            )
          ],
        ),
      ),
    );
  }
}
