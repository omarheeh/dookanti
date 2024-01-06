part of 'orders_cubit.dart';

@immutable
sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}

final class OrdersLoading extends OrdersState {}

final class OrdersSucsess extends OrdersState {
  final List<OrderModel> orders;
  OrdersSucsess(this.orders);
}

final class OrdersFailure extends OrdersState {
  final String errMessage;
  OrdersFailure(this.errMessage);
}
