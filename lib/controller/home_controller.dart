import 'dart:convert';

import 'package:cart/models/data_model.dart';
import 'package:cart/models/user_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  DummyDataModel? dummyDataModel;
  UserModel? userModel;
  @override
  void onInit() async {
    super.onInit();
    readDataJson();
    readUserJson();
  }

  Future<DummyDataModel?> readDataJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    dummyDataModel = DummyDataModel.fromJson(jsonDecode(response));
    return dummyDataModel;
  }

  Future<UserModel?> readUserJson() async {
    final String response = await rootBundle.loadString('assets/user.json');
    userModel = UserModel.fromJson(jsonDecode(response));
    return userModel;
  }
}
