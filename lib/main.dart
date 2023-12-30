import 'package:dookanti/PageNavigator.dart';
import 'package:dookanti/core/style/style.dart';
import 'package:dookanti/feuters/page_controller/page_controler_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Style.ThemeStyle(),
        home: const PageNavigator(),
      ),
    );
  }
}
