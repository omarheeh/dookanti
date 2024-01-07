import 'dart:developer';

import 'package:dookanti/core/functions/size_config.dart';
import 'package:dookanti/core/style/app_colors.dart';
import 'package:dookanti/core/widgets/custom_button.dart';
import 'package:dookanti/feuters/dashboard/presintation/view/widgets/list_select_widget.dart';
import 'package:dookanti/feuters/dashboard/presintation/view/widgets/pick_product_image.dart';
import 'package:dookanti/feuters/dashboard/presintation/view_model/add_product/add_product_cubit.dart';
import 'package:dookanti/feuters/dashboard/presintation/view_model/get_category_list/get_category_list_cubit.dart';
import 'package:dookanti/feuters/home/data/models/categories_model.dart';
import 'package:dookanti/feuters/home/presentaiton/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  late TextEditingController nameController;

  late TextEditingController priceController;

  late TextEditingController quantityController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    priceController = TextEditingController();
    quantityController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoryListCubit, GetCategoryListState>(
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is GetCategoryListLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: SizeConfig.screenWidth,
                    height: 20,
                  ),
                  const PickProductImgae(),
                  const SizedBox(height: 15),
                  CustomTextField(
                    hintText: 'name',
                    controller: nameController,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    hintText: 'price',
                    controller: priceController,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    hintText: 'quantity',
                    controller: quantityController,
                  ),
                  const SizedBox(height: 10),
                  const SelectWidgets(),
                  BlocListener<AddProductCubit, AddProductState>(
                    listener: (context, state) {
                      if (state is AddProductSucsess) {
                        Navigator.of(context).pop();
                      }
                      if (state is AddProductFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('sum field is empty')));
                      }
                    },
                    child: CustomButton(
                      title: 'Add Product',
                      onTap: () {
                        BlocProvider.of<AddProductCubit>(context).addProduct(
                            name: nameController.text,
                            price: priceController.text,
                            quantity: quantityController.text);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class SelectWidgets extends StatefulWidget {
  const SelectWidgets({super.key});

  @override
  State<SelectWidgets> createState() => _SelectWidgetsState();
}

class _SelectWidgetsState extends State<SelectWidgets> {
  int? selectCategory;
  @override
  Widget build(BuildContext context) {
    List<CategoriesModel> categories =
        BlocProvider.of<GetCategoryListCubit>(context).categories;
    List<String> categoryTitleList =
        categories.map((e) => e.categorieName).toList();
    List<String> categoryValueList =
        categories.map((e) => e.categorieId).toList();
    return Column(
      children: [
        ListSelectWidget(
          dataList: categoryTitleList,
          valueList: categoryValueList,
          hintText: 'Select Category',
          onChanged: (value) {
            selectCategory = categoryValueList.indexOf(value!);
            BlocProvider.of<AddProductCubit>(context).cId = value;
            BlocProvider.of<AddProductCubit>(context).cName =
                categories[selectCategory!].categorieName;

            setState(() {});
          },
        ),
        const SizedBox(height: 10),
        Column(
          children: List.generate(
            categories.length,
            (index) => Visibility(
              visible: index == selectCategory,
              child: PartsListView(
                categories: categories,
                selectCategory: selectCategory,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class PartsListView extends StatefulWidget {
  const PartsListView({
    super.key,
    required this.categories,
    required this.selectCategory,
  });

  final List<CategoriesModel> categories;
  final int? selectCategory;

  @override
  State<PartsListView> createState() => _PartsListViewState();
}

class _PartsListViewState extends State<PartsListView> {
  int? selectedPart;

  @override
  void initState() {
    super.initState();
    log('message');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          itemCount: widget.categories[widget.selectCategory!].parts.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                selectedPart = index;
                BlocProvider.of<AddProductCubit>(context).pId = widget
                    .categories[widget.selectCategory!].parts[index].partId;
                BlocProvider.of<AddProductCubit>(context).pName = widget
                    .categories[widget.selectCategory!].parts[index].partName;
                setState(() {});
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                margin: const EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: selectedPart == index
                        ? AppColors.primaryColor
                        : Colors.black87,
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Center(
                  child: Text(
                    widget.categories[widget.selectCategory!].parts[index]
                        .partName,
                    style: TextStyle(
                      color: selectedPart == index
                          ? AppColors.primaryColor
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
