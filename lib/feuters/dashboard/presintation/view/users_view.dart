import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dookanti/core/functions/methods.dart';
import 'package:dookanti/core/servise/firestore_servise.dart';
import 'package:dookanti/feuters/dashboard/data/dashboard_repo/dashboard_repo_impl.dart';
import 'package:dookanti/feuters/dashboard/presintation/view/widgets/users_view_body.dart';
import 'package:dookanti/feuters/dashboard/presintation/view_model/get_users/get_users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});
  static const String id = '/usrsview';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Methods.DashBoardAppBar(context, 'Users'),
      body: BlocProvider(
        create: (context) => GetUsersCubit(
            DashBoardRepoImpl(FireStoreServise(FirebaseFirestore.instance)))
          ..getUsers(),
        child: const UsersViewBody(),
      ),
    );
  }
}
