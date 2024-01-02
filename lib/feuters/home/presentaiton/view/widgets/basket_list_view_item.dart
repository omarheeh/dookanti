import 'package:dookanti/core/style/app_colors.dart';
import 'package:dookanti/feuters/home/data/models/product_model.dart';
import 'package:dookanti/feuters/products/presintation/view_model/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class BasketListViewItem extends StatelessWidget {
  const BasketListViewItem({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 60,
              height: 110,
              child: CachedNetworkImage(
                imageUrl: productModel.image,
                fit: BoxFit.contain,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Text(
                    productModel.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${productModel.price}\$'),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primaryColor.withOpacity(0.1),
                        ),
                        child: BlocBuilder<CartCubit, CartState>(
                          builder: (context, state) {
                            bool quantityOne =
                                BlocProvider.of<CartCubit>(context)
                                        .getProductCount(productModel) ==
                                    1;
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<CartCubit>(context)
                                        .removeItemFromCart(productModel, 1);
                                  },
                                  child: Icon(
                                    quantityOne
                                        ? IconlyLight.delete
                                        : Icons.remove,
                                    color: quantityOne
                                        ? AppColors.primaryColor
                                        : null,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  BlocProvider.of<CartCubit>(context)
                                      .getProductCount(productModel)
                                      .toString(),
                                  style: const TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<CartCubit>(context)
                                        .addItemToCart(productModel);
                                  },
                                  child: const Icon(Icons.add),
                                ),
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<CartCubit>(context).removeItemFromCart(
                  productModel,
                  BlocProvider.of<CartCubit>(context)
                      .getProductCount(productModel));
            },
            child: Icon(
              IconlyLight.delete,
              color: AppColors.primaryColor,
            ),
          ),
        )
      ],
    );
  }
}
