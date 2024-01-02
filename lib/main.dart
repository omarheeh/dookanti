import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dookanti/PageNavigator.dart';
import 'package:dookanti/core/cubits/page_controller/page_controler_cubit.dart';
import 'package:dookanti/core/servise/auth_servise.dart';
import 'package:dookanti/core/servise/firestore_servise.dart';
import 'package:dookanti/core/style/style.dart';
import 'package:dookanti/feuters/auth/data/auth_repo/auth_repo_impl.dart';
import 'package:dookanti/feuters/auth/presintation/view_model/auth_cubit/auth_cubit_cubit.dart';
import 'package:dookanti/feuters/home/data/home_repo/home_repo_impl.dart';
import 'package:dookanti/feuters/home/presentaiton/view_model/cubit/categories_cubit.dart';
import 'package:dookanti/feuters/products/data/cart_repo/cart_repo_impl.dart';
import 'package:dookanti/feuters/products/data/tap_repo/tap_repo_impl.dart';
import 'package:dookanti/feuters/products/presintation/view_model/cart_cubit/cart_cubit.dart';
import 'package:dookanti/feuters/products/presintation/view_model/cubit/tap_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageControlerCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit(
              CartRepoImpl(FireStoreServise(FirebaseFirestore.instance))),
        ),
        BlocProvider(
          create: (context) => CategoriesCubit(
              HomeRepoImpl(FireStoreServise(FirebaseFirestore.instance)))
            ..getCategories(),
        ),
        BlocProvider(
          create: (context) => AuthCubitCubit(
            AuthRepoImpl(
              AuthServise(FirebaseAuth.instance),
              FireStoreServise(
                FirebaseFirestore.instance,
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Style.ThemeStyle(),
        home: const PageNavigator(),
      ),
    );
  }
}
