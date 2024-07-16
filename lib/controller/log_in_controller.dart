

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../helpers/http_helper.dart';

class LogInController extends GetxController {
  Rx<String> userEmail = "".obs;
  Rx<String> userPassword = "".obs;
  Rx<String> userName = "".obs;
  Rx<String> errorMessage = "".obs;

  resetController() {
    userEmail = "".obs;
    userPassword = "".obs;
    userName = "".obs;
    errorMessage = "".obs;
  }

  Future<dynamic> createUser() async {
    try {
      var jsonData = {
        "name": userName,
        "email": userEmail,
        "password": userPassword
      };
      final response = await HttpHelper().completePost("/SendTour", jsonData);
      if ((response is bool) == true) {
        return true;
      } else {
        errorMessage.value = response["message"].toString();
        return false;
      }
    } catch (e) {
      return e.toString();
    }
  }
}