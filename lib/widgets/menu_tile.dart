import 'package:flutter/material.dart';

import '../helpers/constants.dart';

class MenuTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String subtitle;
  final Function() navigation;
  const MenuTile({super.key, required this.iconData, required this.title, required this.subtitle, required this.navigation});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
      child:  SizedBox(
        height: 80,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               CircleAvatar(
                 backgroundColor: Color(Constants.primaryLightGrey()),
                 radius: 25,
                 child: Icon(
                   iconData,
                   size: 20,
                   color: Color(Constants.primaryGrey()),
                 ),
               ),
               const SizedBox(width: 10,),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(
                     title,
                     style: TextStyle(
                         fontSize: 16,
                         fontWeight: FontWeight.w600,
                         color: Color(Constants.primaryBlack())),
                   ),
                   const SizedBox(height: 5,),
                   Text(
                     subtitle,
                     style: TextStyle(
                         fontSize: 12,
                         fontWeight: FontWeight.normal,
                         color: Color(Constants.primaryGrey())),
                   ),
                 ],
               ),
             ],
           ),
            Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Color(Constants.primaryBlack()),
              ),
            ],
        )
      ),
    );
  }
}
