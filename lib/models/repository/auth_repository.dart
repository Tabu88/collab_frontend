import 'package:collab_app/helpers/widget_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AuthRepository {

  Future<void> signInWithGoogle({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      print(email + password);

    } on FirebaseAuthException catch(e) {
      String message = "";
      if(e.code == "weak-password") {
        message = "The password provided is too weak.";
      } else {
        message = "An account already exists with that email.";
      }
      WidgetHelper.snackbar(Firebase, message)
    }
    catch () {

    }
  }


}