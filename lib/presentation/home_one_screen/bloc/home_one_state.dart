part of 'home_one_bloc.dart';
/// Represents the state of HomeOne in the application.
// ignore_for_file: must_be_immutable
class HomeOneState extends Equatable {
  HomeOneState(
      {this.searchController,
        this.selectedDropDownValue,
        this.homeOneInitialModelObj,
        this.homeOneModelObj});
  TextEditingController? searchController;
  SelectionPopupModel? selectedDropDownValue;
  HomeOneModel? homeOneModelObj;
  HomeOneInitialModel? homeOneInitialModelObj;
  @override
  List<Object?> get props => [
    searchController,
    selectedDropDownValue,
    homeOneInitialModelObj,
    homeOneModelObj
  ];
  HomeOneState copyWith({
    TextEditingController? searchController,
    SelectionPopupModel? selectedDropDownValue,
    HomeOneInitialModel? homeOneInitialModelObj,
    HomeOneModel? homeOneModelObj,
  }) {
    return HomeOneState(
      searchController: searchController ?? this.searchController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      homeOneInitialModelObj:
          homeOneInitialModelObj ?? this.homeOneInitialModelObj,
      homeOneModelObj: homeOneModelObj ?? this.homeOneModelObj,
    );
  }
}