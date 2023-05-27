import 'package:flatmate/Screens/AddNewReq.dart';
import 'package:flatmate/Screens/EditProfile.dart';
import 'package:flatmate/Screens/Search.dart';
import 'package:flatmate/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Profile.dart';
import 'home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    SearchScreen(),
    AddNew(),
    UserProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    final PageController _pageCtrl=PageController();
    void navigationTapped(int page) {
      setState(() {
        selected=page;
      });
    }
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(selected),
      ),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text(
          '𝑅𝑜𝑜𝓂𝒾𝑒𝓈',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
            Icons.home,
            color: selected == 0 ? blueColor : secondaryColor,
          )),
          BottomNavigationBarItem(
              icon: Icon(
            Icons.search,
            color: selected == 1 ? blueColor : secondaryColor,
          )),
          BottomNavigationBarItem(
              icon: Icon(
            Icons.add_circle,
            color: selected == 2 ? blueColor : secondaryColor,
          ),

          ),
          BottomNavigationBarItem(
              icon: Icon(
            Icons.person,
            color: selected == 3 ? blueColor : secondaryColor,
          )),
        ],
        activeColor: Colors.white,
        inactiveColor: CupertinoColors.placeholderText,
        onTap: (int idx) {
          navigationTapped(idx);
        },
      ),
    );
  }
}
