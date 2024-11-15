import 'package:flutter/material.dart';
import 'package:hotelsbooking/core/app_export.dart';
import 'package:hotelsbooking/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:hotelsbooking/presentation/from_details_screen/from_details_screen.dart';
import 'package:hotelsbooking/widgets/app_bar/appbar_title_dropdown.dart';
import 'package:hotelsbooking/widgets/app_bar/appbar_trailing_image.dart';
import 'package:hotelsbooking/widgets/app_bar/custom_app_bar.dart';
import 'package:hotelsbooking/widgets/custom_rating_bar.dart';
import 'package:hotelsbooking/widgets/custom_search_view.dart';
import 'bloc/home_one_bloc.dart';
import 'models/home_one_initial_model.dart';
import 'models/hotellist_item_model.dart';
import 'widgets/hotellist_item_widget.dart';
import 'package:hotelsbooking/presentation/editprofile_screen/editprofile_screen.dart';
import 'package:hotelsbooking/presentation/favorite_screen/favorite_screen.dart';
import 'package:hotelsbooking/presentation/mybooking_screen/mybooking_screen.dart';
import 'package:hotelsbooking/presentation/myprofile_page/myprofile_page.dart';
import 'package:hotelsbooking/widgets/custom_bottom_bar.dart';
import 'package:hotelsbooking/presentation/home_one_screen/bloc/home_one_bloc.dart';
import 'package:hotelsbooking/presentation/home_one_screen/home_one_initial_page.dart';
import 'package:hotelsbooking/presentation/home_one_screen/models/home_one_model.dart';
import 'package:hotelsbooking/presentation/detail_screen/detail_screen.dart';
import 'package:hotelsbooking/presentation/from_details_screen/from_details_screen.dart';

class DefaultWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
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

class HomeOneInitialPage extends StatefulWidget {
  HomeOneInitialPage({Key? key})
      : super(
          key: key,
        );

  @override
  HomeOneInitialPageState createState() => HomeOneInitialPageState();

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeOneBloc>(
      create: (context) => HomeOneBloc(HomeOneState(
        homeOneInitialModelObj: HomeOneInitialModel(),
      ))
        ..add(HomeOneInitialEvent()),
      child: HomeOneInitialPage(),
    );
  }
}

class HomeOneInitialPageState extends State<HomeOneInitialPage> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: appTheme.whiteA700,
          ),
          child: Column(
            children: [
              SizedBox(
                width: double.maxFinite,
                child: _buildAppBar(context),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        SizedBox(height: 8.h),
                        _buildWelcomeSection(context),
                        SizedBox(height: 12.h),
                        _buildHotelList(context),
                        SizedBox(height: 12.h),
                        _buildNearbyHotels(context),
                        SizedBox(height: 15.h),
                        _buildPopular(context),
                        SizedBox(height: 15.h),
                        _buildDiscounted(context),
                        SizedBox(height: 15.h),
                        _buildSaving(context),
                        SizedBox(height: 15.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: _buildBottomNavigation(context),
        ),
      ],
    );
  }

