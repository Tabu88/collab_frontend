import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../helpers/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPrimaryTabIndex = 0;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/images/person.png",
                ),
                radius: 30,
              ),
              title:  Text(
                "Hi, Bruce",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Color(Constants.primaryBlack())
                ),
              ),
              subtitle: Text(
                "Welcome! Let's make today awesome.",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(Constants.primaryGrey())
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              onTapOutside: (event) {
                // WidgetHelper.closeKeyboard();
              },
              decoration: InputDecoration(
                hintText: "Search tasks...",
                hintStyle: TextStyle(color: Color(Constants.primaryGrey())),
                suffixIcon: const Icon(Icons.search_rounded),
                floatingLabelBehavior:
                FloatingLabelBehavior.never,
                enabledBorder:  OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(Constants.primaryTeal())
                  ),
                  borderRadius:  const BorderRadius.all(
                      Radius.circular(8.0)),
                ),
                filled: true,
                fillColor: Colors.grey.shade400,
                isDense: true,
                // disabledBorder: InputBorder.none,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(8.0)),
                ),
              ),
              style: const TextStyle(
                color: Colors.black,
              ),
              onChanged: (v) {

              },
            ),
            const SizedBox(height: 20,),
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
                   text: "Ongoing",
                  ),
                  Tab(
                    text: "In Progress",
                  ),
                  Tab(
                    text: "Completed",
                  )
                ],

              ),
            ),
            const SizedBox(height: 20,),
            Builder(
              builder: (_) {
                if(_currentPrimaryTabIndex == 0) {
                  return const Placeholder();
                } else if (_currentPrimaryTabIndex == 1) {
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
                                "assets/icons/empty_sto.svg", alignment: Alignment.center,),
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
            )
          ],
        ),
      ),
    );
  }
}
