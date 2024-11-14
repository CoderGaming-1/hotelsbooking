import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_search_view.dart';
import 'bloc/favorite_bloc.dart';
import 'models/favorite_model.dart';
import 'models/favoritegrid_item_model.dart';
import 'widgets/favoritegrid_item_widget.dart';
import 'package:hotelsbooking/presentation/editprofile_screen/editprofile_screen.dart';
import 'package:hotelsbooking/presentation/favorite_screen/favorite_screen.dart';
import 'package:hotelsbooking/presentation/mybooking_screen/mybooking_screen.dart';
import 'package:hotelsbooking/presentation/myprofile_page/myprofile_page.dart';
import 'package:hotelsbooking/widgets/custom_bottom_bar.dart';
import 'package:hotelsbooking/presentation/home_one_screen/bloc/home_one_bloc.dart';
import 'package:hotelsbooking/presentation/home_one_screen/home_one_initial_page.dart';
import 'package:hotelsbooking/presentation/home_one_screen/models/home_one_model.dart';
import 'package:hotelsbooking/presentation/detail_screen/detail_screen.dart';

// ignore_for_file: must_be_immutable
class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key})
      : super(
          key: key,
        );
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<FavoriteBloc>(
      create: (context) => FavoriteBloc(FavoriteState(
        favoriteModelObj: FavoriteModel(),
      ))
        ..add(FavoriteInitialEvent()),
      child: FavoriteScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 14.h,
            top: 56.h,
            right: 14.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 14.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                child: BlocSelector<FavoriteBloc, FavoriteState,
                    TextEditingController?>(
                  selector: (state) => state.searchController,
                  builder: (context, searchController) {
                    return CustomSearchView(
                      controller: searchController,
                      hintText: "msg_search_your_hotel".tr,
                      contentPadding:
                          EdgeInsets.fromLTRB(12.h, 16.h, 16.h, 16.h),
                      borderDecoration: SearchViewStyleHelper.outlineCyan,
                      filled: true,
                      fillColor: appTheme.whiteA700,
                    );
                  },
                ),
              ),
              SizedBox(height: 28.h),
              _buildFavoriteGrid(context)
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          width: double.maxFinite,
          child: _buildBottomNavigation(context),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFavoriteGrid(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 10.h),
        child: BlocSelector<FavoriteBloc, FavoriteState, FavoriteModel?>(
          selector: (state) => state.favoriteModelObj,
          builder: (context, favoriteModelObj) {
            return ResponsiveGridListBuilder(
              minItemWidth: 1,
              minItemsPerRow: 2,
              maxItemsPerRow: 2,
              horizontalGridSpacing: 26.h,
              verticalGridSpacing: 26.h,
              builder: (context, items) => ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                children: items,
              ),
              gridItems: List.generate(
                favoriteModelObj?.favoritegridItemList.length ?? 0,
                (index) {
                  FavoritegridItemModel model =
                      favoriteModelObj?.favoritegridItemList[index] ??
                          FavoritegridItemModel();
                  return FavoritegridItemWidget(
                    model,
                  );
                },
              ),
            );
          },
        ),
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
