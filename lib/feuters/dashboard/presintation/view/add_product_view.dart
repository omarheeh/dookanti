import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dookanti/core/functions/methods.dart';
import 'package:dookanti/core/servise/firestore_servise.dart';
import 'package:dookanti/core/servise/storage_servise.dart';
import 'package:dookanti/feuters/dashboard/data/dashboard_repo/dashboard_repo_impl.dart';
import 'package:dookanti/feuters/dashboard/data/product_repo/product_repo_impl.dart';
import 'package:dookanti/feuters/dashboard/presintation/view/widgets/add_product_view_body.dart';
import 'package:dookanti/feuters/dashboard/presintation/view_model/add_product/add_product_cubit.dart';
import 'package:dookanti/feuters/dashboard/presintation/view_model/get_category_list/get_category_list_cubit.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const String id = 'addproductview';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Methods.DashBoardAppBar(context, 'Add Product'),
      body: BlocProvider(
        create: (context) => GetCategoryListCubit(
          DashBoardRepoImpl(
            FireStoreServise(
              FirebaseFirestore.instance,
            ),
          ),
        )..getCategories(),
        child: BlocProvider(
          create: (context) => AddProductCubit(ProductRepoImpl(
              StorageService(FirebaseStorage.instance),
              FireStoreServise(FirebaseFirestore.instance))),
          child: AddProductViewBody(),
        ),
      ),
    );
  }
}
