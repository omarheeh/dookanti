class ProductModel {
  final String name;
  final String categoriesId;
  final String categoriesName;
  final String image;
  final String partId;
  final String partName;
  final String price;
  final num quantity;

  ProductModel({
    required this.name,
    required this.categoriesId,
    required this.categoriesName,
    required this.image,
    required this.partId,
    required this.partName,
    required this.price,
    required this.quantity,
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      name: jsonData['name'],
      categoriesId: jsonData['categoriesId'],
      categoriesName: jsonData['categoriesName'],
      image: jsonData['image'],
      partId: jsonData['partId'],
      partName: jsonData['partId'],
      price: jsonData['price'],
      quantity: jsonData['quantity'],
    );
  }
}
