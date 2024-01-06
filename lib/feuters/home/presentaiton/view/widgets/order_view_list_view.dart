import 'package:dookanti/feuters/home/presentaiton/view/widgets/order_view_list_view_item.dart';
import 'package:dookanti/feuters/home/presentaiton/view_model/orders_cubit/orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderViewListView extends StatelessWidget {
  const OrderViewListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        if (state is OrdersSucsess) {
          return ListView.builder(
            itemCount: state.orders.length,
            itemBuilder: (context, index) {
              return OrderViewListViewItem(
                orderModel: state.orders[index],
              );
            },
          );
        } else if (state is OrdersFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
