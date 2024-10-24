import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mulai_flutter_2/theme/theme.dart';
import 'package:mulai_flutter_2/views/home/home%20copy.dart';
import 'package:mulai_flutter_2/views/home/home.dart';
import 'package:mulai_flutter_2/views/login/login_view.dart';
import 'package:mulai_flutter_2/views/profile/profile_view.dart';
import 'package:mulai_flutter_2/views/profile/setting_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mulai Flutter',
      theme: ligthTheme,
      routes: {
        '/home': (context) => HomeView(),
        '/profile': (context) => ProfileView(),
        '/login': (context) => LoginView(),
        '/setting': (context) => SettingView(),
      },
      home: LoginView(),
    );
  }
}
