import 'package:cart/models/data_model.dart';
import 'package:cart/models/user_model.dart';
import 'package:cart/services/load_user_info_service.dart';
import 'package:get/state_manager.dart';

import '../services/load_data_service.dart';

class MainController extends GetxController {
  var userModel = Rxn<UserModel>();
  var appDataModel = Rxn<AppDataModel>();
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
