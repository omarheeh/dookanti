class PartModel {
  final String partName;
  final String partId;

  PartModel({
    required this.partName,
    required this.partId,
  });

  factory PartModel.fromJson(jsonData) {
    return PartModel(
      partName: jsonData['name'],
      partId: jsonData.id,
    );
  }
}
