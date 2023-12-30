import 'dart:developer';
import 'package:dookanti/core/style/app_colors.dart';
import 'package:dookanti/feuters/products/presintation/view/widgets/tab_view_list_view.dart';
import 'package:flutter/material.dart';

class TabViewBody extends StatefulWidget {
  const TabViewBody({super.key});

  @override
  State<TabViewBody> createState() => _TabViewBodyState();
}

class _TabViewBodyState extends State<TabViewBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 8, vsync: this)
      ..addListener(() {
        if (_tabController.indexIsChanging) {
        } else {
          log(_tabController.index.toString());
          setState(() {});
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: DefaultTabController(
          length: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Oil',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: Colors.black,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                labelColor: Colors.white,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primaryColor,
                ),
                tabs: List.generate(
                  8,
                  (index) => Tab(
                    text: 'Gerat Offers',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: List.generate(
                    8,
                    (index) => const TabViewListView(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
