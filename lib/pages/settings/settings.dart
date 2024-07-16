import 'package:collab_app/pages/dashboard.dart';
import 'package:collab_app/widgets/menu_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../helpers/constants.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Card(
                      elevation: 3.0,
                      child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(child: Icon(Icons.arrow_back_ios,color: Color(Constants.primaryBlack()),))),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Center(
                    child: Text(
                      "Settings",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Color(Constants.primaryBlack())),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            Card(
              elevation: 3.0,
              color: Color(Constants.primaryLightGrey()),
              child: Container(
                height: 450,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today's Tasks",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(Constants.primaryBlack())
                        ),
                      ),
                      const SizedBox(height: 10,),
                      MenuTile(
                          iconData: Icons.password_outlined,
                          title: "Reset Password",
                          subtitle: "Change password, reset password",
                          navigation: () {
                            Get.to(const Dashboard());
                          }),
                      MenuTile(
                          iconData: Icons.format_paint_rounded,
                          title: "Appearance",
                          subtitle: "Change theme & tabs",
                          navigation: () {
                            Get.to(const Dashboard());
                          }),
                      MenuTile(
                          iconData: Icons.calendar_today_outlined,
                          title: "Reminder Settings",
                          subtitle: "Customize reminder & calendar",
                          navigation: () {
                            Get.to(const Dashboard());
                          }),
                      MenuTile(
                          iconData: Icons.public,
                          title: "Language",
                          subtitle: "Set your language",
                          navigation: () {
                            Get.to(const Dashboard());
                          }),

                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
