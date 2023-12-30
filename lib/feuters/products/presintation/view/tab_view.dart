import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../page_controller/page_controler_cubit.dart';
import 'widgets/tab_view_body.dart';

class TabView extends StatelessWidget {
  const TabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            BlocProvider.of<PageControlerCubit>(context).ChangePage('home');
          },
          icon: const Icon(
            IconlyLight.arrowLeft2,
          ),
        ),
      ),
      body: const TabViewBody(),
    );
  }
}
