import 'package:dookanti/core/cubits/page_controller/page_controler_cubit.dart';
import 'package:dookanti/feuters/home/data/models/categories_model.dart';
import 'package:dookanti/feuters/products/presintation/view/tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeGridViewItem extends StatelessWidget {
  const HomeGridViewItem({
    super.key,
    required this.categoriesModel,
  });
  final CategoriesModel categoriesModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<PageControlerCubit>(context)
            .ChangePage(route: TabView.id, categoriesModel: categoriesModel);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 4,
              color: Colors.grey.shade300,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: categoriesModel.categorieImage,
            fit: BoxFit.cover,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
