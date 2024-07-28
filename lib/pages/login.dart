import 'package:collab_app/pages/dashboard.dart';
import 'package:collab_app/pages/sign_up.dart';
import 'package:collab_app/widgets/form_label_widget.dart';
import 'package:collab_app/widgets/title_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../helpers/constants.dart';
import '../helpers/widget_helper.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  Map<String,dynamic>? _userData;

  void _continue() {
    if(_formKey.currentState!.validate()) {
      print("passed");
      Get.to(const Dashboard());
    } else {
      print("passed");
      WidgetHelper.snackbar("Error", "Complete the form to continue");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(Constants.primaryTeal()),
      body: SingleChildScrollView(
        child: Column(
              children: [
                const SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  height: 200,
                  child: Image.asset("assets/images/logo.png",fit: BoxFit.cover,height: 200, width: 200,),
                ),
                Container(
                  height: 650,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(Constants.primaryWhite()),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TitleWidget(title: "Welcome Back!"),
                            Text(
                              "Please enter your credentials to access your account",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color(Constants.primaryGrey())
                              ),
                            ),
                            const SizedBox(height: 20,),
                            FormLabelText(title: "Email"),
                            TextFormField(
                              decoration: InputDecoration(
                                isDense: true,
                                filled: true,
                                hintText: 'Enter Email',
                                hintStyle: TextStyle(
                                    color:
                                    Color(Constants.primaryGrey())),
                                fillColor:
                                Color(Constants.primaryWhite()),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(8.0)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                      color:
                                      Color(Constants.primaryGrey())),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                        color: Color(
                                            Constants.primaryGrey()))),
                                errorBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(8.0),
                                    borderSide:
                                    BorderSide(color: Colors.red)),
                              ),
                              onChanged: (v) {

                              },
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return 'Enter your email';
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 20,),
                            FormLabelText(title: "Password"),
                            TextFormField(
                              decoration: InputDecoration(
                                isDense: true,
                                filled: true,
                                hintText: 'Enter Password',
                                hintStyle: TextStyle(
                                    color:
                                    Color(Constants.primaryGrey())),
                                fillColor:
                                Color(Constants.primaryWhite()),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(8.0)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                      color:
                                      Color(Constants.primaryGrey())),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                        color: Color(
                                            Constants.primaryGrey()))),
                                errorBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(8.0),
                                    borderSide:
                                    BorderSide(color: Colors.red)),
                              ),
                              onChanged: (v) {

                              },
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return 'Enter your password';
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.visiblePassword,
                            ),
                            const SizedBox(height: 32,),
                            Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(Constants.primaryTeal()),
                                  minimumSize: const Size(250 , 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0)
                                  )
                                ),
                                  onPressed: _continue,
                                  child:  Text(
                                    "Sign In",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(Constants.primaryWhite())
                                    ),
                                  )
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset("assets/images/line_image.png",width: 100,),
                                Text(
                                  "Or sign in with",
                                  style: TextStyle(
                                    color: Color(Constants.primaryBlack()),
                                    fontSize: 16
                                  ),
                                ),
                                Image.asset("assets/images/line_image.png",width: 100,),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    signInWithGoogle();
                                  },
                                  child: Container(
                                    height: 60,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            width: 1.0,
                                            color: Colors.black
                                        )
                                    ),
                                    child: ListTile(
                                      title: const Text(
                                        "Google",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14
                                        ),
                                      ),
                                      leading: Image.asset("assets/images/google logo.png", height: 40, width: 40,),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 60,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        width: 1.0,
                                        color: Colors.black
                                      )
                                    ),
                                    child: ListTile(
                                      title: const Text(
                                        "Facebook",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14
                                        ),
                                      ),
                                      leading: Image.asset("assets/images/fb logo.png",height: 40, width: 40,),
                                    ),
                                  ),
                                )

                              ],
                            ),
                            const SizedBox(height: 20,),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                      "Don't have an account?",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(Constants.primaryBlack()),
                                      fontSize: 16
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(const SignUpPage());
                                    },
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color(Constants.primaryTeal()),
                                        fontSize: 16
                                      ),
                                    ),
                                  )
                                ],
                              )
                            )


                          ],
                        ),
                      ),
                    ),
                  ),

              ],
            ),
      ),
    );
  }

  signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

   // UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    try {
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      print(userCredential.user?.displayName);
      print(userCredential.user?.email);
      print(userCredential.user?.phoneNumber);

      Get.to(const Dashboard());

    } on FirebaseAuthException catch (e) {
      print('Error: $e');

    } catch(ex) {
      print('Error: $ex');
    }
  }

  Future<UserCredential> signInFacebook() async {

    final LoginResult loginResult = await FacebookAuth.instance.login(permissions: ['email','public profile']);

    if(loginResult == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData();
      
      _userData = userData;
    } else {
      print(loginResult.message);
    }

    print(_userData!['email']);


    final OAuthCredential oAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return FirebaseAuth.instance.signInWithCredential(oAuthCredential);
  }
}
