import 'package:dookanti/core/style/app_colors.dart';
import 'package:dookanti/feuters/dashboard/presintation/view/add_categrys_view.dart';
import 'package:dookanti/feuters/dashboard/presintation/view/widgets/categorys_view_grid_view.dart';
import 'package:flutter/material.dart';

class CategorysViewBody extends StatelessWidget {
  const CategorysViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AddCategoryView.id);
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          CategorysViewGirdView(),
        ],
      ),
    );
  }
}
