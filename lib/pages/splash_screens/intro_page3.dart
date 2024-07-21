import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../helpers/constants.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: SvgPicture.asset(
                'assets/images/undraw_project_completed_re_jr7u.svg',
                width: 200,
                height: 300,
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Text(
                "Achieve higher team status with better analysis",
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