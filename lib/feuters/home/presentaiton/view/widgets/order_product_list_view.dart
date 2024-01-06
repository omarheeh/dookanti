import 'package:dookanti/feuters/home/data/models/cart_item_model.dart';
import 'package:dookanti/feuters/home/presentaiton/view/widgets/order_product_list_view_item.dart';
import 'package:flutter/material.dart';

class OrderProductsListView extends StatelessWidget {
  const OrderProductsListView({
    super.key,
    required this.cartItemModel,
  });
  final List<CartItemModel> cartItemModel;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartItemModel.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return OrderProductListViewItem(
          cartItemModel: cartItemModel[index],
        );
      },
    );
  }
}