// class HomeOneInitialPage extends StatefulWidget {
//   const HomeOneInitialPage({Key? key}) :super(key: key, );
//   @override
//   HomeOneInitialPageState createState() => HomeOneInitialPageState();
//
//   static Widget builder (BuildContext context) {
//     return BlocProvider<HomeOneBloc>(
//       create: (context) => HomeOneBloc (HomeOneState(homeOneInitialModelObj: HomeOneInitialModel(), ))
//         ..add(HomeOneInitialEvent()),
//       child: HomeOneInitialPage(),
//     );
//   }
// }
// class HomeOneInitialPageState extends State<HomeOneInitialPage> {
//   @override
//   Widget build (BuildContext context) {
//     return Container(
//       width: double.maxFinite,
//       decoration: BoxDecoration(
//         color: appTheme.whiteA700,),
//       child: Column(
//         children: [
//           SizedBox(
//             width: double.maxFinite,
//             child: _buildAppBar(context),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               child: SizedBox(
//                 width: double.maxFinite,
//                 child: Column(
//                   children: [
//                     SizedBox(height: 8.h),
//                     _buildWelcomeSection(context),
//                     SizedBox(height: 12.h),
//                     _buildHotelList(context),
//                     SizedBox(height: 12.h),
//                     _buildNearbyHotels(context)
//                   ],
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
  /// Section Widget
  Widget _buildAppBar(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: CustomAppBar(
        title: BlocSelector<HomeOneBloc, HomeOneState, HomeOneInitialModel?>(
          selector: (state) => state.homeOneInitialModelObj,
          builder: (context, homeOneInitialModelObj) {
            return AppbarTitleDropdown(
              margin: EdgeInsets.only(left: 34.h),
              hintText: "msg_chenango_new_york".tr,
              items: homeOneInitialModelObj?.dropdownItemList ?? [],
              onTap: (value) {
                context.read<HomeOneBloc>().add(onSelected(value: value));
              },
            );
          },
        ),
        actions: [
          AppbarTrailingImage(
            imagePath: ImageConstant.imgMessageTextSquare02,
          ),
          AppbarTrailingImage(
            imagePath: ImageConstant.imgIcon,
            margin: EdgeInsets.only(
              left: 8.h,
              right: 32.h,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildWelcomeSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Text(
              "lbl_hello_hoangphan".tr,
              style: CustomTextStyles.labelLargePoppinsBlack90001,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "lbl_discover_your".tr,
                    style: theme.textTheme.headlineSmall,
                  ),
                  TextSpan(
                    text: "msg_perfect_place_to".tr,
                    style: CustomTextStyles.headlineSmallBlack90001,
                  )
                ],
              ),
              textAlign: TextAlign.left,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 14.h),
          BlocSelector<HomeOneBloc, HomeOneState, TextEditingController?>(
            selector: (state) => state.searchController,
            builder: (context, searchController) {
              return CustomSearchView(
                controller: searchController,
                hintText: "msg_search_your_hotel".tr,
                contentPadding: EdgeInsets.fromLTRB(12.h, 16.h, 16.h, 16.h),
              );
            },
          ),
          SizedBox(height: 14.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "msg_recomended_hotel".tr,
                  style: theme.textTheme.titleMedium,
                ),
                Text(
                  "lbl_see_all".tr,
                  style: CustomTextStyles.titleSmallCyan600,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildHotelList(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(left: 26.h),
        child: BlocSelector<HomeOneBloc, HomeOneState, HomeOneInitialModel?>(
          selector: (state) => state.homeOneInitialModelObj,
          builder: (context, homeOneInitialModelObj) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 14.h,
                children: List.generate(
                  homeOneInitialModelObj?.hotellistItemList.length ?? 0,
                      (index) {
                    HotellistItemModel model =
                        homeOneInitialModelObj?.hotellistItemList[index] ??
                            HotellistItemModel();
                    return HotellistItemWidget(
                      model,
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildNearbyHotels(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: Text(
              "lbl_nearby_hotels".tr,
              style: CustomTextStyles.titleMediumPlusJakartaSans,
            ),
          ),
          SizedBox(height: 20.h),

          // Horizontal scrollable row of hotels
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildHotelCard(
                  context,
                  ImageConstant.img_18,
                  _buildRatedOne(context, ratingText: "lbl_5_0_463".tr),
                  "The Emerald Garden".tr,
                  "msg_alice_springs_nt".tr,
                  "382\$".tr,
                  "299\$".tr,
                ),
                SizedBox(width: 26.h),
                _buildHotelCard(
                  context,
                  ImageConstant.img1,
                  _buildRatedOne(context, ratingText: "lbl_5_0_463".tr),
                  "Desert Mirage Hotel".tr,
                  "the Crystal Cove, Miami Beach".tr,
                  "500\$".tr,
                  "399\$".tr,
                ),
                SizedBox(width: 26.h),
                _buildHotelCard(
                  context,
                  ImageConstant.img_2,
                  _buildRatedOne(context, ratingText: "lbl_4_8_320".tr),
                  "Historic Plaza Hotel".tr,
                  "Serene Lakeview District, Seattle".tr,
                  "450\$".tr,
                  "349\$".tr,
                ),

                SizedBox(width: 26.h),
                _buildHotelCard(
                  context,
                  ImageConstant.img_3,
                  _buildRatedOne(context, ratingText: "lbl_4_8_320".tr),
                  "Silver Sky Hotel".tr,
                  "the Golden Sands, Santa Monica Bay".tr,
                  "450\$".tr,
                  "267\$".tr,
                ),
                SizedBox(width: 26.h),
                _buildHotelCard(
                  context,
                  ImageConstant.img_4,
                  _buildRatedOne(context, ratingText: "lbl_4_8_320".tr),
                  "Azure Waves Hotel".tr,
                  "the Golden Sands, Santa Monica Bay".tr,
                  "450\$".tr,
                  "349\$".tr,
                ),
                // Add more hotels as needed...
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHotelCard(BuildContext context, String imagePath, Widget ratingWidget, String hotelName, String location, String originalPrice, String discountedPrice) {
    return Container(
      width: 154.h,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadiusStyle.customBorderBL12,
        boxShadow: [
          BoxShadow(
            color: appTheme.blueGray9000a,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: imagePath,
            height: 116.h,
            width: 154.h,
          ),
          SizedBox(height: 4.h),

          // Use the ratingWidget here
          ratingWidget,

          SizedBox(height: 4.h),
          Text(hotelName, style: CustomTextStyles.labelLargePoppinsBlack900),
          SizedBox(height: 4.h),
          Text(location, style: theme.textTheme.bodySmall),
          SizedBox(height: 10.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 2.h),
            decoration: BoxDecoration(
              color: appTheme.whiteA700,
              borderRadius: BorderRadiusStyle.roundedBorder8,
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: originalPrice, style: theme.textTheme.labelMedium),
                  TextSpan(text: discountedPrice, style: theme.textTheme.labelSmall),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopular(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: Text(
              "Top Popular Destinations",
              style: CustomTextStyles.titleMediumPlusJakartaSans,
            ),
          ),
          SizedBox(height: 20.h),

          // Horizontal scrollable row of hotels
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildHotelCard(
                  context,
                  ImageConstant.img_1,
                  _buildRatedOne(context, ratingText: "lbl_5_0_463".tr),
                  "Seaview Grand Hotel".tr,
                  "Miami, FL".tr,
                  "382\$".tr,
                  "299\$".tr,
                ),
                SizedBox(width: 26.h),
                _buildHotelCard(
                  context,
                  ImageConstant.img_5,
                  _buildRatedOne(context, ratingText: "lbl_5_0_463".tr),
                  "Mountain Peak Resort".tr,
                  "Aspen, CO".tr,
                  "500\$".tr,
                  "399\$".tr,
                ),
                SizedBox(width: 26.h),
                _buildHotelCard(
                  context,
                  ImageConstant.img_6,
                  _buildRatedOne(context, ratingText: "lbl_4_8_320".tr),
                  "City Lights Hotel".tr,
                  "New York, NY".tr,
                  "510\$".tr,
                  "349\$".tr,
                ),
                SizedBox(width: 26.h),
                _buildHotelCard(
                  context,
                  ImageConstant.img_7,
                  _buildRatedOne(context, ratingText: "lbl_4_8_320".tr),
                  "The Elegant Rosewood Manor".tr,
                  "New York, NY".tr,
                  "750\$".tr,
                  "320\$".tr,
                ),
                SizedBox(width: 26.h),
                _buildHotelCard(
                  context,
                  ImageConstant.img_8,
                  _buildRatedOne(context, ratingText: "lbl_4_8_320".tr),
                  "Sunset Oasis Suites".tr,
                  "New York, NY".tr,
                  "850\$".tr,
                  "259\$".tr,
                ),
                // Add more hotels as needed...
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiscounted(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: Text(
              "Top Discounted Attraction Tickets",
              style: CustomTextStyles.titleMediumPlusJakartaSans,
            ),
          ),
          SizedBox(height: 20.h),

          // Horizontal scrollable row of hotels
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildHotelCard(
                  context,
                  ImageConstant.img_7,
                  _buildRatedOne(context, ratingText: "lbl_5_0_463".tr),
                  "The Royal Palace".tr,
                  "near Coral Lagoon, Kauai".tr,
                  "382\$".tr,
                  "299\$".tr,
                ),
                SizedBox(width: 26.h),
                _buildHotelCard(
                  context,
                  ImageConstant.img_8,
                  _buildRatedOne(context, ratingText: "lbl_5_0_463".tr),
                  "Sunset Bay Inn".tr,
                  " the White Sand Shores, Key West".tr,
                  "500\$".tr,
                  "399\$".tr,
                ),
                SizedBox(width: 26.h),
                _buildHotelCard(
                  context,
                  ImageConstant.img_9,
                  _buildRatedOne(context, ratingText: "lbl_4_8_320".tr),
                  "Pinewood Haven".tr,
                  "at the Iconic Bayfront, San Diego".tr,
                  "450\$".tr,
                  "349\$".tr,
                ),
                SizedBox(width: 26.h),
                _buildHotelCard(
                  context,
                  ImageConstant.img_10,
                  _buildRatedOne(context, ratingText: "lbl_4_8_320".tr),
                  "Royal Harbor Inn".tr,
                  "near Coral Lagoon, Kauai".tr,
                  "450\$".tr,
                  "349\$".tr,
                ),
                SizedBox(width: 26.h),
                _buildHotelCard(
                  context,
                  ImageConstant.img_11,
                  _buildRatedOne(context, ratingText: "lbl_4_8_320".tr),
                  "Cascading Falls Resort".tr,
                  "near the Majestic Canyon, Sedona".tr,
                  "450\$".tr,
                  "349\$".tr,
                ),
                // Add more hotels as needed...
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaving(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: Text(
              "Year-end Hotel Bookings With Savings",
              style: CustomTextStyles.titleMediumPlusJakartaSans,
            ),
          ),
          SizedBox(height: 20.h),

          // Horizontal scrollable row of hotels
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildHotelCard(
                  context,
                  ImageConstant.img_12,
                  _buildRatedOne(context, ratingText: "lbl_5_0_463".tr),
                  "Historic Plaza Hotel".tr,
                  "at the Scenic Rocky Ridge, Colorado Springs".tr,
                  "382\$".tr,
                  "299\$".tr,
                ),
                SizedBox(width: 26.h),
                _buildHotelCard(
                  context,
                  ImageConstant.img_13,
                  _buildRatedOne(context, ratingText: "lbl_5_0_463".tr),
                  "Riverfront Luxury Suites".tr,
                  " Glamorous Marina District, Los Angeles".tr,
                  "500\$".tr,
                  "399\$".tr,
                ),
                SizedBox(width: 26.h),
                _buildHotelCard(
                  context,
                  ImageConstant.img_14,
                  _buildRatedOne(context, ratingText: "lbl_4_8_320".tr),
                  "Silver Sky Hotel".tr,
                  "Heart of Alpine Village, Banff".tr,
                  "450\$".tr,
                  "349\$".tr,
                ),
                SizedBox(width: 26.h),
                _buildHotelCard(
                  context,
                  ImageConstant.img_15,
                  _buildRatedOne(context, ratingText: "lbl_4_7_289".tr),
                  "Cedar Hills Hotel".tr,
                  " White Sand Shores, Key West".tr,
                  "420\$".tr,
                  "330\$".tr,
                ),
                SizedBox(width: 26.h),
                _buildHotelCard(
                  context,
                  ImageConstant.img_16,
                  _buildRatedOne(context, ratingText: "lbl_4_6_250".tr),
                  "Golden Gate Lodge".tr,
                  "the Majestic Canyon, Sedona".tr,
                  "400\$".tr,
                  "310\$".tr,
                ),
                SizedBox(width: 26.h),
                _buildHotelCard(
                  context,
                  ImageConstant.img_17,
                  _buildRatedOne(context, ratingText: "lbl_4_5_200".tr),
                  "Palm Grove Resort".tr,
                  "Chicago, IL".tr,
                  "380\$".tr,
                  "299\$".tr,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



  /// Common widget
  Widget _buildRatedOne(
      BuildContext context, {
        required String ratingText,
      }) {
    return Row(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgAntDesignStarFilled,
          height: 14.h,
          width: 14.h,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "lbl_5_0".tr,
                style: CustomTextStyles.labelMediumPlusJakartaSansAmberA200Bold,
              ),
              TextSpan(
                text: "lbl_463".tr,
                style: CustomTextStyles.labelMediumPlusJakartaSansBlack900Bold,
              )
            ],
          ),
          textAlign: TextAlign.left,
        )
      ],
    );
  }

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
      case AppRoutes.fromdetailsScreen:
        return FromDetailsScreen.builder(context);
      default:
        return DefaultWidgets();
    }
  }
}
