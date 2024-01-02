part of 'tap_cubit.dart';

@immutable
sealed class TapState {}

final class TapInitial extends TapState {}

final class TapLoading extends TapState {}

final class TapSucsess extends TapState {
  final List<ProductModel> products;
  TapSucsess(this.products);
}

final class TapFailure extends TapState {
  final String errMessage;
  TapFailure(this.errMessage);
}
