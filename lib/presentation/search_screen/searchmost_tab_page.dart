import 'package:flutter/material.dart' hide SearchController;
import 'package:responsive_grid_list/responsive_grid_list.dart';
import '../../core/app_export.dart';
import 'bloc/search_bloc.dart';
import 'models/hotelgrid_item_model.dart';
import 'models/searchmost_tab_model.dart';
import 'widgets/hotelgrid_item_widget.dart';

class SearchmostTabPage extends StatefulWidget {
  const SearchmostTabPage({Key? key})
      : super(
          key: key,
        );

  @override
  SearchmostTabPageState createState() => SearchmostTabPageState();

  static Widget builder(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (context) => SearchBloc(SearchState(
        searchmostTabModelObj: SearchmostTabModel(),
      ))
        ..add(SearchInitialEvent()),
      child: SearchmostTabPage(),
    );
  }
}

class SearchmostTabPageState extends State<SearchmostTabPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.h),
      child: Column(
        children: [SizedBox(height: 46.h), _buildHotelGrid(context)],
      ),
    );
  }

  /// Section Widget
  Widget _buildHotelGrid(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 8.h),
        child: BlocSelector<SearchBloc, SearchState, SearchmostTabModel?>(
            selector: (state) => state.searchmostTabModelObj,
            builder: (context, searchmostTabModelObj) {
              return ResponsiveGridListBuilder(
                minItemWidth: 1,
                minItemsPerRow: 2,
                maxItemsPerRow: 2,
                horizontalGridSpacing: 26.h,
                verticalGridSpacing: 26.h,
                builder: (context, items) => ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(),
                  children: items,
                ),
                gridItems: List.generate(
                  searchmostTabModelObj?.hotelgridItemList.length ?? 0,
                  (index) {
                    HotelgridItemModel model =
                        searchmostTabModelObj?.hotelgridItemList[index] ??
                            HotelgridItemModel();
                    return HotelgridItemWidget(
                      model,
                    );
                  },
                ),
              );
            }),
      ),
    );
  }
}
