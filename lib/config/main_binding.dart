import 'package:get/get.dart';
import 'package:mulai_flutter_2/views/home/controller/home_controller.dart';
import 'package:mulai_flutter_2/views/main/main_controlller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    HomeController homeController = Get.put(HomeController());
    MainControlller mainController = Get.put(MainControlller());
  }
}
