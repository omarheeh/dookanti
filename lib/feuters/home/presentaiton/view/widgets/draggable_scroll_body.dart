import 'dart:developer';
import 'package:dookanti/feuters/home/presentaiton/view/widgets/basket_list_view.dart';
import 'package:dookanti/feuters/home/presentaiton/view/widgets/draggable_body_sub_title.dart';
import 'package:dookanti/feuters/home/presentaiton/view/widgets/draggable_scroll_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../../core/widgets/custom_button.dart';

class DraggableScrollBody extends StatelessWidget {
  const DraggableScrollBody({
    super.key,
    required this.controller,
  });

  final DraggableScrollableController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                controller.animateTo(0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              },
              icon: const Icon(
                IconlyLight.arrowLeft2,
              ),
            ),
            const DraggableScrollTitle(),
            const BasketListView(),
            const DraggableBodySubTotal(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onTap: () {
                        log('add');
                      },
                      title: 'ADD ITEMS',
                      outLine: true,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: CustomButton(
                      onTap: () {
                        log('add');
                      },
                      title: 'ADD ITEMS',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
