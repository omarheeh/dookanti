import 'package:cached_network_image/cached_network_image.dart';
import 'package:dookanti/feuters/home/data/models/cart_item_model.dart';
import 'package:flutter/material.dart';

class OrderProductListViewItem extends StatelessWidget {
  const OrderProductListViewItem({
    super.key,
    required this.cartItemModel,
  });
  final CartItemModel cartItemModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 60,
          height: 110,
          child: CachedNetworkImage(
            imageUrl: cartItemModel.productModel.image,
            fit: BoxFit.contain,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartItemModel.productModel.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${cartItemModel.productModel.price} \$'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
