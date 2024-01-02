import 'package:cached_network_image/cached_network_image.dart';
import 'package:dookanti/core/functions/size_config.dart';
import 'package:dookanti/core/style/app_colors.dart';
import 'package:dookanti/feuters/home/data/models/product_model.dart';
import 'package:dookanti/feuters/products/presintation/view/widgets/a_r_button.dart';
import 'package:dookanti/feuters/products/presintation/view/widgets/show_model_button_add_product.dart';
import 'package:dookanti/feuters/products/presintation/view/widgets/show_model_button_exit.dart';
import 'package:dookanti/feuters/products/presintation/view_model/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowModelButtonWidget extends StatelessWidget {
  const ShowModelButtonWidget({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 16, right: 16, bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          showModelButtonExit(
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: SizeConfig.defaultSize * 14,
            child: CachedNetworkImage(
              imageUrl: productModel.image,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productModel.name,
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
                  Text(
                    '${productModel.price}\$',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      bool quantityEmty = BlocProvider.of<CartCubit>(context)
                              .getProductCount(productModel) ==
                          0;
                      return Row(
                        children: [
                          ARButton(
                            color: quantityEmty
                                ? Colors.grey
                                : AppColors.primaryColor,
                            icon: Icons.remove,
                            onTap: () {
                              BlocProvider.of<CartCubit>(context)
                                  .removeItemFromCart(productModel, 1);
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              BlocProvider.of<CartCubit>(context)
                                  .getProductCount(productModel)
                                  .toString(),
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          ARButton(
                            color: AppColors.primaryColor,
                            icon: Icons.add,
                            onTap: () {
                              BlocProvider.of<CartCubit>(context)
                                  .addItemToCart(productModel);
                            },
                          ),
                        ],
                      );
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                child: ShowModelButtonAddProduct(productModel: productModel),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
