import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mulai_flutter_2/database/profile_data_table.dart';
import 'package:mulai_flutter_2/theme/theme.dart';
import 'package:mulai_flutter_2/views/profile/model/profile_model.dart';

class ProfileMainController extends GetxController {
  RxBool isLoading = true.obs;
  ProfileModel profileModel = ProfileModel();

  init() async {
    isLoading.value = true;
    profileModel = await ProfileDataTable().read();
    print(profileModel.toJson());
    isLoading.value = false;
  }
}
