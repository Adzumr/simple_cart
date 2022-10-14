import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/data_model.dart';

Future<AppDataModel?> getData() async {
  AppDataModel? appDataModel;
  try {
    final response = await rootBundle.loadString('assets/data.json');
    appDataModel = AppDataModel.fromJson(jsonDecode(response));
  } on Exception {
    Get.snackbar(
      "Error",
      "Can't load data",
    );
  }
  return appDataModel;
}
