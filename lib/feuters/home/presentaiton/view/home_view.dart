import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dookanti/core/servise/firestore_servise.dart';
import 'package:dookanti/feuters/home/data/models/categories_model.dart';
import 'package:dookanti/feuters/home/data/models/part_model.dart';
import 'package:dookanti/feuters/home/data/models/product_model.dart';
import 'package:dookanti/feuters/home/presentaiton/view/widgets/home_view_body.dart';
import 'package:dookanti/feuters/home/presentaiton/view/widgets/notification_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

class HomeView extends StatelessWidget {
  static const String id = 'homeview';
  const HomeView({
    super.key,
    required this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: onPressed,
          icon: SvgPicture.asset('assets/svg/list.svg'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: const NotificationView(),
                ),
              );
            },
            icon: const Icon(IconlyLight.notification),
          )
        ],
      ),
      body: const HomeViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FireStoreServise fireStoreServise =
              FireStoreServise(FirebaseFirestore.instance);

          var data = await fireStoreServise.getProducts(
              collection: 'products', partId: 'm9CJChm4MoQEMCzd7o7P');
          log(data.docs.length.toString());
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
