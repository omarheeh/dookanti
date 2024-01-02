import 'package:dookanti/feuters/home/data/models/categories_model.dart';
import 'package:dookanti/feuters/home/presentaiton/view_model/cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_grid_view_item.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSucsess) {
          List<CategoriesModel> categoriesModel =
              BlocProvider.of<CategoriesCubit>(context).categories;
          return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categoriesModel.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return HomeGridViewItem(
                  categoriesModel: categoriesModel[index],
                );
              });
        } else if (state is CategoriesFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
