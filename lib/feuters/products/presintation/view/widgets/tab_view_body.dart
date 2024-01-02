import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dookanti/core/servise/firestore_servise.dart';
import 'package:dookanti/core/style/app_colors.dart';
import 'package:dookanti/feuters/home/data/models/categories_model.dart';
import 'package:dookanti/feuters/products/data/tap_repo/tap_repo_impl.dart';
import 'package:dookanti/feuters/products/presintation/view/widgets/tab_view_list_view.dart';
import 'package:dookanti/feuters/products/presintation/view_model/cubit/tap_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabViewBody extends StatefulWidget {
  const TabViewBody({
    super.key,
    required this.categoriesModel,
  });
  final CategoriesModel categoriesModel;
  @override
  State<TabViewBody> createState() => _TabViewBodyState();
}

class _TabViewBodyState extends State<TabViewBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController =
        TabController(length: widget.categoriesModel.parts.length, vsync: this)
          ..addListener(() {
            if (_tabController.indexIsChanging) {
            } else {}
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
      child: DefaultTabController(
        length: 8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.categoriesModel.categorieName,
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
                      widget.categoriesModel.parts.length,
                      (index) => Tab(
                        text: widget.categoriesModel.parts[index].partName,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: List.generate(
                  widget.categoriesModel.parts.length,
                  (index) => BlocProvider(
                    create: (context) => TapCubit(TapRepoImpl(
                        FireStoreServise(FirebaseFirestore.instance))),
                    child: TabViewListView(
                      partModel: widget.categoriesModel.parts[index],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
