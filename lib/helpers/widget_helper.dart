import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar_controller.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class WidgetHelper {
  static SnackbarController snackbar(String title, String message,
      [int? duration, double? marginTop]) =>
      Get.snackbar(
        title,
        message,
        animationDuration: const Duration(milliseconds: 500),
        overlayColor: Colors.black.withOpacity(.5),
        overlayBlur: 4,
        maxWidth: 450,
        titleText: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.close,
                  color: Colors.transparent,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF9F197E),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Get.closeAllSnackbars();
                    Get.back();
                  },
                  icon:  Icon(
                    Icons.close,
                    color: Color(Constants.primaryBlack()),
                  ),
                )
              ],
            ),
            Text(
              message,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff3F3532),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              color: Color(0xFF9F197E),
            ),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    'ok'.tr,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        messageText: const SizedBox(),
        colorText: const Color(0xFF008744),
        backgroundColor: const Color(0xFFf7fbf9),
        duration: Duration(seconds: duration ?? 4),
        borderWidth: 1,
        borderColor:  Color(Constants.primaryBlack()).withOpacity(0.5),
        isDismissible: true,
        margin: EdgeInsets.only(top: marginTop ?? 5, left: 14, right: 14),
      );
}