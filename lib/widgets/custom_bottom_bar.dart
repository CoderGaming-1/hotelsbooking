import 'package:flutter/material.dart';
import 'package:hotelsbooking/core/app_export.dart';
enum BottomBarEnum { Home, Mybooking, Favorite, Myprofile }
// ignore_for_file: must_be_immutable
class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});
  Function(BottomBarEnum)? onChanged;
  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}
// ignore_for_file: must_be_immutable
class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavHome,
      activeIcon: ImageConstant.imgNavHome,
      title: "lbl_home".tr,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavMyBooking,
      activeIcon: ImageConstant.imgNavMyBooking,
      title: "lbl_my_booking".tr,
      type: BottomBarEnum.Mybooking,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavFavorite,
      activeIcon: ImageConstant.imgNavFavorite,
      title: "lbl_favorite".tr,
      type: BottomBarEnum.Favorite,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavMyProfile,
      activeIcon: ImageConstant.imgNavMyProfile,
      title: "lbl_my_profile".tr,
      type: BottomBarEnum.Myprofile,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.h,
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].icon,
                  height: 24.h,
                  width: 24.h,
                  color: Color(0XFF252831),),
                SizedBox(height: 4.h),
                Text(
                  bottomMenuList[index].title ?? "",
                  style: theme.textTheme.labelLarge!.copyWith(
                    color: Color(0X24252831),
                  ),
                )
              ],
            ),
            activeIcon: SizedBox(
              width: 34.h,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImageView(


                    imagePath: bottomMenuList[index].activeIcon,
                    height: 24.h,
                    width: double.maxFinite,
                    color: Color(0XFF06B3C4),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    bottomMenuList[index].title ?? "",
                    style: CustomTextStyles.labelLargeCyan600.copyWith(
                      color: Color(0XFF06B3C4),
                    ),
                  )
                ],
              ),
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}
// ignore_for_file: must_be_immutable
    class BottomMenuModel {
    BottomMenuModel(
    {required this.icon,
    required this.activeIcon,
    this.title,
    required this.type});
    String icon;
    String activeIcon;
    String? title;
    BottomBarEnum type;
    }

class DefaultWidget extends StatelessWidget {
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