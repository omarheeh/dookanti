import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dookanti/core/servise/firestore_servise.dart';
import 'package:dookanti/feuters/home/data/home_repo/home_repo_impl.dart';
import 'package:dookanti/feuters/home/presentaiton/view/widgets/search_view_body.dart';
import 'package:dookanti/feuters/home/presentaiton/view_model/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static const String id = 'searchView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SearchCubit(
            HomeRepoImpl(FireStoreServise(FirebaseFirestore.instance))),
        child: const SearchViewBody(),
      ),
    );
  }
}
