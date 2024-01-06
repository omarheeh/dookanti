import 'package:dookanti/core/widgets/k_spaser.dart';
import 'package:dookanti/feuters/home/presentaiton/view/widgets/order_view_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VSpaser(3),
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              IconlyLight.arrowLeft2,
              size: 30,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: OrderViewListView(),
          ),
        ),
      ],
    );
  }
}
