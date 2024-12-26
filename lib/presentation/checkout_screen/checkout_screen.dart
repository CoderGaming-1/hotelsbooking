import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '/../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_rating_bar.dart';
import 'bloc/checkout_bloc.dart';
import 'models/checkout_model.dart';
import 'models/checkout_three_item_model.dart';
import 'widgets/checkout_three_item_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<CheckoutBloc>(
      create: (context) => CheckoutBloc(CheckoutState(
        checkoutModelObj: CheckoutModel(),
      ))
        ..add(CheckoutInitialEvent()),
      child: CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new), // Back icon
            onPressed: () {
              Navigator.pop(context); // Navigates to the previous screen
            },
          ),
          title: Text(
            'Check out',
            style: TextStyle(
                fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                left: 22.h,
                top: 4.h,
                right: 22.h,
              ),
              child: Column(
                children: [
                  _buildHostelInformation(context),
                  SizedBox(height: 10.h),
                  _buildBookingDetails(context),
                  SizedBox(height: 10.h),
                  //_buildPromoSection(context),
                  SizedBox(height: 58.h)
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildPaymentSection(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildTopNavigation(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 65.h,
      leading: AppbarLeadingIconbutton(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(
          left: 25.h,
          top: 8.h,
          bottom: 8.h,
        ),
        onTap: () {
          onTapArrowleftone(context);
        },
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_checkout".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildHostelInformation(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        children: [
          // Container(
          //   height: 108.h,
          //   width: 108.h,
          //   decoration: BoxDecoration(
          //     color: appTheme.onPrimaryContainer,
          //     borderRadius: BorderRadiusStyle.roundedBorder12,
          //     boxShadow: [
          //       BoxShadow(
          //         color: theme.colorScheme.onPrimary,
          //         spreadRadius: 2.h,
          //         blurRadius: 2.h,
          //         offset: Offset(
          //           4,
          //           4,
          //         ),
          //       )
          //     ],
          //   ),
          //   child: Stack(
          //     alignment: Alignment.center,
          //     children: [
          //       CustomImageView(
          //         imagePath: ImageConstant.imgImage7,
          //         height: 84.h,
          //         width: 86.h,
          //         radius: BorderRadius.circular(
          //           4.h,
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          SizedBox(width: 4.h),
          // Expanded(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       SizedBox(
          //         width: double.maxFinite,
          //         child: Row(
          //           children: [
          //             Text(
          //               "lbl_asteria_hostel".tr,
          //               style:
          //                   CustomTextStyles.titleSmallPlusJakartaSansBlack900,
          //             ),
          //             Padding(
          //               padding: EdgeInsets.only(left: 24.h),
          //               child: Text(
          //                 "lbl_25_day".tr,
          //                 style: CustomTextStyles.titleSmallInterPrimary,
          //               ),
          //             )
          //           ],
          //         ),
          //       ),
          //       SizedBox(height: 6.h),
          //       Text(
          //         "msg_ram_nagar_nt_0872".tr,
          //         style: CustomTextStyles
          //             .labelLargePlusJakartaSansOnPrimaryContainer,
          //       ),
          //       SizedBox(height: 6.h),
          //       SizedBox(
          //         width: double.maxFinite,
          //         child: Row(
          //           children: [
          //             CustomRatingBar(
          //               initialRating: 5,
          //             ),
          //             Padding(
          //               padding: EdgeInsets.only(left: 4.h),
          //               child: Text(
          //                 "lbl_5_0".tr,
          //                 style: CustomTextStyles
          //                     .labelLargePlusJakartaSansBlack900,
          //               ),
          //             )
          //           ],
          //         ),
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }

  Widget _buildBookingDetails(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusStyle.roundedBorder20,
        border: Border.all(
          color: appTheme.onPrimaryContainer,
          width: 1.h,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.only(left: 2.h),
            child: Text(
              "lbl_your_booking".tr,
              style: CustomTextStyles.labelLargePlusJakartaSansBlack90001,
            ),
          ),
          SizedBox(height: 6.h),
          Padding(
            padding: EdgeInsets.only(left: 2.h),
            child: BlocSelector<CheckoutBloc, CheckoutState, CheckoutModel?>(
              selector: (state) => state.checkoutModelObj,
              builder: (context, checkoutModelObj) {
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:
                      checkoutModelObj?.checkoutThreeItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    CheckoutThreeItemModel model =
                        checkoutModelObj?.checkoutThreeItemList[index] ??
                            CheckoutThreeItemModel();
                    return CheckoutThreeItemWidget(
                      model,
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.only(left: 2.h),
            child: Text(
              "lbl_price_details".tr,
              style: CustomTextStyles.labelLargePlusJakartaSansBlack90001,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            margin: EdgeInsets.only(left: 2.h),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.h,
                    vertical: 8.h,
                  ),
                  child: Text(
                    "lbl_price".tr,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.titleSmallMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 4.h),
                  child: Text(
                    "200.000 VND".tr,
                    style: CustomTextStyles.titleSmallMedium,
                  ),
                )
              ],
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(left: 2.h),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //   ),
          //   width: double.maxFinite,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Container(
          //         padding: EdgeInsets.symmetric(
          //           horizontal: 6.h,
          //           vertical: 8.h,
          //         ),
          //         child: Text(
          //           "lbl_admin_fee".tr,
          //           textAlign: TextAlign.left,
          //           style: CustomTextStyles.titleSmallMedium,
          //         ),
          //       ),
          //       Padding(
          //         padding: EdgeInsets.only(right: 4.h),
          //         child: Text(
          //           "2".tr,
          //           style: CustomTextStyles.titleSmallMedium,
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          Container(
            margin: EdgeInsets.only(left: 2.h),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.h,
                    vertical: 8.h,
                  ),
                  child: Text(
                    "lbl_total_price".tr,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.titleSmallMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 4.h),
                  child: Text(
                    "200.000VND",
                    style: CustomTextStyles.titleSmallMedium,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPromoSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_promo".tr,
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.all(12.h),
            decoration: BoxDecoration(
              color: appTheme.onPrimaryContainer,
              borderRadius: BorderRadiusStyle.roundedBorder16,
            ),
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgDiscount,
                  height: 24.h,
                  width: 26.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Text(
                    "lbl_select".tr,
                    style: CustomTextStyles.titleSmallOnPrimaryContainer,
                  ),
                ),
                Spacer(),
                CustomImageView(
                  imagePath: ImageConstant.imgArrowRight,
                  height: 24.h,
                  width: 26.h,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPaymentSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomElevatedButton(
            buttonStyle: CustomButtonStyles.onChoose,
            text: 'Payment',
            margin: EdgeInsets.only(bottom: 12.h),
            onPressed: () {
              Navigator.pushNamed(
                  context, '/payment_screen'); // Navigate to mybooking_screen
                  // context, '/home_one_initial_page');
            },
          )
        ],
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }
}
