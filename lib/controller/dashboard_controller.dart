import 'package:get/get.dart';

class DashboardController extends GetxController {
  Rx<int> selectedIndex = 0.obs;
  Rx<bool> isVisible = true.obs;
  Rx<bool> isDark = false.obs;
  Rx<String> category = "".obs;
  Rx<bool> isAlerted = false.obs;
  Rx<bool> isAlertOpen = false.obs;
  Rx<bool> isEmailAlert = false.obs;
  Rx<bool> isEmailReminder = false.obs;
  Rx<bool> isNotificationReminder = true.obs;
  Rx<bool> isNotificationAlert= true.obs;

}