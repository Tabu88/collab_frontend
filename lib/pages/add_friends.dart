import 'package:flutter/material.dart';

import '../helpers/constants.dart';

class AddFriend extends StatefulWidget {
  const AddFriend({super.key});

  @override
  State<AddFriend> createState() => _AddFriendState();
}

class _AddFriendState extends State<AddFriend> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: TextFormField(
                    decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      hintText: 'Search Friends...',
                      hintStyle: TextStyle(color: Color(Constants.primaryGrey())),
                      fillColor: Color(Constants.primaryLightGrey()),
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(8.0)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(8.0),
                        // borderSide: BorderSide(
                        //     color:
                        //     Color(Constants.primaryGrey())),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                              color: Color(Constants.primaryTeal())
                          )
                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                    onChanged: (v) {},
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'Search friends...';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.text,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(Constants.primaryLightGrey()),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: IconButton(
                      icon: Icon(Icons.filter_alt_sharp,size: 30,color: Color(Constants.primaryGrey()),),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20,),




          ],
        ),
      ),
    );
  }
}
