

import 'package:firebase_auth/firebase_auth.dart';
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

  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(userCredential.user);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('Error: $e');
      return null;
    }
  }
  //
  // Future<http.Response> sendDataToApi(Map<String, dynamic> data, String token) async {
  //   final url = Uri.parse('https://your-api-endpoint.com/data');
  //   final response = await http.post(
  //     url,
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Bearer $token',
  //     },
  //     body: jsonEncode(data),
  //   );
  //   return response;
  // }

  // Future<void> sendDataWithAuth(Map<String, dynamic> data) async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     String? token = await user.getIdToken();
  //     if (token != null) {
  //        response = await sendDataToApi(data, token);
  //       if (response.statusCode == 200) {
  //         print('Data sent successfully');
  //       } else {
  //         print('Failed to send data: ${response.body}');
  //       }
  //     }
  //   }
  // }


}