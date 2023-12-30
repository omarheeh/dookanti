import 'package:dookanti/feuters/home/presentaiton/view/widgets/basket_list_view_item.dart';
import 'package:flutter/material.dart';

class BasketListView extends StatelessWidget {
  const BasketListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: 20,
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemBuilder: (context, index) {
            return BasketListViewItem();
          },
        ),
      ),
    );
  }
}
