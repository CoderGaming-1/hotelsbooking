part of 'search_bloc.dart';

/// Represents the state of Search in the application.
// ignore_for_file: must_be_immutable
class SearchState extends Equatable {
  SearchState(
      {this.searchoneController,
      this.searchmostTabModelObj,
      this.searchModelObj});

  TextEditingController? searchoneController;
  SearchModel? searchModelObj;
  SearchmostTabModel? searchmostTabModelObj;

  @override
  List<Object?> get props =>
      [searchoneController, searchmostTabModelObj, searchModelObj];

  SearchState copyWith({
    TextEditingController? searchOneController,
    SearchmostTabModel? searchmostTabModelObj,
    SearchModel? searchModelObj,
  }) {
    return SearchState(
      searchoneController: searchoneController ?? this.searchoneController,
      searchmostTabModelObj:
          searchmostTabModelObj ?? this.searchmostTabModelObj,
      searchModelObj: searchModelObj ?? this.searchModelObj,
    );
  }
}
