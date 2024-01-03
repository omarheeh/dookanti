part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSucsess extends SearchState {
  final List<ProductModel> products;
  SearchSucsess(this.products);
}

final class SearchFailure extends SearchState {
  final String errMessage;
  SearchFailure(this.errMessage);
}
