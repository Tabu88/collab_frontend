import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../helpers/constants.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/undraw_shared_goals_re_jvqd.svg',
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 20,),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Text(
                "Accomplish your team goals within time elapsed",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Color(Constants.primaryTeal())
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );;
  }
}