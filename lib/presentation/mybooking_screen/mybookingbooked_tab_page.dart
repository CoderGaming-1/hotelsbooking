import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'bloc/mybooking_bloc.dart';
import 'models/bookinglistsection_item_model.dart';
import 'models/mybookingbooked_tab_model.dart';
import 'widgets/bookinglistsection_item_widget.dart';

class MybookingbookedTabPage extends StatefulWidget {
  const MybookingbookedTabPage({Key? key}) : super(key: key);

  @override
  MybookingbookedTabPageState createState() => MybookingbookedTabPageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<MybookingBloc>(
      create: (context) => MybookingBloc(MybookingState(
        mybookingbookedTabModelObj: MybookingbookedTabModel(),
      ))
        ..add(MybookingInitialEvent()),
      child: MybookingbookedTabPage(),
    );
  }
}

class MybookingbookedTabPageState extends State<MybookingbookedTabPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.h),
      child: Column(
        children: [_buildBookingListSection(context)],
      ),
    );
  }

  /// Section Widget
  Widget _buildBookingListSection(BuildContext context) {
    return Expanded(
      child:
      BlocSelector<MybookingBloc, MybookingState, MybookingbookedTabModel?>(
        selector: (state) => state.mybookingbookedTabModelObj,
        builder: (context, mybookingbookedTabModelObj) {
          return ListView.separated(
            padding: EdgeInsets.zero,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 24.h,
              );
            },
            itemCount: mybookingbookedTabModelObj
                ?.bookinglistsectionItemList.length ??
                0,
            itemBuilder: (context, index) {
              BookinglistsectionItemModel model =
                  mybookingbookedTabModelObj?.bookinglistsectionItemList[index] ??
                      BookinglistsectionItemModel();
              return BookinglistsectionItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }
}
