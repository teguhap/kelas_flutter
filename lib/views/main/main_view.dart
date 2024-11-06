import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mulai_flutter_2/theme/theme.dart';
import 'package:mulai_flutter_2/views/main/main_controlller.dart';

class MainView extends GetView<MainControlller> {
  MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.listOfView[controller.currentIndex.value]),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  _bottomNavigationBar() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: colorPrimary,
      unselectedItemColor: Colors.grey,
      onTap: (value) {
        print(value);
      },
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: IconButton(
            onPressed: () {
              controller.currentIndex.value = 0;
            },
            icon: Obx(
              () => Column(
                children: [
                  Image.asset(
                    'assets/icons/ic_home.png',
                    color: controller.currentIndex.value == 0
                        ? colorPrimary
                        : Colors.grey,
                  ),
                  controller.currentIndex.value == 0
                      ? Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 3,
                              width: 24,
                              decoration: BoxDecoration(
                                color: colorPrimary,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ],
                        )
                      : SizedBox()
                ],
              ),
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: 'search',
          icon: Obx(
            () => IconButton(
              onPressed: () {
                controller.currentIndex.value = 1;
              },
              icon: Column(
                children: [
                  Image.asset(
                    'assets/icons/ic_search3.png',
                    color: controller.currentIndex.value == 1
                        ? colorPrimary
                        : Colors.grey,
                  ),
                  controller.currentIndex.value == 1
                      ? Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 3,
                              width: 24,
                              decoration: BoxDecoration(
                                color: colorPrimary,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ],
                        )
                      : SizedBox()
                ],
              ),
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: IconButton(
            onPressed: () {
              controller.currentIndex.value = 2;
            },
            icon: Obx(
              () => Column(
                children: [
                  Image.asset(
                    'assets/icons/ic_home.png',
                    color: controller.currentIndex.value == 2
                        ? colorPrimary
                        : Colors.grey,
                  ),
                  controller.currentIndex.value == 2
                      ? Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 3,
                              width: 24,
                              decoration: BoxDecoration(
                                color: colorPrimary,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ],
                        )
                      : SizedBox()
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
