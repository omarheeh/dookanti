import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dookanti/core/servise/firestore_servise.dart';
import 'package:dookanti/feuters/auth/presintation/view_model/auth_cubit/auth_cubit_cubit.dart';
import 'package:dookanti/feuters/home/data/home_repo/home_repo_impl.dart';
import 'package:dookanti/feuters/home/presentaiton/view/widgets/order_view_body.dart';
import 'package:dookanti/feuters/home/presentaiton/view_model/orders_cubit/orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrederView extends StatelessWidget {
  const OrederView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => OrdersCubit(
            HomeRepoImpl(FireStoreServise(FirebaseFirestore.instance)))
          ..getOrders(
              email: BlocProvider.of<AuthCubitCubit>(context).userModel!.email),
        child: OrderViewBody(),
      ),
    );
  }
}
