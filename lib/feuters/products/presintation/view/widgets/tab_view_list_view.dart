import 'dart:developer';
import 'package:dookanti/core/functions/size_config.dart';
import 'package:dookanti/core/style/app_colors.dart';
import 'package:dookanti/feuters/home/data/models/part_model.dart';
import 'package:dookanti/feuters/home/data/models/product_model.dart';
import 'package:dookanti/feuters/products/presintation/view/widgets/show_model_button_widget.dart';
import 'package:dookanti/feuters/products/presintation/view/widgets/tab_view_list_view_item.dart';
import 'package:dookanti/feuters/products/presintation/view_model/cubit/tap_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
