import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dookanti/core/functions/size_config.dart';
import 'package:dookanti/core/style/app_colors.dart';
import 'package:dookanti/feuters/home/data/models/categories_model.dart';
import 'package:dookanti/feuters/home/data/models/part_model.dart';
import 'package:dookanti/feuters/home/data/models/product_model.dart';
import 'package:dookanti/feuters/products/presintation/view/widgets/a_r_button.dart';
import 'package:dookanti/feuters/products/presintation/view/widgets/show_model_button_add_product.dart';
import 'package:dookanti/feuters/products/presintation/view/widgets/show_model_button_exit.dart';
import 'package:dookanti/feuters/products/presintation/view/widgets/tab_view_list_view_item.dart';
import 'package:dookanti/feuters/products/presintation/view_model/cubit/tap_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class TabViewListView extends StatefulWidget {
  const TabViewListView({
    super.key,
    required this.partModel,
  });
  final PartModel partModel;
  @override
  State<TabViewListView> createState() => _TabViewListViewState();
}

class _TabViewListViewState extends State<TabViewListView> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TapCubit>(context)
        .getProducts(partId: widget.partModel.partId);
    log(widget.partModel.partName);
    return BlocBuilder<TapCubit, TapState>(
      builder: (context, state) {
        if (state is TapSucsess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: EdgeInsets.only(bottom: SizeConfig.defaultSize * 4),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: state.products.length,
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _showModalBottomShetFunction(
                          context, state.products[index]);
                    },
                    child: TabViewListViewItem(
                        productModel: state.products[index]),
                  );
                },
              ),
            ),
          );
        } else if (state is TapFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          );
        }
      },
    );
  }

  Future<dynamic> _showModalBottomShetFunction(
      BuildContext context, ProductModel productModel) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      builder: (context) {
        return Builder(builder: (context) {
          return ShowModelButtonWidget(
            productModel: productModel,
          );
        });
      },
    );
  }
}

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
                  const Row(
                    children: [
                      ARButton(
                        color: AppColors.primaryColor,
                        icon: Icons.remove,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '1',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      ARButton(
                        color: AppColors.primaryColor,
                        icon: Icons.add,
                      ),
                    ],
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
