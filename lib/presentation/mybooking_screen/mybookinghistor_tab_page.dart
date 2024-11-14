import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'bloc/mybooking_bloc.dart';
import 'models/bookinglistsection_item_model.dart';
import 'models/mybookinghistor_tab_model.dart';
import 'widgets/bookinglistsection_item_widget.dart';

class MybookinghistorTabPage extends StatefulWidget {
  const MybookinghistorTabPage({Key? key})
      : super(
          key: key,
        );

  @override
  MybookinghistorTabPageState createState() => MybookinghistorTabPageState();
  
  static Widget builder(BuildContext context) {
    return BlocProvider<MybookingBloc>(
      create: (context) => MybookingBloc(MybookingState(
        mybookinghistorTabModelObj: MybookinghistorTabModel(),
      ))
        ..add(MybookingInitialEvent()),
      child: MybookinghistorTabPage(),
    );
  }
}

class MybookinghistorTabPageState extends State<MybookinghistorTabPage> {
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
          BlocSelector<MybookingBloc, MybookingState, MybookinghistorTabModel?>(
        selector: (state) => state.mybookinghistorTabModelObj,
        builder: (context, mybookinghistorTabModelobj) {
          return ListView.separated(
            padding: EdgeInsets.zero,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 24.h,
              );
            },
            itemCount:
                mybookinghistorTabModelobj?.bookinglistsectionItemList.length ??
                    0,
            itemBuilder: (context, index) {
              BookinglistsectionItemModel model = mybookinghistorTabModelobj
                      ?.bookinglistsectionItemList[index] ??
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
