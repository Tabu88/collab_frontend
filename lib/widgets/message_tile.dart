import 'package:flutter/material.dart';

import '../helpers/constants.dart';

class MessageTile extends StatelessWidget {
  final String image;
  final String message;
  final String sender;
  final Function() navigate;
  const MessageTile({super.key, required this.image, required this.message, required this.navigate, required this.sender});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(Constants.primaryLightGrey()),
          radius: 30,
          child: Image.asset(image),
        ),
        title: Text(
          sender,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Color(Constants.primaryBlack())
          ),
        ),
        subtitle: Text(
          message,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Color(Constants.primaryGrey())
          ),
        ),
      )
    );
  }
}
