import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mulai_flutter_2/theme/theme.dart';
import 'package:mulai_flutter_2/views/home/home_controller.dart';
import 'package:mulai_flutter_2/views/profile/profile_detail/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  bool isEdit;

  ProfileView({super.key, required this.isEdit});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(initState: (state) {
      controller.init(isEdit);
    }, builder: (_) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 30,
            ),
            child: Obx(
              () => SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: InkWell(
                          onTap: () async {
                            final ImagePicker picker = ImagePicker();
                            final XFile? photo = await picker.pickImage(
                                source: ImageSource.gallery);
                            if (photo != null) {
                              controller.profileImage.value = File(photo.path);
                            }
                          },
                          child: controller.profileImage.value.path.isNotEmpty
                              ? CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      FileImage(controller.profileImage.value),
                                )
                              : CircleAvatar(
                                  radius: 50,
                                  child: Icon(
                                    Icons.person,
                                  ),
                                )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _buildTextField(
                        teController: controller.teUsername,
                        title: 'Username',
                        icon: Icons.person_2_outlined,
                        hint: 'Username'),
                    _buildTextField(
                        teController: controller.teContact,
                        title: 'Email or Phone Number',
                        icon: Icons.mail_outline_outlined,
                        hint: 'Contact'),
                    _buildTextFieldDate(context,
                        teController: controller.teBirthDate,
                        title: 'Birth Date',
                        icon: Icons.calendar_month_outlined,
                        hint: 'Birthdate'),
                    _buildTextField(
                        teController: controller.teAddress,
                        title: 'Adress',
                        icon: Icons.star_purple500_outlined,
                        hint: 'Your Adress'),
                    SizedBox(
                      width: Get.width,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.onSave();
                        },
                        child: Text(
                          'Save Changes',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
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
