import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dookanti/core/functions/methods.dart';
import 'package:dookanti/core/servise/auth_servise.dart';
import 'package:dookanti/core/servise/firestore_servise.dart';
import 'package:dookanti/feuters/auth/data/auth_repo/auth_repo_impl.dart';
import 'package:dookanti/feuters/dashboard/presintation/view/widgets/new_user_view_body.dart';
import 'package:dookanti/feuters/dashboard/presintation/view_model/add_users/add_users_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewUserView extends StatelessWidget {
  const NewUserView({super.key});
  static const String id = '/adduserview';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Methods.DashBoardAppBar(context, 'Add User'),
      body: BlocProvider(
        create: (context) => AddUsersCubit(AuthRepoImpl(
            AuthServise(FirebaseAuth.instance),
            FireStoreServise(FirebaseFirestore.instance))),
        child: NewUserViewBody(),
      ),
    );
  }
}
