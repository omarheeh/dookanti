import 'package:cached_network_image/cached_network_image.dart';
import 'package:dookanti/feuters/home/data/models/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CategoryViewGridViewItem extends StatelessWidget {
  const CategoryViewGridViewItem({
    super.key,
    required this.categorieModel,
  });

  final CategoriesModel categorieModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: CachedNetworkImage(
            imageUrl: categorieModel.categorieImage,
            fit: BoxFit.cover,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Positioned(
          bottom: 15,
          right: 15,
          child: CircleAvatar(
            backgroundColor: Colors.green.shade400,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                IconlyLight.edit,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          right: 60,
          child: CircleAvatar(
            backgroundColor: Colors.red.shade400,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                IconlyLight.delete,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
