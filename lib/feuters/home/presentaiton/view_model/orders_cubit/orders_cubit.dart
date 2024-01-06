import 'package:bloc/bloc.dart';
import 'package:dookanti/feuters/home/data/home_repo/home_repo_impl.dart';
import 'package:dookanti/feuters/home/data/models/order_model.dart';
import 'package:meta/meta.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  HomeRepoImpl homeRepoImpl;
  OrdersCubit(this.homeRepoImpl) : super(OrdersInitial());
  Future<void> getOrders({required String email}) async {
    emit(OrdersLoading());
    var result = await homeRepoImpl.getOrders(email: email);
    result.fold(
      (failure) => emit(OrdersFailure(failure.errMessage)),
      (orders) => emit(OrdersSucsess(orders)),
    );
  }
}
