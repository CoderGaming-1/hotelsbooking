import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_checkbox_button.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_elevated_button.dart';
import 'bloc/filter_bloc.dart';
import 'models/filter_model.dart';
import 'models/filter_one_item_model.dart';
import 'widgets/filter_one_item_widget.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<FilterBloc>(
      create: (context) => FilterBloc(FilterState(
        filterModelObj: FilterModel(),
      ))
        ..add(FilterInitialEvent()),
      child: FilterScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    RangeValues _priceRange = RangeValues(40, 80);
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        body: Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(top: 32.h),
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                left: 8.h,
                top: 24.h,
                right: 8.h,
              ),
              decoration: BoxDecoration(
                color: appTheme.whiteA700,
                borderRadius: BorderRadiusStyle.roundedBorder32,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // CustomElevatedButton(
                  // width: 80.h,
                  // text: "lbl_filter_by".tr,
                  Text(
                    "lbl_filter_by".tr,
                    style: CustomTextStyles.titleMediumBlack90001,
                    // )
                  ),
                  SizedBox(height: 8.h),
                  _buildGuestSelection(context),
                  SizedBox(height: 22.h),
                  _buildPriceTitle(context),
                  // Container(
                  //   width: double.maxFinite,
                  //   margin: EdgeInsets.only(
                  //     left: 20.h,
                  //     right: 14.h,
                  //   ),
                  //   child: SliderTheme(
                  //     data: SliderThemeData(
                  //       trackShape: RoundedRectSliderTrackShape(),
                  //       activeTrackColor: appTheme.blueGray100D8,
                  //       thumbColor: appTheme.blueGray100D8,
                  //       thumbShape: RoundSliderThumbShape(),
                  //     ),
                  //     child: Slider(
                  //       value: 0.0,
                  //       min: 0.0,
                  //       max: 100.0,
                  //       onChanged: (value) {},
                  //     ),
                  //   ),
                  // ),

                  // Container(
                  //   width: double.maxFinite,
                  //   margin: EdgeInsets.only(left: 20.h, right: 14.h),
                  //   child: SliderTheme(
                  //     data: SliderThemeData(
                  //       trackShape: RoundedRectSliderTrackShape(),
                  //       activeTrackColor: appTheme.blueGray100D8,
                  //       thumbColor: appTheme.blueGray100D8,
                  //       thumbShape: RoundSliderThumbShape(),
                  //     ),
                  //     child: RangeSlider(
                  //       values: state.priceRange,
                  //       min: 0,
                  //       max: 100,
                  //       onChanged: (newRange) {
                  //         context.read<FilterBloc>().add(UpdatePriceRangeEvent(newRange: newRange));
                  //       },
                  //     ),
                  //   ),
                  // ),
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(
                      left: 20.h,
                      right: 14.h,
                    ),
                    child: Row(
                      children: [
                        // Minimum Price Text Field
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Minimum - Price',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                // Set the placeholder text color to gray
                                fontSize: 14.0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 12.0,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(width: 10.0), // Space between text fields
                        // Maximum Price Text Field
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Maximum - Price',
                              hintStyle: TextStyle(
                                color: Colors.grey, // Set the placeholder text color to gray
                                fontSize: 14.0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 12.0,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),


                  SizedBox(height: 42.h),
                  _buildLocationSelection(context),
                  SizedBox(height: 20.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.h),
                      child: Text(
                        "lbl_facilities".tr,
                        style: CustomTextStyles.titleSmallSemiBold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  _buildWifiCheckbox(context),
                  SizedBox(height: 8.h),
                  _buildTvCheckbox(context),
                  SizedBox(height: 8.h),
                  _buildPoolCheckbox(context),
                  SizedBox(height: 8.h),
                  _buildLaundryCheckbox(context),
                  SizedBox(height: 20.h),

                  _buildRatingsFilter(context),
                  SizedBox(height: 34.h),
                  CustomElevatedButton(
                    height: 48.h,
                    text: "lbl_apply_filter".tr,
                    margin: EdgeInsets.only(
                      left: 16.h,
                      right: 28.h,
                    ),
                    buttonStyle: CustomButtonStyles.fillPrimary,
                    buttonTextStyle: CustomTextStyles.titleSmallRobotoWhiteA700,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/search_screen', // Ensure this matches the route name for SearchScreen
                      );
                    },
                  ),
                  SizedBox(height: 52.h)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildGuestSelection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_placeholder".tr,
            style: CustomTextStyles.titleSmallSemiBold,
          ),
          BlocSelector<FilterBloc, FilterState, FilterModel?>(
            selector: (state) => state.filterModelObj,
            builder: (context, filterModelObj) {
              return CustomDropDown(
                icon: Container(
                  margin: EdgeInsets.only(left: 16.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgArrowdownOnprimarycontainer,
                    height: 24.h,
                    width: 24.h,
                    fit: BoxFit.contain,
                  ),
                ),
                iconSize: 24.h,
                hintText: "msg_3_guest_2_adult".tr,
                items: filterModelObj?.dropdownItemList ?? [],
                contentPadding: EdgeInsets.all(12.h),
              );
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  // Widget _buildPriceTitle(BuildContext context) {
  //   return Container(
  //     width: double.maxFinite,
  //     margin: EdgeInsets.only(
  //       left: 22.h,
  //       right: 10.h,
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text(
  //           "lbl_price".tr,
  //           style: CustomTextStyles.titleSmallSemiBold,),
  //         Text("lbl_40_80".tr,
  //           style: CustomTextStyles.titleSmallInterPrimary,
  //         )
  //       ],
  //     ),
  //   );
  // }
  Widget _buildPriceTitle(BuildContext context) {
    // RangeValues _priceRange = RangeValues(40, 80);
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 22.h, right: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "lbl_price".tr,
            style: CustomTextStyles.titleSmallSemiBold,
          ),
          // Text(
          //   "${_priceRange.start}\$ - ${_priceRange.end}\$",
          //   style: CustomTextStyles.titleSmallInterPrimary,
          // ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildLocationSelection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_location".tr,
            style: CustomTextStyles.titleSmallSemiBold,
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.h,
                  vertical: 10.h,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                ),
                child: Text(
                  "lbl_san_diego".tr,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.titleSmallWhiteA700,
                ),
              ),
              SizedBox(width: 20.h),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.h,
                  vertical: 10.h,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                ),
                child: Text(
                  "lbl_new_york".tr,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.titleSmallPrimary,
                ),
              ),
              SizedBox(width: 20.h),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.h,
                  vertical: 10.h,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                ),
                child: Text(
                  "lbl_amsterdam".tr,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.titleSmallPrimary,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildWifiCheckbox(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      child: BlocSelector<FilterBloc, FilterState, bool?>(
        selector: (state) => state.wifiCheckbox,
        builder: (context, wifiCheckbox) {
          return CustomCheckboxButton(
            width: 326.h,
            text: "lbl_free_wifi".tr,
            value: wifiCheckbox,
            padding: EdgeInsets.symmetric(vertical: 4.h),
            decoration: CustomCheckBoxStyleHelper.fillWhiteA,
            isRightCheck: true,
            onChange: (value) {
              context.read<FilterBloc>().add(ChangeCheckBoxEvent(value: value));
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildTvCheckbox(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      child: BlocSelector<FilterBloc, FilterState, bool?>(
        selector: (state) => state.tvCheckbox,
        builder: (context, tvCheckbox) {
          return CustomCheckboxButton(
            width: 326.h,
            text: "lbl_tv".tr,
            value: tvCheckbox,
            padding: EdgeInsets.symmetric(vertical: 6.h),
            decoration: CustomCheckBoxStyleHelper.fillWhiteA,
            isRightCheck: true,
            onChange: (value) {
              context
                  .read<FilterBloc>()
                  .add(ChangeCheckBox1Event(value: value));
            },
          );
        },
      ),
    );
  }

  Widget _buildPoolCheckbox(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      child: BlocSelector<FilterBloc, FilterState, bool?>(
        selector: (state) => state.poolCheckbox,
        builder: (context, poolCheckbox) {
          return CustomCheckboxButton(
            width: 326.h,
            text: "lbl_swimming_pool".tr,
            value: poolCheckbox,
            padding: EdgeInsets.symmetric(vertical: 4.h),
            decoration: CustomCheckBoxStyleHelper.fillWhiteA,
            isRightCheck: true,
            onChange: (value) {
              context
                  .read<FilterBloc>()
                  .add(ChangeCheckBox2Event(value: value));
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildLaundryCheckbox(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      child: BlocSelector<FilterBloc, FilterState, bool?>(
        selector: (state) => state.laundryCheckbox,
        builder: (context, laundryCheckbox) {
          return CustomCheckboxButton(
            width: 326.h,
            text: "lbl_laundry".tr,
            value: laundryCheckbox,
            padding: EdgeInsets.symmetric(vertical: 4.h),
            decoration: CustomCheckBoxStyleHelper.fillWhiteA,
            isRightCheck: true,
            onChange: (value) {
              context
                  .read<FilterBloc>()
                  .add(ChangeCheckBox3Event(value: value));
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildRatingsFilter(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_ratings".tr,
            style: CustomTextStyles.titleSmallSemiBold,
          ),
          SizedBox(height: 8.h),
          Container(
            margin: EdgeInsets.only(right: 20.h),
            width: double.maxFinite,
            child: BlocSelector<FilterBloc, FilterState, FilterModel?>(
              selector: (state) => state.filterModelObj,
              builder: (context, filterModelObj) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    direction: Axis.horizontal,
                    spacing: 10.h,
                    children: List.generate(
                      filterModelObj?.filterOneItemList.length ?? 0,
                      (index) {
                        FilterOneItemModel model =
                            filterModelObj?.filterOneItemList[index] ??
                                FilterOneItemModel();
                        return FilterOneItemWidget(
                          model,
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
