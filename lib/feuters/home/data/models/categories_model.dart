import 'package:dookanti/feuters/home/data/models/part_model.dart';

class CategoriesModel {
  final String categorieName;
  final String categorieImage;
  final String categorieId;
  final List<PartModel> parts;

  CategoriesModel({
    required this.categorieName,
    required this.categorieId,
    required this.categorieImage,
    required this.parts,
  });

  factory CategoriesModel.jsonData(jsonData, parts) {
    List<PartModel> partsList = [];
    for (int i = 0; i < parts.docs.length; i++) {
      partsList.add(PartModel.fromJson(parts.docs[i]));
    }
    return CategoriesModel(
        categorieId: jsonData.id,
        categorieImage: jsonData['image'],
        categorieName: jsonData['name'],
        parts: partsList);
  }
}
