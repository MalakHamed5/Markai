class DimensionProduct {
  final double width;
  final double height;
  final double depth;

  const DimensionProduct(
      {required this.width, required this.height, required this.depth});

  factory DimensionProduct.fromJson(Map<String, dynamic> json) {
    return DimensionProduct(
      width: (json['width'] ?? 0).toDouble(),
      height: (json['height'] ?? 0).toDouble(),
      depth: (json['depth'] ?? 0).toDouble(),
    );
  }
}

