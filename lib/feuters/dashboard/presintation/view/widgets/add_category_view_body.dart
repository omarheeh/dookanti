import 'package:dookanti/core/servise/storage_servise.dart';
import 'package:dookanti/core/widgets/custom_button.dart';
import 'package:dookanti/feuters/dashboard/presintation/view/widgets/add_category_add_part.dart';
import 'package:dookanti/feuters/dashboard/presintation/view/widgets/pick_image.dart';
import 'package:dookanti/feuters/dashboard/presintation/view_model/add_category/add_category_cubit.dart';
import 'package:dookanti/feuters/home/presentaiton/view/widgets/custom_text_field.dart';
import 'package:dookanti/feuters/home/presentaiton/view_model/cubit/categories_cubit.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'package:dookanti/core/functions/size_config.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddCategoryViewBody extends StatefulWidget {
  const AddCategoryViewBody({super.key});

  @override
  State<AddCategoryViewBody> createState() => _AddCategoryViewBodyState();
}

class _AddCategoryViewBodyState extends State<AddCategoryViewBody> {
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocConsumer<AddCategoryCubit, AddCategoryState>(
        listener: (context, state) async {
          if (state is AddCategorySucsess) {
            await BlocProvider.of<CategoriesCubit>(context).getCategories();
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is AddCategoryLoading,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: SizeConfig.screenWidth,
                    height: 20,
                  ),
                  const PickImgae(),
                  const SizedBox(height: 15),
                  CustomTextField(
                    iconData: IconlyLight.document,
                    hintText: 'Category Name',
                    controller: nameController,
                  ),
                  const SizedBox(height: 15),
                  const AddCategoryAddPart(),
                  const SizedBox(height: 20),
                  CustomButton(
                    title: 'Add Category',
                    onTap: () {
                      if (nameController.text != '' &&
                          BlocProvider.of<AddCategoryCubit>(context).file !=
                              null) {
                        BlocProvider.of<AddCategoryCubit>(context)
                            .addCategory(name: nameController.text);
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
