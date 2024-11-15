import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title_searchview.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'bloc/search_bloc.dart';
import 'models/search_model.dart';
import 'searchmost_tab_page.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key})
      : super(
          key: key,
        );

  @override
  SearchScreenState createState() => SearchScreenState();

  static Widget builder(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (context) => SearchBloc(SearchState(
        searchModelObj: SearchModel(),
      ))
        ..add(SearchInitialEvent()),
      child: SearchScreen(),
    );
  }
}

// ignore_for_file: must_be_immutable
class SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;
  int tabIndex = 0;
  static String imagePath = 'assets/images';
  static String imgSettings = '$imagePath/img_filter.png';

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 16.h),
              _buildLatestTabSection(context),
              Expanded(
                child: Container(
                  child: TabBarView(
                    controller: tabviewController,
                    children: [Container(), SearchmostTabPage.builder(context)],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: SizedBox(
        width: double.maxFinite,
        child: BlocSelector<SearchBloc, SearchState, TextEditingController?>(
          selector: (state) => state.searchoneController,
          builder: (context, searchoneController) {
            return AppbarTitleSearchview(
              margin: EdgeInsets.symmetric(horizontal: 24.h),
              hintText: "msg_search_your_hotel".tr,
              controller: searchoneController,
            );
          },
        ),
      ),
      // actions: [
      //   GestureDetector(
      //     onTap: () {
      //       Navigator.pushNamed(context, '/filter_screen');  // Navigate to /filter_screen
      //     },
      //     child: Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 16.h),
      //       child: Image.asset(
      //         imgSettings,
      //         height: 24.h,
      //         width: 24.h,
      //       ),
      //     ),
      //   ),
      // ],
    );
  }

  /// Section Widget
  Widget _buildLatestTabSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 48.h),
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: TabBar(
              controller: tabviewController,
              labelPadding: EdgeInsets.zero,
              labelColor: appTheme.blueGray400,
              labelStyle: TextStyle(
                fontSize: 14.fSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelColor: appTheme.blueGray400,
              unselectedLabelStyle: TextStyle(
                fontSize: 14.fSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
              tabs: [
                Tab(
                  height: 34,
                  child: Container(
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    margin: EdgeInsets.only(right: 6.h),
                    decoration: BoxDecoration(
                      color: appTheme.whiteA700,
                      borderRadius: BorderRadius.circular(10.h),
                      border: Border.all(
                        color: appTheme.black900,
                        width: 1.h,
                      ),
                    ),
                  ),
                ),
                Tab(
                  height: 34,
                  child: Container(
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    margin: EdgeInsets.only(left: 6.h),
                    decoration: BoxDecoration(
                      color: appTheme.whiteA700,
                      borderRadius: BorderRadius.circular(10.h),
                      border: Border.all(
                        color: appTheme.black900,
                        width: 1.h,
                      ),
                    ),
                  ),
                ),
              ],
              indicatorColor: Colors.transparent,
              // Remove the onTap callback to disable tab switching.
            ),
          ),
        ],
      ),
    );
  }


}
