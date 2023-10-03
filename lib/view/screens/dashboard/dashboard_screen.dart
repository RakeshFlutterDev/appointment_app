// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jazeera_paints/util/dimensions.dart';
import 'package:jazeera_paints/view/screens/favorite/favorite_screen.dart';
import 'package:jazeera_paints/view/screens/order/order_screen.dart';
import 'package:jazeera_paints/view/screens/profile/my_account_screen.dart';
import 'package:jazeera_paints/view/screens/profile/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  final bool exitFromApp;
  const DashboardScreen({Key? key, required this.exitFromApp}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final BottomNavigationBarType _navigationType = BottomNavigationBarType.fixed;
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();
  final bool _canExit = GetPlatform.isWeb ? true : false;

  int _currentIndex = 0;

  final List<Widget> _children = [
    MyAccountScreen(),
    FavoriteScreen(),
    OrderScreen(),
    ProfileScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  bool _shouldExit = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex == 0) {
          // If on dashboard home screen, ask user to press back again to exit
          if (_shouldExit) {
            SystemNavigator.pop();
            return true; // Allow default back button behavior (exit the app)
          } else {
            setState(() {
              _shouldExit = true;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Back press again to exit'.tr, style: TextStyle(color: Colors.white)),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
                margin: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
              ),
            );
            return false; // Prevent default back button behavior
          }
        } else {
          // Navigate to the previous screen (homepage)
          setState(() {
            _currentIndex = 0;
          });
          return false; // Prevent default back button behavior
        }
      },
      child: Scaffold(
        key: _scaffoldKey,

        body: _children[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: _navigationType,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            elevation: 4,
            fixedColor: Colors.black,
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled,size: 35),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite,size: 35),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag,size: 35),
                label: 'Orders',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person,size: 35),
                label: 'Profile',
              )
            ],
          ),
        ),
    );
  }
}

