import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dookanti/core/functions/methods.dart';
import 'package:dookanti/core/servise/firestore_servise.dart';
import 'package:dookanti/core/servise/storage_servise.dart';
import 'package:dookanti/feuters/dashboard/data/category_repo/category_repo_impl.dart';
import 'package:dookanti/feuters/dashboard/presintation/view/widgets/add_category_view_body.dart';
import 'package:dookanti/feuters/dashboard/presintation/view_model/add_category/add_category_cubit.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCategoryView extends StatelessWidget {
  const AddCategoryView({super.key});
  static const String id = 'addcategoryview';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Methods.DashBoardAppBar(context, 'Add Category'),
      body: BlocProvider(
        create: (context) => AddCategoryCubit(CategoryRepoImpl(
            StorageService(FirebaseStorage.instance),
            FireStoreServise(FirebaseFirestore.instance))),
        child: AddCategoryViewBody(),
      ),
    );
  }
}
