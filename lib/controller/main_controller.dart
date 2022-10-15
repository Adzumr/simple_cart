import 'package:cart/models/data_model.dart';
import 'package:cart/models/user_model.dart';
import 'package:cart/services/load_user_info_service.dart';
import 'package:get/state_manager.dart';

import '../models/cart_model.dart';
import '../services/load_data_service.dart';

class MainController extends GetxController {
  var userModel = Rxn<UserModel>();
  var appDataModel = Rxn<AppDataModel>();
  List<CartModel> cartList = [
    CartModel(
      price: 500,
      product: "Juice",
      quantity: 15,
    ),
    CartModel(
      price: 237,
      product: "Fish",
      quantity: 25,
    ),
    CartModel(
      price: 200,
      product: "Steck",
      quantity: 20,
    ),
  ].obs;
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
}
