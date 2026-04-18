class ProductModel {
  /*   List<String> there is problem here!
  */
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;

  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final int weight;
  final DimensionProduct dimensions;
  final List<ReviewProduct> reviews;
  final MetaProduct meta;
  final String thumbnail;
  final List<String> images;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final String warrantyInfo;
  final String shippingInfo;
  final String avaliabilityStatus;

  const ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.reviews,
    required this.meta,
    required this.thumbnail,
    required this.images,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.warrantyInfo,
    required this.shippingInfo,
    required this.avaliabilityStatus,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      category: json['category'] ?? "",
      price: (json['price'] ?? 0).toDouble(),
      discountPercentage: (json['discountPercentage'] ?? 0).toDouble(),
      rating: (json['rating'] ?? 0).toDouble(),
      stock: json['stock'] ?? 0,
      tags: List<String>.from(json['tags'] ?? []),
      brand: json['brand'] ?? "",
      sku: json['sku'] ?? "",
      weight: json['weight'] ?? 0,
      dimensions: DimensionProduct.fromJson(json['dimensions'] ?? {}),
      reviews: (json['reviews'] as List<dynamic>? ?? [])
          .map((e) => ReviewProduct.fromJson(e))
          .toList(),
      meta: MetaProduct.fromJson(json['meta'] ?? {}),
      thumbnail: json['thumbnail'] ?? "",
      images: List<String>.from(json['images'] ?? []),
      returnPolicy: json['returnPolicy'] ?? "",
      minimumOrderQuantity: json['minimumOrderQuantity'] ?? 0,
      warrantyInfo: json['warrantyInfo'] ?? "",
      shippingInfo: json['shippingInfo'] ?? "",
      avaliabilityStatus: json['avaliabilityStatus'] ?? "",
    );
  }
}

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

class ReviewProduct {
  final int rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerEmail;

  const ReviewProduct(
      {required this.rating,
      required this.comment,
      required this.date,
      required this.reviewerName,
      required this.reviewerEmail});

  factory ReviewProduct.fromJson(Map<String, dynamic> json) {
    return ReviewProduct(
      rating: json['rating'] ?? 0,
      comment: json['comment'] ?? "",
      date: json['date'] ?? "",
      reviewerName: json['reviewerName'] ?? "",
      reviewerEmail: json['reviewerEmail'] ?? "",
    );
  }
}
