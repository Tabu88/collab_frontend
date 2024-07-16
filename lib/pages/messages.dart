import 'package:collab_app/pages/view_message.dart';
import 'package:collab_app/widgets/message_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../helpers/constants.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  int _currentPrimaryTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                            child: Center(
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Color(Constants.primaryBlack()),)
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Center(
                      child: Text(
                        "Messages",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Color(Constants.primaryBlack())),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                      },
                      child: Card(
                        elevation: 3.0,
                        child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(child: Icon(Icons.more_vert,color: Color(Constants.primaryBlack()),))),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: TabBar(
                  labelStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                  unselectedLabelStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  indicatorColor: Color(Constants.primaryTeal()),
                  indicator: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Color(Constants.primaryWhite()),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: const EdgeInsets.all(5.0),
                  labelColor: Color(Constants.primaryTeal()),
                  unselectedLabelColor: Color(Constants.primaryGrey()),
                  onTap: (i) {
                    setState(() {
                      _currentPrimaryTabIndex = i;
                    });
                  },
                  tabs: const [
                    Tab(
                      text: "All",
                    ),
                    Tab(
                      text: "Unread",
                    ),
                    Tab(
                      text: "Sent",
                    )
                  ],

                ),
              ),
              const SizedBox(height: 20,),
              Text(
                "Today",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(Constants.primaryBlack())
                ),
              ),
              const SizedBox(height: 20,),
              Builder(
                builder: (_) {
                  if(_currentPrimaryTabIndex == 0) {
                    return  Column(
                      children: [
                        SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: ListView.builder(
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return MessageTile(
                                    image: "",
                                    message: "Kindly review your completion analysis",
                                    navigate: () {
                                      Get.to(const ViewMessagePage());
                                    },
                                    sender: "Automation");
                              }),
                        )
                      ],
                    );
                  } else if(_currentPrimaryTabIndex == 1) {
                    return Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                              const Color.fromRGBO(203, 228, 239, 0.3),
                              radius: 60,
                              child: SvgPicture.asset(
                                  "assets/icons/empty_sto.svg"),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'No tasks',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Color(Constants.primaryTeal())),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "All tasks you create will appear here",
                              style:  TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ]),
                    );
                  } else {
                    return Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                              const Color.fromRGBO(203, 228, 239, 0.3),
                              radius: 60,
                              child: SvgPicture.asset(
                                  "assets/icons/empty_sto.svg"),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'No tasks',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Color(Constants.primaryTeal())),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "All tasks you create will appear here",
                              style:  TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ]),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
