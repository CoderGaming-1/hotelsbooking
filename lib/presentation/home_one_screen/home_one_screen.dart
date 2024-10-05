import 'package:flutter/material.dart';
import 'package:hotelsbooking/core/app_export.dart';
import 'package:hotelsbooking/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:hotelsbooking/widgets/custom_bottom_bar.dart';
import 'package:hotelsbooking/presentation/home_one_screen/bloc/home_one_bloc.dart';
import 'package:hotelsbooking/presentation/home_one_screen/home_one_initial_page.dart';
import 'package:hotelsbooking/presentation/home_one_screen/models/home_one_model.dart';
// ignore_for_file: must_be_immutable

// class HomeOneScreen extends StatelessWidget {
//   HomeOneScreen({Key? key}) : super(key: key);
//   GlobalKey<NavigatorState> navigatorKey = GlobalKey();
//   static Widget builder(BuildContext context) {
//     return BlocProvider<HomeOneBloc>(
//       create: (context) => HomeOneBloc(HomeOneState(
//         HomeOneModelobj: HomeOneModel(),
//       ))
//     );
//   }
// }
class DefaultWidgets extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
class HomeOneScreen extends StatelessWidget {
  HomeOneScreen({Key? key})
      :
        super(
        key: key,
      );
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static Widget builder (BuildContext context) {
    return BlocProvider<HomeOneBloc>(
      create: (context) => HomeOneBloc(HomeOneState(
        homeOneModelObj: HomeOneModel(),
      ))
        ..add(HomeOneInitialEvent()),
      child: HomeOneScreen(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Navigator(
          key: navigatorKey,
          initialRoute: AppRoutes.homeOneInitialPage,
          onGenerateRoute: (routeSetting) => PageRouteBuilder(
            pageBuilder: (ctx, ani, ani1) =>
                getCurrentPage(context, routeSetting.name!),
            transitionDuration: Duration (seconds: 0),
          ),
        ),
        bottomNavigationBar: SizedBox(
          width: double.maxFinite,
          child: _buildBottomNavigation(context),
        ) ,
      ),
    );
  }
  /// Section Widget
  Widget _buildBottomNavigation(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: CustomBottomBar(
        onChanged: (BottomBarEnum type) {
          Navigator.pushNamed (
              navigatorKey.currentContext!, getCurrentRoute (type));
        },
      ),
    );
  }
  ///Handling route based on bottom click actions
  String getCurrentRoute (BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeOneInitialPage;
      case BottomBarEnum.Mybooking:
        return "/mybooking_screen";
      case BottomBarEnum.Favorite:
        return "/";
      case BottomBarEnum.Myprofile:
        return "/";
      default:
        return "/";
    }
  }

  ///Add Default Widgets

//Handling page based on route
  Widget getCurrentPage(
      BuildContext context,
      String currentRoute,
      ) {
    switch (currentRoute) {
      case AppRoutes.homeOneInitialPage:
        return HomeOneInitialPage.builder(context);
      default:
        return DefaultWidgets();
    }
  }
}