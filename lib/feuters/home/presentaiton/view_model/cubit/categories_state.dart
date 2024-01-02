part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesSucsess extends CategoriesState {}

final class CategoriesFailure extends CategoriesState {
  final String errMessage;
  CategoriesFailure(this.errMessage);
}
