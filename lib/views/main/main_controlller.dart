import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mulai_flutter_2/views/home/home.dart';
import 'package:mulai_flutter_2/views/explore/views/explore_view.dart';
import 'package:mulai_flutter_2/views/home/home.dart';
import 'package:mulai_flutter_2/views/profile/profile_main_view.dart';
import 'package:mulai_flutter_2/views/profile/profile_detail/profile_view.dart';

class MainControlller extends GetxController {
  RxInt currentIndex = 0.obs;

  List<Widget> listOfView = [
    HomeView(),
    ExploreView(),
    ProfileMainView(),
  ];
}
