import 'package:get/get.dart';
import 'package:mulai_flutter_2/views/explore/explore_controller.dart';
import 'package:mulai_flutter_2/views/home/home_controller.dart';
import 'package:mulai_flutter_2/views/main/main_controlller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(MainControlller());
    Get.put(ExploreController());
  }
}
