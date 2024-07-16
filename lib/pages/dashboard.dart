import 'package:collab_app/controller/dashboard_controller.dart';
import 'package:collab_app/pages/add_task.dart';
import 'package:collab_app/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../helpers/constants.dart';
import '../helpers/widget_helper.dart';
import 'home.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final DashboardController _dashboardController = Get.put(DashboardController());

  void _navigateBottomBar(int index) {
      setState(() {
        _dashboardController.isVisible.value = false;
        _dashboardController.selectedIndex.value = index;
      });
  }

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    AddTaskPage(),
    ProfilePage(),
  ];

  _initPage() {
    _dashboardController.selectedIndex.value = 0;
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, _initPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: _widgetOptions.elementAt(_dashboardController.selectedIndex.value),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _dashboardController.selectedIndex.value,
          backgroundColor: Color(Constants.primaryWhite()),
          selectedItemColor: Color(Constants.primaryTeal()),
          unselectedItemColor: Color(Constants.primaryGrey()),
          onTap: (index) {
            _navigateBottomBar(index);
            print("$index");
          },
          items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined, size: 30,),
                  label: "Home"
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add_circle_outline, size: 30,),
                  label: "Add"
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_2_outlined, size: 30,),
                  label: "Profile"
                ),
          ],
        )
      ),
    );
  }
}
