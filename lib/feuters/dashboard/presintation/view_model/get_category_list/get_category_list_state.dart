part of 'get_category_list_cubit.dart';

@immutable
sealed class GetCategoryListState {}

final class GetCategoryListInitial extends GetCategoryListState {}

final class GetCategoryListLoading extends GetCategoryListState {}

final class GetCategoryListSucsess extends GetCategoryListState {}

final class GetCategoryListFailure extends GetCategoryListState {
  final String errMessage;
  GetCategoryListFailure(this.errMessage);
}
