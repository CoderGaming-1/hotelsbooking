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
    // return Container(
    //   width: double.maxFinite,
    //   decoration: BoxDecoration(
    //     color: appTheme.whiteA700,
    //   ),
    //   child: Column(
    //     children: [
    //       SizedBox(
    //         width: double.maxFinite,
    //         child: _buildAppBar(context),
    //       ),
    //       Expanded(
    //         child: SingleChildScrollView(
    //           child: SizedBox(
    //             width: double.maxFinite,
    //             child: Column(
    //               children: [
    //                 SizedBox(height: 8.h),
    //                 _buildWelcomeSection(context),
    //                 SizedBox(height: 12.h),
    //                 _buildHotelList(context),
    //                 SizedBox(height: 12.h),
    //                 _buildNearbyHotels(context),
    //                 SizedBox(height: 12.h),
    //                 _buildBottomNavigation(context)
    //               ],
    //             ),
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    // );

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
                        _buildNearbyHotels(context),
                        SizedBox(height: 15.h),
                        _buildNearbyHotels(context),
                        SizedBox(height: 15.h),
                        _buildNearbyHotels(context),
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
                  "msg_recommended_hotel".tr,
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

  /// Section Widget
  // Widget _buildNearbyHotels(BuildContext context) {
  //   return Container(
  //     width: double.maxFinite,
  //     margin: EdgeInsets.symmetric(horizontal: 20.h),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Padding(
  //           padding: EdgeInsets.only(left: 10.h),
  //           child: Text(
  //             "lbl_nearby_hotels".tr,
  //             style: CustomTextStyles.titleMediumPlusJakartaSans,
  //           ),
  //         ),
  //         SizedBox(
  //           width: double.maxFinite,
  //           child: Row(
  //             children: [
  //               Container(
  //                 height: 108.h,
  //                 width: 108.h,
  //                 decoration: BoxDecoration(
  //                   color: appTheme.whiteA700,
  //                   borderRadius: BorderRadiusStyle.roundedBorder14,
  //                   boxShadow: [
  //                     BoxShadow(
  //                       color: appTheme.gray9000f.withOpacity(0.04),
  //                       spreadRadius: 2.h,
  //                       blurRadius: 2.h,
  //                       offset: Offset(
  //                         4,
  //                         4,
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //                 child: Stack(
  //                   alignment: Alignment.center,
  //                   children: [
  //                     CustomImageView(
  //                       imagePath: ImageConstant.imgImage7,
  //                       height: 84.h,
  //                       width: 84.h,
  //                       radius: BorderRadius.circular(
  //                         4.h,
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //               SizedBox(width: 4.h),
  //               Expanded(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     SizedBox(
  //                       width: double.maxFinite,
  //                       child: Row(
  //                         children: [
  //                           Text(
  //                             "lbl_asteria_hostel".tr,
  //                             style: CustomTextStyles.titleSmallPlusJakartaSans,
  //                           ),
  //                           Padding(
  //                             padding: EdgeInsets.only(left: 24.h),
  //                             child: Text(
  //                               "lbl_25_day".tr,
  //                               style: CustomTextStyles.titleSmallInterCyan600,
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                     SizedBox(height: 6.h),
  //                     Text(
  //                       "msg_ram_nagar_nt_0872".tr,
  //                       style: CustomTextStyles
  //                           .labelLargePlusJakartaSansBluegray400,
  //                     ),
  //                     SizedBox(height: 6.h),
  //                     SizedBox(
  //                       width: double.maxFinite,
  //                       child: Row(
  //                         children: [
  //                           CustomRatingBar(
  //                             initialRating: 4,
  //                           ),
  //                           Padding(
  //                             padding: EdgeInsets.only(left: 4.h),
  //                             child: Text(
  //                               "lbl_5_0".tr,
  //                               style: CustomTextStyles
  //                                   .labelLargePlusJakartaSansBlack900,
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               )
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildNearbyHotels(BuildContext context) {
  //   return Container(
  //     width: double.maxFinite,
  //     margin: EdgeInsets.symmetric(horizontal: 18.h),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Padding(
  //           padding: EdgeInsets.only(left: 12.h),
  //           child: Text(
  //             "lbl_nearby_hotels".tr,
  //             style: CustomTextStyles.titleMediumPlusJakartaSans,
  //           ),
  //         ),
  //         SizedBox(height: 20.h),
  //         Row(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             CustomImageView(
  //               imagePath: ImageConstant.imgViewBuildingw,
  //               height: 116.h,
  //               width: 154.h,
  //             ),
  //             SizedBox(width: 26.h),
  //             CustomImageView(
  //               imagePath: ImageConstant.imgViewBuildingw,
  //               height: 116.h,
  //               width: 154.h,
  //             )
  //           ],
  //         ),
  //         SizedBox(
  //           width: double.maxFinite,
  //           child: Row(
  //             children: [
  //               Expanded(
  //                 child: Container(
  //                   width: double.maxFinite,
  //                   padding: EdgeInsets.symmetric(vertical: 8.h),
  //                   decoration: BoxDecoration(
  //                     color: appTheme.whiteA700,
  //                     borderRadius: BorderRadiusStyle.customBorderBL12,
  //                     boxShadow: [
  //                       BoxShadow(
  //                         color: appTheme.blueGray9000a,
  //                         spreadRadius: 2.h,
  //                         blurRadius: 2.h,
  //                         offset: Offset(
  //                           0,
  //                           2,
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                   child: Column(
  //                     mainAxisSize: MainAxisSize.min,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       SizedBox(
  //                         width: double.maxFinite,
  //                         child: _buildRatedOne(
  //                           context,
  //                           ratingText: "lbl_5_0_463".tr,
  //                         ),
  //                       ),
  //                       SizedBox(height: 4.h),
  //                       Text(
  //                         "msg_muongthanh_hotel".tr,
  //                         style: CustomTextStyles.labelLargePoppinsBlack900,
  //                       ),
  //                       SizedBox(height: 4.h),
  //                       Text(
  //                         "msg_alice_springs_nt".tr,
  //                         style: theme.textTheme.bodySmall,
  //                       ),
  //                       SizedBox(height: 10.h),
  //                       Container(
  //                         padding: EdgeInsets.symmetric(
  //                           horizontal: 4.h,
  //                           vertical: 2.h,
  //                         ),
  //                         decoration: BoxDecoration(
  //                           color: appTheme.whiteA700,
  //                           borderRadius: BorderRadiusStyle.roundedBorder8,
  //                         ),
  //                         child: RichText(
  //                           text: TextSpan(
  //                             children: [
  //                               TextSpan(
  //                                 text: "lbl_382".tr,
  //                                 style: theme.textTheme.labelMedium,
  //                               ),
  //                               TextSpan(
  //                                 text: "lbl_299".tr,
  //                                 style: theme.textTheme.labelSmall,
  //                               )
  //                             ],
  //                           ),
  //                           textAlign: TextAlign.left,
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(width: 26.h),
  //               Expanded(
  //                 child: Container(
  //                   width: double.maxFinite,
  //                   padding: EdgeInsets.symmetric(vertical: 8.h),
  //                   decoration: BoxDecoration(
  //                     color: appTheme.whiteA700,
  //                     borderRadius: BorderRadiusStyle.customBorderBL12,
  //                     boxShadow: [
  //                       BoxShadow(
  //                         color: appTheme.blueGray9000a,
  //                         spreadRadius: 2.h,
  //                         blurRadius: 2.h,
  //                         offset: Offset(
  //                           0,
  //                           2,
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                   child: Column(
  //                     mainAxisSize: MainAxisSize.min,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       SizedBox(
  //                         width: double.maxFinite,
  //                         child: _buildRatedOne(
  //                           context,
  //                           ratingText: "lbl_5_0_463".tr,
  //                         ),
  //                       ),
  //                       SizedBox(height: 4.h),
  //                       Text(
  //                         "lbl_light_hotel".tr,
  //                         style: CustomTextStyles.labelLargePoppinsBlack900,
  //                       ),
  //                       SizedBox(height: 4.h),
  //                       Text(
  //                         "msg_alice_springs_nt".tr,
  //                         style: theme.textTheme.bodySmall,
  //                       ),
  //                       SizedBox(height: 10.h),
  //                       Container(
  //                         padding: EdgeInsets.symmetric(
  //                           horizontal: 4.h,
  //                           vertical: 2.h,
  //                         ),
  //                         decoration: BoxDecoration(
  //                           color: appTheme.whiteA700,
  //                           borderRadius: BorderRadiusStyle.roundedBorder8,
  //                         ),
  //                         child: RichText(
  //                           text: TextSpan(
  //                             children: [
  //                               TextSpan(
  //                                   text: "lbl_382".tr,
  //                                   style: theme.textTheme.labelMedium),
  //                               TextSpan(
  //                                 text: "lbl_299".tr,
  //                                 style: theme.textTheme.labelSmall,
  //                               )
  //                             ],
  //                           ),
  //                           textAlign: TextAlign.left,
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               )
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

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
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgViewBuildingw,
                height: 116.h,
                width: 154.h,
              ),
              SizedBox(width: 26.h),
              CustomImageView(
                imagePath: ImageConstant.imgViewBuildingw,
                height: 116.h,
                width: 154.h,
              )
            ],
          ),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    decoration: BoxDecoration(
                      color: appTheme.whiteA700,
                      borderRadius: BorderRadiusStyle.customBorderBL12,
                      boxShadow: [
                        BoxShadow(
                          color: appTheme.blueGray9000a,
                          spreadRadius: 2.h,
                          blurRadius: 2.h,
                          offset: Offset(
                            0,
                            2,
                          ),
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.maxFinite,
                          child: _buildRatedOne(
                            context,
                            ratingText: "lbl_5_0_463".tr,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "msg_muongthanh_hotel".tr,
                          style: CustomTextStyles.labelLargePoppinsBlack900,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "msg_alice_springs_nt".tr,
                          style: theme.textTheme.bodySmall,
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.h,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: appTheme.whiteA700,
                            borderRadius: BorderRadiusStyle.roundedBorder8,
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "lbl_382".tr,
                                  style: theme.textTheme.labelMedium,
                                ),
                                TextSpan(
                                  text: "lbl_299".tr,
                                  style: theme.textTheme.labelSmall,
                                )
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 26.h),
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    decoration: BoxDecoration(
                      color: appTheme.whiteA700,
                      borderRadius: BorderRadiusStyle.customBorderBL12,
                      boxShadow: [
                        BoxShadow(
                          color: appTheme.blueGray9000a,
                          spreadRadius: 2.h,
                          blurRadius: 2.h,
                          offset: Offset(
                            0,
                            2,
                          ),
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.maxFinite,
                          child: _buildRatedOne(
                            context,
                            ratingText: "lbl_5_0_463".tr,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "lbl_light_hotel".tr,
                          style: CustomTextStyles.labelLargePoppinsBlack900,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "msg_alice_springs_nt".tr,
                          style: theme.textTheme.bodySmall,
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.h,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: appTheme.whiteA700,
                            borderRadius: BorderRadiusStyle.roundedBorder8,
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "lbl_382".tr,
                                    style: theme.textTheme.labelMedium),
                                TextSpan(
                                  text: "lbl_299".tr,
                                  style: theme.textTheme.labelSmall,
                                )
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
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
          imagePath: ImageConstant.imgSignal,
          height: 14.h,
          width: 14.h,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "lbl 5_0".tr,
                style: CustomTextStyles.labelMediumPlusJakartaSansAmberA200Bold,
              ),
              TextSpan(
                text: "lbl 463".tr,
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
