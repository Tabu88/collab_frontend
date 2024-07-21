import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../helpers/constants.dart';

class ViewMessagePage extends StatelessWidget {
  const ViewMessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
                      "View message",
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
            const SizedBox(height: 20,),
            Row(
              children: [
                Text(
                  "From :",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color(Constants.primaryBlack())
                  ),
                ),
                Text(
                  "To :",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color(Constants.primaryBlack())
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Text(
                  "From :",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color(Constants.primaryBlack())
                  ),
                ),
                Text(
                  "To :",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color(Constants.primaryBlack())
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
