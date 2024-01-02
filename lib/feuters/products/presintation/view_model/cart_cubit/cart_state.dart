part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartAdd extends CartState {}

final class CartAddDone extends CartState {}

final class CartRemove extends CartState {}

final class CartRemoveDone extends CartState {}

final class CartSendLoading extends CartState {}

final class CartSendSucsess extends CartState {
  final String sucsessMessage;
  CartSendSucsess(this.sucsessMessage);
}

final class CartSendFailure extends CartState {
  final String errMessage;
  CartSendFailure(this.errMessage);
}
