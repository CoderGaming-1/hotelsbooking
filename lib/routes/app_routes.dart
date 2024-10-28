import 'package:flutter/material.dart';
import 'package:hotelsbooking/presentation/home_one_screen/home_one_screen.dart';
import 'package:hotelsbooking/presentation/mybooking_screen/mybooking_screen.dart';
import 'package:hotelsbooking/presentation/on_boarding_screen/on_boarding_screen.dart';


class AppRoutes {
  static const String onBoardingScreen = '/on_boarding_screen';
  static const String homeOneScreen = '/home_one_screen';
  static const String homeOneInitialPage = '/home_one_initial_page';
  static const String mybookingScreen = '/mybooking_screen';
  static const String initialRoute = '/initialRoute';
  static Map<String, WidgetBuilder> get routes => {
    onBoardingScreen: (context) => OnboardingScreen(),
    homeOneScreen: HomeOneScreen.builder,
    // mybookingScreen: MyBookingScreen.builder,
    initialRoute: (context) => OnboardingScreen(),
  };
}