import 'package:baid_health_dev/controller/care_plan_controller.dart';
import 'package:baid_health_dev/controller/user_controller.dart';
import 'package:baid_health_dev/screens/care_plan_screen.dart';
import 'package:baid_health_dev/services/care_plan_services.dart';
import 'package:baid_health_dev/widgets/upcoming_schedule.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:healthcare/screens/home_screen.dart';
import 'package:baid_health_dev/screens/messages_screen.dart';
import 'package:baid_health_dev/screens/schedule_screen.dart';
import 'package:baid_health_dev/screens/settings_screen.dart';
import 'package:baid_health_dev/screens/home_screen.dart';
import 'package:get/get.dart';

class NavBarRoots extends StatefulWidget {
  @override
  State<NavBarRoots> createState() => _NavBarRootsState();
}

class _NavBarRootsState extends State<NavBarRoots> {
  int _selectedIndex = 0;
  final _screens = [
    HomeScreen(),
    UpcomingSchedule(),
    ScheduleScreen(),
    SettingScreen(),
  ];
  final CarePlanController carePlanController = Get.put(CarePlanController());
  final UserController userController = Get.put(UserController());
  //final CarePlanController _carePlanController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF7165D6),
          unselectedItemColor: Colors.black26,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          currentIndex: _selectedIndex,
          onTap: (index) {
            if (index == 1) {
              carePlanController.fetchDoencas(userController.token.value);
            }
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "Início"),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.heart_fill,
                ),
                label: "Saúde"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_outlined), label: "Agenda"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Configurações"),
          ],
        ),
      ),
    );
  }
}
