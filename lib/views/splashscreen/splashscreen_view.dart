import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mulai_flutter_2/theme/theme.dart';
import 'package:mulai_flutter_2/views/home/home.dart';
import 'package:mulai_flutter_2/views/login/login_view.dart';
import 'package:mulai_flutter_2/views/main/main_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenView extends StatefulWidget {
  const SplashscreenView({super.key});

  @override
  State<SplashscreenView> createState() => _SplashscreenViewState();
}

class _SplashscreenViewState extends State<SplashscreenView> {
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    init();
    navigate();
  }

  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  navigate() async {
    await Future.delayed(Duration(seconds: 2));
    bool? isLogin = sharedPreferences.getBool('isLogin');

    if (isLogin ?? false) {
      Get.to(MainView());
    } else {
      Get.to(LoginView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorPrimary,
      child: FlutterLogo(
        size: 50,
      ),
    );
  }
}
