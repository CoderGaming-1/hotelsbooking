import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import 'bloc/mybooking_bloc.dart';
import 'models/mybooking_model.dart';
import 'mybookinghistor_tab_page.dart';
import 'package:hotelsbooking/presentation/home_one_screen/bloc/home_one_bloc.dart';
import 'package:hotelsbooking/presentation/home_one_screen/home_one_initial_page.dart';
import 'package:hotelsbooking/presentation/home_one_screen/models/home_one_model.dart';
import 'package:hotelsbooking/presentation/detail_screen/detail_screen.dart';
import 'package:hotelsbooking/presentation/editprofile_screen/editprofile_screen.dart';
import 'package:hotelsbooking/presentation/favorite_screen/favorite_screen.dart';
import 'package:hotelsbooking/presentation/mybooking_screen/mybooking_screen.dart';
import 'package:hotelsbooking/presentation/myprofile_page/myprofile_page.dart';
import 'package:hotelsbooking/presentation/mybooking_screen/mybookingbooked_tab_page.dart';

class MybookingScreen extends StatefulWidget {
  const MybookingScreen({Key? key})
      : super(
          key: key,
        );

  @override
  MybookingScreenState createState() => MybookingScreenState();

  static Widget builder(BuildContext context) {
    return BlocProvider<MybookingBloc>(
      create: (context) => MybookingBloc(MybookingState(
        mybookingModelObj: MybookingModel(),
      ))
        ..add(MybookingInitialEvent()),
      child: MybookingScreen(),
    );
  }
}

// ignore_for_file: must_be_immutable
class MybookingScreenState extends State<MybookingScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;
  int tabIndex = 0;
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'My Booking',
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildBookingTabSection(context),
              Expanded(
                child: Container(
                  child: TabBarView(
                    controller: tabviewController,
                    children: [
                      MybookingbookedTabPage.builder(context),
                      MybookinghistorTabPage.builder(context),
                      Container(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),

        /// bottom Navigation Bar

        bottomNavigationBar: SizedBox(
          width: double.maxFinite,
          child: _buildBottomNavigation(context),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBookingTabSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: appTheme.blueGray10033.withOpacity(0.1),
              borderRadius: BorderRadius.circular(
                18.h,
              ),
            ),
            width: double.maxFinite,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                18.h,
              ),
              child: TabBar(
                controller: tabviewController,
                labelPadding: EdgeInsets.zero,
                labelColor: appTheme.black90001,
                labelStyle: TextStyle(
                  fontSize: 12.fSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelColor: appTheme.black90001,
                unselectedLabelStyle: TextStyle(
                  fontSize: 12.fSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
                tabs: [
                  Tab(
                    height: 32,
                    child: Container(
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      margin: EdgeInsets.only(right: 6.h),
                      decoration: tabIndex == 0
                          ? BoxDecoration(color: appTheme.blueGray10033)
                          : BoxDecoration(
                              color: appTheme.whiteA700,
                              borderRadius: BorderRadius.circular(
                                16.h,
                              ),
                            ),
                      child: Text(
                        "lbl_booked".tr,
                      ),
                    ),
                  ),
                  Tab(
                    height: 32,
                    child: Container(
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      margin: EdgeInsets.only(left: 6.h),
                      decoration: tabIndex == 1
                          ? BoxDecoration(color: appTheme.blueGray10033)
                          : BoxDecoration(
                              color: appTheme.whiteA700,
                              borderRadius: BorderRadius.circular(
                                16.h,
                              ),
                            ),
                      child: Text(
                        "lbl_history".tr,
                      ),
                    ),
                  )
                ],
                indicatorColor: Colors.transparent,
                onTap: (index) {
                  tabIndex = index;
                  setState(() {});
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomNavigation(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: CustomBottomBar(
        onChanged: (BottomBarEnum type) {
          final route = getCurrentRoute(type);
          // Navigator.pushNamed (
          //     navigatorKey.currentContext!, getCurrentRoute (type));
          if (route.isNotEmpty) {
            Navigator.of(context).pushNamed(route);
          }
        },
      ),
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeOneInitialPage;
      case BottomBarEnum.Mybooking:
        return AppRoutes.mybookingScreen;
      case BottomBarEnum.Favorite:
        return AppRoutes.favoriteScreen;
      case BottomBarEnum.Myprofile:
        return AppRoutes.myprofileScreen;
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
      case AppRoutes.myprofileScreen:
        return MyprofilePage.builder(context);
      case AppRoutes.mybookingScreen:
        return MybookingScreen.builder(context);
      case AppRoutes.favoriteScreen:
        return FavoriteScreen.builder(context);
      case AppRoutes.editProfileScreen:
        return EditprofileScreen.builder(context);
      case AppRoutes.detailScreen:
        return DetailsScreen.builder(context);
      default:
        return DefaultWidgets();
    }
  }
}
