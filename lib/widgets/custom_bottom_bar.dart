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
  static int selectedIndex = 0;
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: Icons.home,
      activeIcon: Icons.home,
      title: "lbl_home".tr,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: Icons.event_note,
      activeIcon: Icons.event_note,
      title: "lbl_my_booking".tr,
      type: BottomBarEnum.Mybooking,
    ),
    BottomMenuModel(
      icon: Icons.favorite,
      activeIcon: Icons.favorite,
      title: "lbl_favorite".tr,
      type: BottomBarEnum.Favorite,
    ),
    BottomMenuModel(
      icon: Icons.person,
      activeIcon: Icons.person,
      title: "lbl_my_profile".tr,
      type: BottomBarEnum.Myprofile,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      padding: EdgeInsets.only(
        bottom: 16.h,
        top: 12.h,
      ),
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
          bool isSelected ;// Kiểm tra nếu mục đang được chọn
          if(index == selectedIndex) {
            isSelected = true;
          } else isSelected = false;
            return BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    bottomMenuList[index].icon,
                    size: 24.h,
                    color: isSelected ? Color(0XFF06B3C4) : Colors.black.withOpacity(0.1), // Đổi màu khi được chọn
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    bottomMenuList[index].title ?? "",
                    style: TextStyle( fontSize: 12, fontFamily: 'Poppins',
                      color: isSelected ? Color(0XFF06B3C4
                          ) : Colors.black.withOpacity(0.1), // Đổi màu khi được chọn
                  ),
                )
              ],
            ),
            activeIcon: SizedBox(
              width: 62.h,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    bottomMenuList[index].activeIcon,
                    size: 24.h,
                    color: Color(0XFF06B3C4),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    bottomMenuList[index].title ?? "",
                    style: TextStyle( fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.w700,
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
          setState(() {
            selectedIndex = index; // Cập nhật selectedIndex khi nhấn vào
          });
          widget.onChanged?.call(bottomMenuList[index].type);
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

  IconData icon;
  IconData activeIcon;
  String? title;
  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
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
