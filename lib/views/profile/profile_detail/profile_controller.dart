import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mulai_flutter_2/database/profile_data_table.dart';
import 'package:mulai_flutter_2/theme/theme.dart';
import 'package:mulai_flutter_2/views/profile/model/profile_model.dart';
import 'package:mulai_flutter_2/views/profile/profile_main_controller.dart';

class ProfileController extends GetxController {
  TextEditingController teUsername = TextEditingController();
  TextEditingController teContact = TextEditingController();
  TextEditingController teBirthDate = TextEditingController();
  TextEditingController teAddress = TextEditingController();
  Rx<File> profileImage = File('').obs;

  ProfileMainController profileMainController = Get.find();
  init(bool isEdit) {
    teUsername.text = profileMainController.profileModel.username ?? '';
    teContact.text = profileMainController.profileModel.contact ?? '';
    teBirthDate.text = profileMainController.profileModel.birthDate ?? '';
    teAddress.text = profileMainController.profileModel.address ?? '';
  }

  onSave() async {
    ProfileModel profileModel = ProfileModel()
      ..username = teUsername.text
      ..contact = teContact.text
      ..birthDate = teBirthDate.text
      ..address = teAddress.text
      ..image = profileImage.value.path;

    var result = false;
    var check = await ProfileDataTable().read();
    if (check.username != null) {
      print('Update');
      result = await ProfileDataTable().update(profileModel);
    } else {
      result = await ProfileDataTable().create(profileModel);
    }

    if (result) {
      Fluttertoast.showToast(
          msg: 'Data Profile Berhasil Disimpan', backgroundColor: Colors.green);
      profileMainController.init();
    } else {
      Fluttertoast.showToast(
          msg: 'Data Profile Gagal Disimpan', backgroundColor: Colors.red);
    }
  }
}
