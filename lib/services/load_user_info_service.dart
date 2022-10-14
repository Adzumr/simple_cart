import 'dart:convert';

import 'package:cart/models/user_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<UserModel?> getUser() async {
  UserModel? userModel;
  try {
    final response = await rootBundle.loadString('assets/user.json');
    userModel = UserModel.fromJson(jsonDecode(response));
  } on Exception {
    Get.snackbar(
      "Erro",
      "Can't load User Data",
    );
  }
  return userModel;
}
