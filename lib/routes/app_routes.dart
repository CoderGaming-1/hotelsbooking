import 'package:flutter/material.dart';
import 'package:hotelsbooking/presentation/favorite_screen/favorite_screen.dart';
import 'package:hotelsbooking/presentation/home_one_screen/home_one_screen.dart';
import 'package:hotelsbooking/presentation/mybooking_screen/mybooking_screen.dart';
import 'package:hotelsbooking/presentation/on_boarding_screen/on_boarding_screen.dart';
import 'package:hotelsbooking/presentation/myprofile_page/myprofile_page.dart';
import 'package:hotelsbooking/presentation/editprofile_screen/editprofile_screen.dart';
class AppRoutes {
  static const String onBoardingScreen = '/on_boarding_screen';
  static const String homeOneScreen = '/home_one_screen';
  static const String homeOneInitialPage = '/home_one_initial_page';
  static const String mybookingScreen = '/mybooking_screen';
  static const String initialRoute = '/initialRoute';
  static const String myprofileScreen = '/myprofile_screen';
  static const String favoriteScreen = '/favorite_screen';
  static const String editProfileScreen = '/editprofile_screen';
  static Map<String, WidgetBuilder> get routes => {
    editProfileScreen: EditprofileScreen.builder,
    onBoardingScreen: (context) => OnboardingScreen(),
    homeOneScreen: HomeOneScreen.builder,
    mybookingScreen: MybookingScreen.builder,
    myprofileScreen: MyprofilePage.builder,
    favoriteScreen : FavoriteScreen.builder,
    initialRoute: (context) => OnboardingScreen(),
  };
}