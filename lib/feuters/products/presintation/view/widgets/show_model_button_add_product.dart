import 'package:dookanti/core/style/app_colors.dart';
import 'package:dookanti/feuters/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ShowModelButtonAddProduct extends StatelessWidget {
  const ShowModelButtonAddProduct({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            const Icon(
              Icons.add,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            const Text(
              'Add To Basket',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const Spacer(),
            Text(
              '${productModel.price} \$',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
