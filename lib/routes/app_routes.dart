import 'package:flutter/material.dart';
import 'package:hotelsbooking/presentation/favorite_screen/favorite_screen.dart';
import 'package:hotelsbooking/presentation/home_one_screen/home_one_screen.dart';
import 'package:hotelsbooking/presentation/mybooking_screen/mybooking_screen.dart';
import 'package:hotelsbooking/presentation/on_boarding_screen/on_boarding_screen.dart';
import 'package:hotelsbooking/presentation/myprofile_page/myprofile_page.dart';
import 'package:hotelsbooking/presentation/editprofile_screen/editprofile_screen.dart';
import 'package:hotelsbooking/presentation/detail_screen/detail_screen.dart';
import 'package:hotelsbooking/presentation/from_details_screen/from_details_screen.dart';
import 'package:hotelsbooking/presentation/checkout_screen/checkout_screen.dart';
import 'package:hotelsbooking/presentation/filter_screen/filter_screen.dart';
import 'package:hotelsbooking/presentation/search_screen/search_screen.dart';
import 'package:hotelsbooking/presentation/payment_screen/payment_screen.dart';
import '../presentation/sign_up_screen/sign_up_screen.dart';

class AppRoutes {
  static const String onBoardingScreen = '/on_boarding_screen';
  static const String homeOneScreen = '/home_one_screen';
  static const String homeOneInitialPage = '/home_one_initial_page';
  static const String mybookingScreen = '/mybooking_screen';
  static const String initialRoute = '/initialRoute';
  static const String myprofileScreen = '/myprofile_screen';
  static const String favoriteScreen = '/favorite_screen';
  static const String editProfileScreen = '/editprofile_screen';
  static const String detailScreen = '/detail_screen';
  static const String fromdetailsScreen = '/fromdetails_screen';
  static const String checkoutScreen = '/checkout_screen';
  static const String filterScreen = '/filter_screen';
  static const String searchScreen = '/search_screen';
  static const String signUpScreen = '/sign_up_screen';
  static const String paymentScreen = '/payment_screen';
  static Map<String, WidgetBuilder> get routes => {
        paymentScreen: PaymentScreen.builder,
        searchScreen: SearchScreen.builder,
        filterScreen: FilterScreen.builder,
        checkoutScreen: CheckoutScreen.builder,
        detailScreen: DetailsScreen.builder,
        editProfileScreen: EditprofileScreen.builder,
        onBoardingScreen: (context) => OnboardingScreen(),
        homeOneScreen: HomeOneScreen.builder,
        mybookingScreen: MybookingScreen.builder,
        myprofileScreen: MyprofilePage.builder,
        favoriteScreen: FavoriteScreen.builder,
        initialRoute: (context) => OnboardingScreen(),
        signUpScreen: (context) => SignUpScreen(),
      };
}
