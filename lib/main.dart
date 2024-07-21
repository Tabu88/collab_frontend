import 'package:collab_app/pages/login.dart';
import 'package:collab_app/pages/splash_screens/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Collaboration App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home:  FirstTimeChecker(),
      routes: {
        '/splash': (context) => const AppearancePage(),
        '/login': (context) => const LoginPage(),
      },

    );
  }
}

class FirstTimeChecker extends StatefulWidget {
  @override
  _FirstTimeCheckerState createState() => _FirstTimeCheckerState();
}

class _FirstTimeCheckerState extends State<FirstTimeChecker> {
  @override
  void initState() {
    super.initState();
    _checkFirstTime();
  }

  Future<void> _checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? hasOpenedBefore = prefs.getBool('hasOpenedBefore');

    if (hasOpenedBefore == null || hasOpenedBefore == false) {
      // This is the first time the app is opened
      await prefs.setBool('hasOpenedBefore', true);
      Navigator.pushReplacementNamed(context, '/splash');
    } else {
      // The app has been opened before
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}