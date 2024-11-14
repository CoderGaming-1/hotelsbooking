import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'detailslist_item_model.dart';

/// This class defines the variables used in the [details_screen],
/// and is typically used to hold data that is passed between different parts of the application.
// ignore_for_file: must_be_immutable
class DetailsModel extends Equatable {
  DetailsModel({this.detailslistItemList = const []});

  List<DetailslistItemModel> detailslistItemList;

  DetailsModel copyWith({List<DetailslistItemModel>? detailslistItemList}) {
    return DetailsModel(
      detailslistItemList: detailslistItemList ?? this.detailslistItemList,
    );
  }

  @override
  List<Object?> get props => [detailslistItemList];
}
