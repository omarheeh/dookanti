import 'package:dookanti/core/cubits/page_controller/page_controler_cubit.dart';
import 'package:dookanti/feuters/home/presentaiton/view/home_view.dart';
import 'package:dookanti/feuters/home/presentaiton/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';

import 'widgets/tab_view_body.dart';

class TabView extends StatelessWidget {
  static const String id = 'tabview';

  const TabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            BlocProvider.of<PageControlerCubit>(context)
                .ChangePage(HomeView.id);
          },
          icon: const Icon(
            IconlyLight.arrowLeft2,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: SearchView(),
                ),
              );
            },
            icon: const Icon(
              IconlyLight.search,
            ),
          ),
        ],
      ),
      body: const TabViewBody(),
    );
  }
}
