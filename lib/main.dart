import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mulai_flutter_2/config/main_binding.dart';
import 'package:mulai_flutter_2/helper/database_helper.dart';
import 'package:mulai_flutter_2/theme/theme.dart';
import 'package:mulai_flutter_2/views/home/home%20copy.dart';
import 'package:mulai_flutter_2/views/home/home.dart';
import 'package:mulai_flutter_2/views/login/login_view.dart';
import 'package:mulai_flutter_2/views/main/main_view.dart';
import 'package:mulai_flutter_2/views/profile/profile_detail/profile_view.dart';
import 'package:mulai_flutter_2/views/splashscreen/splashscreen_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.database;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mulai Flutter',
      theme: ligthTheme,
      routes: {
        '/home': (context) => HomeView(),
        '/profile': (context) => ProfileView(
              isEdit: false,
            ),
        '/login': (context) => LoginView(),
      },
      initialBinding: MainBinding(),
      home: SplashscreenView(),
    );
  }
}
