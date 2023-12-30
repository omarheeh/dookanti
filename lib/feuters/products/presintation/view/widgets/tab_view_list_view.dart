import 'dart:developer';

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
    // TODO: implement initState
    super.initState();
    log('start');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    log('dispose');
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return Text('omar');
        });
  }
}


/*


*/