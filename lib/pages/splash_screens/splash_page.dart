import 'dart:ui';

import 'package:collab_app/pages/login.dart';
import 'package:collab_app/pages/splash_screens/intro_page1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../helpers/constants.dart';
import 'intro_page2.dart';
import 'intro_page3.dart';

class AppearancePage extends StatefulWidget {
  const AppearancePage({super.key});

  @override
  State<AppearancePage> createState() => _AppearancePageState();
}

class _AppearancePageState extends State<AppearancePage> {
  PageController _controller = PageController();
  bool onLastPage = false;
  // double height ;

  @override
  Widget build(BuildContext context) {
    // height = MediaQuery.of(context).size.height;
    return  Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 2);
                });
              },
              children: [
                IntroPage1(),
                IntroPage2(),
                IntroPage3(),
              ],
            ),
          ),

          // dot indicators
          Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SmoothPageIndicator(
                        controller: _controller,
                        count: 3,
                        effect: WormEffect(
                          radius: 14,
                          dotColor: Color(Constants.primaryGrey()),
                          activeDotColor: Color(Constants.primaryTeal())
                        ),
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Color(Constants.primaryWhite()),
                              shape:  RoundedRectangleBorder(
                                side: BorderSide(
                                     width: 1.0,
                                  color: Color(Constants.primaryGrey())
                                ),
                                  borderRadius: const BorderRadius.all(Radius.circular(10))
                              ),
                              fixedSize: const Size(150, 60)
                            ),
                            onPressed: () {
                              _controller.jumpToPage(2);
                            },
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(Constants.primaryBlack())
                              ),
                            ) ,
                          ),
                        ),
                        const SizedBox(width: 20,),
                        Expanded(
                          child:
                          onLastPage
                              ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(Constants.primaryTeal()),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                              fixedSize: const Size(150, 60)
                            ),
                            onPressed: () {
                              Get.to(const LoginPage());
                            },
                            child: Text(
                              "Done",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(Constants.primaryWhite())
                              ),
                            ) ,
                          )
                              : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(Constants.primaryTeal()),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                              fixedSize: Size(150, 60)
                            ),
                            onPressed: () {
                              _controller.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            child: Text(
                              "Next",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(Constants.primaryWhite())
                              ),
                            ) ,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                  ],
                ),

            ),

        ]
      ),
    );
  }
}
