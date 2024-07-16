import 'package:flutter/material.dart';

import '../helpers/constants.dart';

class TitleWidget extends StatelessWidget {
  final String title;

  const TitleWidget({super.key, required this.title,});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color(Constants.primaryBlack()),
          overflow: TextOverflow.ellipsis
        ),
      ),
    );
  }
}
