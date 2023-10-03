// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jazeera_paints/view/day_test.dart';
import 'package:jazeera_paints/view/screens/dashboard/dashboard_screen.dart';
import 'package:jazeera_paints/view/screens/login/login_screen.dart';
import 'package:jazeera_paints/view/screens/order/order_screen.dart';
import 'package:jazeera_paints/view/screens/sample_event.dart';
import 'package:jazeera_paints/view/screens/splash/splash_screen.dart';
import 'package:jazeera_paints/view/screens/test.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define a custom theme that changes the text color based on the background color
        brightness: Brightness.light,
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black,
          ),
        ), colorScheme: ColorScheme(
        onBackground: Colors.black,
          brightness:Brightness.light,
          background: Colors.white,
          primary: Colors.blue,
          onPrimary: Colors.black,
          secondary: Colors.cyan,
          onSecondary: Colors.cyan,
          error: Colors.red,
          onError: Colors.red,
          surface: Colors.black,
          onSurface: Colors.indigo
      ),
      ),
      navigatorKey: Get.key,
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(exitFromApp: true),
        '/initialPage':(context) => DashboardScreen(exitFromApp: true),
        '/orders': (context) => OrderScreen(),
      },

    );
  }
}

