import '../../../../core/api/urls.dart';

class DimensionProduct {
  final double width;
  final double height;
  final double depth;

  const DimensionProduct(
      {required this.width, required this.height, required this.depth});

  factory DimensionProduct.fromJson(Map<String, dynamic> json) {
    return DimensionProduct(
      width: (json[ApiKeys.width] ?? 0).toDouble(),
      height: (json[ApiKeys.height] ?? 0).toDouble(),
      depth: (json[ApiKeys.depth] ?? 0).toDouble(),
    );
  }
}

