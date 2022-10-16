import 'dart:developer';

import 'package:cart/models/data_model.dart';
import 'package:cart/models/user_model.dart';
import 'package:cart/services/load_user_info_service.dart';
import 'package:get/state_manager.dart';

import '../models/cart_model.dart';
import '../services/load_data_service.dart';

class MainController extends GetxController {
  @override
  void onInit() {
    getDataService();
    getUserService();
    super.onInit();
  }

  var isLoading = false.obs;
  getDataService() async {
    isLoading.value = true;
    appDataModel.value = (await getData());
    isLoading.value = false;
  }

  getUserService() async {
    isLoading.value = true;
    userModel.value = (await getUser());
    isLoading.value = false;
  }

  var userModel = Rxn<UserModel>();
  var appDataModel = Rxn<AppDataModel>();
  final itemsList = {}.obs;
  void addItem(CartModel? cartModel) {
    if (itemsList.containsKey(cartModel)) {
      itemsList[cartModel] += 1;
    } else {
      itemsList[cartModel] = 1;
    }
    log("${itemsList.length}");
  }

  void removeItem(CartModel? cartModel) {
    if (itemsList.containsKey(cartModel) && itemsList[cartModel] == 1) {
      itemsList.removeWhere((key, value) => key == cartModel);
    } else {
      itemsList[cartModel] -= 1;
    }
  }
}
