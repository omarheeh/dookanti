import 'dart:developer';
import 'package:dookanti/feuters/products/presintation/view/widgets/tab_view_list_view_item.dart';
import 'package:flutter/material.dart';

class TabViewListView extends StatefulWidget {
  const TabViewListView({
    super.key,
  });

  @override
  State<TabViewListView> createState() => _TabViewListViewState();
}

class _TabViewListViewState extends State<TabViewListView> {
  @override
  void initState() {
    super.initState();
    log('start');
  }

  @override
  void dispose() {
    super.dispose();
    log('dispose');
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: 20,
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemBuilder: (context, index) {
        return TabViewListViewItem();
      },
    );
  }
}
