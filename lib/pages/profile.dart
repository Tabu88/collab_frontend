import 'package:collab_app/pages/settings/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/dashboard_controller.dart';
import '../helpers/constants.dart';
import 'messages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final DashboardController _dashboardController = Get.put(DashboardController());
  bool isAlertOpen = false;



  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child:  Column(
            children: [
              const SizedBox(height: 20,),
              Container(
                height: 500,
                width: double.infinity,
                // padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                decoration: BoxDecoration(
                  color: Color(Constants.primaryWhite())
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150,
                        width: 200,
                        child: Stack(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(Constants.primaryGrey()),
                              radius: 150,
                              backgroundImage: AssetImage(
                                "assets/images/portrait.jpg",
                              ),
                              // child: Image.asset(
                              //   "assets/images/portrait.jpg",
                              //    fit: BoxFit.fitWidth,
                              //    // height: 150,width: 150,
                              // ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 20,
                              child: CircleAvatar(
                                backgroundColor: Color(Constants.primaryLightGrey()),
                                radius: 20,
                                child: Icon(Icons.edit_rounded,size: 30,color: Color(Constants.primaryGrey()),),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Text(
                        "Diana Prince",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(Constants.primaryBlack())
                        ),
                      ),// name
                      const SizedBox(height: 20,),
                      Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(Constants.primaryGrey())
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Text(
                        "dennis.wabomba8@gmail.com",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(Constants.primaryBlack())
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Text(
                        "Phone Number",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(Constants.primaryGrey())
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Text(
                        "+254793988882",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(Constants.primaryBlack())
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "5 In Process Tasks",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Color(Constants.primaryLightGrey())
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            "34 Complete Tasks",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Color(Constants.primaryLightGrey())
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(Constants.primaryTeal()),
                              minimumSize: const Size(120 , 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0)
                              )
                          ),
                          onPressed: () {
                            Get.to(const MessagesPage());
                          },
                          child:  Text(
                            "Messages",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(Constants.primaryWhite())
                            ),
                          )
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                height: 130,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(Constants.primaryWhite())
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                      child: Text(
                        "Theme",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(Constants.primaryBlack())
                        ),
                      ),
                    ),
                    const Divider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                            child: Icon(Icons.sunny, size: 30, color: Color(Constants.primaryTeal()),)),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Switch to Dark Theme",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color(Constants.primaryBlack())
                                ),
                              ),
                              Text(
                                "Currently on Light Theme",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color(Constants.primaryGrey()),
                                    fontWeight: FontWeight.normal
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: CupertinoSwitch(
                              value: _dashboardController.isAlerted.value,
                              activeColor: Color(Constants.primaryTeal()),
                              onChanged: (v) {
                                setState(() {
                                  _dashboardController.isDark.value = v;
                                });
                              }),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                height: 130,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(Constants.primaryWhite())
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                      child: Text(
                        "Password",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color(Constants.primaryBlack())
                        ),
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Icon(Icons.lock, size: 30, color: Color(Constants.primaryTeal()),)),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Reset Password",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(Constants.primaryBlack())
                                  ),
                                ),
                                Text(
                                  "Reset your password",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Color(Constants.primaryGrey()),
                                      fontWeight: FontWeight.normal
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                height: _dashboardController.isAlertOpen.value ? 450 : 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(Constants.primaryWhite())
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                      child: Text(
                        "Alerts",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color(Constants.primaryBlack())
                        ),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      onTap: () {
                        setState(() {
                          _dashboardController.isAlertOpen.value = !_dashboardController.isAlertOpen.value;
                        });
                      },
                      leading: Icon(Icons.message, size: 30, color: Color(Constants.primaryTeal()),),
                      title: Text(
                        "Set preferences",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(Constants.primaryBlack())
                        ),
                      ),
                      subtitle: Text(
                        "Choose how you would like to be notified",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(Constants.primaryGrey()),
                            fontWeight: FontWeight.normal
                        ),
                      ),
                      trailing: _dashboardController.isAlertOpen.value
                          ? Icon(
                        Icons.keyboard_arrow_up,
                        size: 25,
                        color: Color(Constants.primaryTeal()),
                      )
                          : Icon(
                        Icons.keyboard_arrow_down,
                        size: 25,
                        color: Color(Constants.primaryTeal()),
                      )
                    ),
                    Obx(
                        () => _dashboardController.isAlertOpen.value
                            ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Task Alerts",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(Constants.primaryBlack())),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Email",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(Constants.primaryBlack())),
                                  ),
                                  CupertinoSwitch(
                                      value: _dashboardController
                                          .isEmailAlert.value,
                                      activeColor:
                                          Color(Constants.primaryTeal()),
                                      onChanged: (v) {
                                        setState(() {
                                          _dashboardController
                                              .isEmailAlert.value = v;
                                        });
                                      }),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Push Notification",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(Constants.primaryBlack())),
                                  ),
                                  CupertinoSwitch(
                                      value: _dashboardController
                                          .isNotificationAlert.value,
                                      activeColor:
                                          Color(Constants.primaryTeal()),
                                      onChanged: (v) {
                                        setState(() {
                                          _dashboardController
                                              .isNotificationAlert.value = v;
                                        });
                                      }),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Reminders",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(Constants.primaryBlack())),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Email",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(Constants.primaryBlack())),
                                  ),
                                  CupertinoSwitch(
                                      value: _dashboardController
                                          .isEmailReminder.value,
                                      activeColor:
                                          Color(Constants.primaryTeal()),
                                      onChanged: (v) {
                                        setState(() {
                                          _dashboardController
                                              .isEmailReminder.value = v;
                                        });
                                      }),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Push Notification",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(Constants.primaryBlack())),
                                  ),
                                  CupertinoSwitch(
                                      value: _dashboardController
                                          .isNotificationReminder.value,
                                      activeColor:
                                          Color(Constants.primaryTeal()),
                                      onChanged: (v) {
                                        setState(() {
                                          _dashboardController
                                              .isNotificationReminder.value = v;
                                        });
                                      }),
                                ],
                              ),
                            ],
                          ),
                        )
                      : const SizedBox()
                    )
                  ],
                ),
              ),
              const SizedBox(height: 32,),
              // Container(
              //   height: 100,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(15),
              //     color: Color(Constants.primaryLightGrey()),
              //   ),
              //   child: Center(
              //     child: ListTile(
              //       onTap: () {
              //         Get.to(const MessagesPage());
              //       },
              //       leading: Container(
              //         height: 80,
              //         width: 70,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(15),
              //           color: Color(Constants.primaryWhite()),
              //         ),
              //         child: const Icon(Icons.mail_outline_outlined,size: 35,),
              //       ),
              //       title: Text(
              //         "Message",
              //         style: TextStyle(
              //           fontSize: 18,
              //           fontWeight: FontWeight.w600,
              //           color: Color(Constants.primaryBlack())
              //         ),
              //       ),
              //       subtitle: Text(
              //         "Send a message to your team",
              //         style: TextStyle(
              //           fontSize: 14,
              //           fontWeight: FontWeight.normal,
              //           color: Color(Constants.primaryGrey())
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

            ],
          ),
      ),
    );
  }
}
