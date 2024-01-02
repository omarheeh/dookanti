import 'package:dookanti/feuters/home/data/models/cart_item_model.dart';
import 'package:dookanti/feuters/home/presentaiton/view/widgets/basket_list_view_item.dart';
import 'package:dookanti/feuters/products/presintation/view_model/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketListView extends StatelessWidget {
  const BasketListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            List<CartItemModel> cartItemModel =
                BlocProvider.of<CartCubit>(context).listProducts();
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: cartItemModel.length,
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemBuilder: (context, index) {
                return BasketListViewItem(
                  productModel: cartItemModel[index].productModel,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
