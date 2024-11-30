import 'package:flutter/material.dart';
import 'package:hotelsbooking/core/app_export.dart';
import 'package:hotelsbooking/presentation/detail_screen/detail_screen.dart';
import 'package:hotelsbooking/presentation/home_one_screen/models/hotellist_item_model.dart';

import '../../detail_screen/bloc/details_bloc.dart';
import '../../detail_screen/models/details_model.dart';

class HotellistItemWidget extends StatelessWidget {
  HotellistItemWidget(this.hotellistItemModelObj, {Key? key})
      : super(
    key: key,
  );

  HotellistItemModel? hotellistItemModelObj; // Để đối tượng này có thể nhận giá trị null

  @override
  Widget build(BuildContext context) {
    // Kiểm tra nếu hotellistItemModelObj là null
    if (hotellistItemModelObj == null) {
      return Center(child: Text('Không có dữ liệu khách sạn.'));
    }

    return SizedBox(
      width: 218.h,
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          height: 268.h,
          width: 218.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => BlocProvider<DetailsBloc>(
                        create: (context) => DetailsBloc(
                          DetailsState(
                            detailsModelObj: DetailsModel(),
                          ),
                        )..add(DetailsInitialEvent()),
                        child: DetailsScreen(hotelItem: hotellistItemModelObj!),
                      ),
                    ),
                  );
                },
                child: CustomImageView(
                  imagePath: hotellistItemModelObj?.dayOne ?? '', // Sử dụng giá trị mặc định nếu là null
                  height: 268.h,
                  width: double.maxFinite,
                ),
              ),
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.symmetric(vertical: 14.h),
                padding: EdgeInsets.symmetric(horizontal: 18.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.h,
                              vertical: 2.h,
                            ),
                          ),
                          CustomImageView(
                            imagePath: hotellistItemModelObj?.dayThree ?? '', // Sử dụng giá trị mặc định nếu là null
                            height: 20.h,
                            width: 20.h,
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.h,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: appTheme.whiteA700,
                        borderRadius: BorderRadiusStyle.roundedBorder14,
                        boxShadow: [
                          BoxShadow(
                            color: appTheme.gray9000f,
                            spreadRadius: 2.h,
                            blurRadius: 2.h,
                            offset: Offset(
                              4,
                              4,
                            ),
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                CustomImageView(
                                  imagePath:
                                  ImageConstant.imgAntDesignStarFilled,
                                  height: 14.h,
                                  width: 14.h,
                                ),
                                Text(
                                  hotellistItemModelObj?.fifty ?? '', // Sử dụng giá trị mặc định nếu là null
                                  style: theme.textTheme.labelMedium,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            hotellistItemModelObj?.theastonvil ?? '', // Sử dụng giá trị mặc định nếu là null
                            style: CustomTextStyles.labelLargePoppinsBlack900,
                          ),
                          SizedBox(height: 6.h),
                          SizedBox(
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgLinkedin,
                                  height: 20.h,
                                  width: 20.h,
                                ),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      hotellistItemModelObj?.streetromeny ?? '', // Sử dụng giá trị mặc định nếu là null
                                      style: CustomTextStyles
                                          .labelMediumBluegray400,
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
