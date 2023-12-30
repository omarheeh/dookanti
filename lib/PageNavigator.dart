import 'package:dookanti/core/functions/size_config.dart';
import 'package:dookanti/feuters/home/presentaiton/view/home_view.dart';
import 'package:dookanti/feuters/home/presentaiton/view/widgets/custom_draggable_scroll.dart';
import 'package:dookanti/feuters/home/presentaiton/view/widgets/home_view_drawer.dart';
import 'package:dookanti/feuters/products/presintation/view/tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/cubits/page_controller/page_controler_cubit.dart';

class PageNavigator extends StatefulWidget {
  const PageNavigator({super.key});
  static const String id = 'pageNavigator';
  @override
  State<PageNavigator> createState() => _PageNavigatorState();
}

class _PageNavigatorState extends State<PageNavigator> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  late PageController scrollController;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      scrollController.jumpToPage(_selectedIndex);
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      key: scaffoldKey,
      drawer: SizedBox(
        width: SizeConfig.screenWidth,
        child: const HomeViewDrawer(),
      ),
      body: Stack(
        children: [
          BlocBuilder<PageControlerCubit, PageControlerState>(
            builder: (context, state) {
              if (state is PageControlerHome) {
                return HomeView(
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                );
              } else if (state is PageControlerTabView) {
                return TabView();
              } else {
                return SizedBox();
              }
            },
          ),
          const CustomDraggableScroll(),
        ],
      ),
    );
  }
}
