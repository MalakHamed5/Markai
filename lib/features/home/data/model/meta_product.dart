class MetaProduct {
  final String createdAt;
  final String updatedAt;
  final String barcode;
  final String qrCode;

  const MetaProduct(
      {required this.createdAt,
      required this.updatedAt,
      required this.barcode,
      required this.qrCode});

  factory MetaProduct.fromJson(Map<String, dynamic> json) {
    return MetaProduct(
      createdAt: json['createdAt'] ?? "",
      updatedAt: json['updatedAt'] ?? "",
      barcode: json['barcode'] ?? "",
      qrCode: json['qrCode'] ?? "",
    );
  }
}

