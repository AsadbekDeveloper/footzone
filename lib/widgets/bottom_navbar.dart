import 'package:flutter/material.dart';
import 'package:footzone/screens/map/map_screen.dart';

import '../constants/colors.dart';
import '../screens/register/login_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedItemColor: textBlue,
        unselectedItemColor: mainGrey,
        showUnselectedLabels: true,
        onTap: (value) {
          switch (value) {
            case 0:
              {
                Navigator.pushNamed(context, '/');
                break;
              }
            case 1:
              {
                Navigator.pushNamed(context, MapPage.id);
                break;
              }
            case 2:
              {
                Navigator.pushNamed(context, LoginPage.id);
                break;
              }
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ]);
  }
}
