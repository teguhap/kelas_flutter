import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mulai_flutter_2/theme/theme.dart';
import 'package:mulai_flutter_2/views/home/home_controller.dart';
import 'package:mulai_flutter_2/views/profile/profile_detail/profile_controller.dart';
import 'package:mulai_flutter_2/views/profile/profile_detail/profile_view.dart';
import 'package:mulai_flutter_2/views/profile/profile_main_controller.dart';

class ProfileMainView extends GetView<ProfileMainController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileMainController>(initState: (state) {
      controller.init();
    }, builder: (context) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 30,
            ),
            child: Obx(
              () => controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Row(
                            children: [
                              Expanded(child: Container()),
                              CircleAvatar(
                                radius: 50,
                                backgroundImage: FileImage(
                                    File(controller.profileModel.image ?? '')),
                              ),
                              Expanded(
                                child: IconButton(
                                  onPressed: () {
                                    Get.to(ProfileView(
                                      isEdit: true,
                                    ));
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Username',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              controller.profileModel.username ?? '-',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Email Or Phone Numbner',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              controller.profileModel.contact ?? '-',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Birth Date',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              controller.profileModel.birthDate ?? '-',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Address',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              controller.profileModel.address ?? '-',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        Spacer(),
                        SizedBox(
                          width: Get.width,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () {},
                            child: Text(
                              'Logout',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
            ),
          ),
        ),
      );
    });
  }

  _buildTextField({
    required String title,
    required TextEditingController teController,
    required IconData icon,
    required String hint,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
            child: TextField(
              controller: teController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  bottom: 10,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.35),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.35),
                  ),
                ),
                prefixIcon: Icon(
                  icon,
                  color: colorPrimary,
                ),
                hintText: hint,
                hintStyle: TextStyle(
                  fontSize: 12,
                  color: Color(0xff7D7E83),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildTextFieldDate(
    BuildContext context, {
    required String title,
    required TextEditingController teController,
    required IconData icon,
    required String hint,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
            child: TextField(
              controller: teController,
              onTap: () async {
                var result = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1945),
                  lastDate: DateTime.now(),
                );
                if (result != null) {
                  teController.text = result.toString().substring(0, 10);
                  print(teController.text);
                }
                // showCupertinoModalPopup(
                //   context: context,
                //   builder: (context) => Container(
                //     height: 200,
                //     child: CupertinoDatePicker(
                //       backgroundColor: Colors.white,
                //       onDateTimeChanged: (value) {},
                //     ),
                //   ),
                // );
              },
              readOnly: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  bottom: 10,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.35),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.35),
                  ),
                ),
                prefixIcon: Icon(
                  icon,
                  color: colorPrimary,
                ),
                hintText: hint,
                hintStyle: TextStyle(
                  fontSize: 12,
                  color: Color(0xff7D7E83),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
