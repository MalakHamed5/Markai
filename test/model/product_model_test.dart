import 'package:ecommerse/core/api/urls.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerse/features/home/data/model/product_model.dart';

void main() {
  test('ProductModel fromJson should parse correctly', () {
    final json = {
      ApiKeys.id: 1,
      ApiKeys.title: "Essence Mascara Lash Princess",
      ApiKeys.description:
          "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
      ApiKeys.category: "beauty",
      ApiKeys.price: 9.99,
      ApiKeys.discountPercentage: 10.48,
      ApiKeys.rating: 2.56,
      ApiKeys.stock: 99,
      ApiKeys.tags: ["beauty", "mascara"],
      ApiKeys.brand: "Essence",
      ApiKeys.sku: "BEA-ESS-ESS-001",
      ApiKeys.weight: 4,
      ApiKeys.dimensions: {"width": 15.14, "height": 13.08, "depth": 22.99},
      ApiKeys.warrantyInformation: "1 week warranty",
      ApiKeys.shippingInformation: "Ships in 3-5 business days",
      ApiKeys.availabilityStatus: "In Stock",
      ApiKeys.reviews: [
        {
          ApiKeys.rating: 3,
          ApiKeys.comment: "Would not recommend!",
          ApiKeys.date: "2025-04-30T09:41:02.053Z",
          ApiKeys.reviewerName: "Eleanor Collins",
          ApiKeys.reviewerEmail: "eleanor.collins@x.dummyjson.com"
        },
        {
          ApiKeys.rating: 4,
          ApiKeys.comment: "Very satisfied!",
          ApiKeys.date: "2025-04-30T09:41:02.053Z",
          ApiKeys.reviewerName: "Lucas Gordon",
          ApiKeys.reviewerEmail: "lucas.gordon@x.dummyjson.com"
        },
        {
          ApiKeys.rating: 5,
          ApiKeys.comment: "Highly impressed!",
          ApiKeys.date: "2025-04-30T09:41:02.053Z",
          ApiKeys.reviewerName: "Eleanor Collins",
          ApiKeys.reviewerEmail: "eleanor.collins@x.dummyjson.com"
        }
      ],
      ApiKeys.returnPolicy: "No return policy",
      ApiKeys.minimumOrderQuantity: 48,
      ApiKeys.meta: {
        ApiKeys.createdAt: "2025-04-30T09:41:02.053Z",
        ApiKeys.updatedAt: "2025-04-30T09:41:02.053Z",
        ApiKeys.barcode: "5784719087687",
        ApiKeys.qrCode: "https://cdn.dummyjson.com/public/qr-code.png"
      },
      ApiKeys.images: [
        "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp"
      ],
      ApiKeys.thumbnail:
          "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp"
    };

    final product = ProductModel.fromJson(json);

    expect(product.id, 1);
    expect(product.title, "Essence Mascara Lash Princess");
    expect(product.price, 9.99);
    expect(product.description,
        "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.");
    expect(product.category, "beauty");
    expect(product.discountPercentage, 10.48);
    expect(product.rating, 2.56);
    expect(product.stock, 99);
    expect(product.tags, ["beauty", "mascara"]);
    expect(product.brand, "Essence");
    expect(product.sku, "BEA-ESS-ESS-001");
    expect(product.weight, 4);
    expect(product.dimensions.width, 15.14);
    expect(product.dimensions.height, 13.08);
    expect(product.dimensions.depth, 22.99);
    expect(product.reviews.first.rating, 3);
    expect(product.reviews.first.comment, "Would not recommend!");
    expect(product.reviews.first.date, "2025-04-30T09:41:02.053Z");
    expect(product.reviews.first.reviewerName, "Eleanor Collins");
    expect(product.meta.createdAt, "2025-04-30T09:41:02.053Z");
    expect(product.meta.updatedAt, "2025-04-30T09:41:02.053Z");
    expect(product.meta.barcode, "5784719087687");
    expect(product.meta.qrCode, "https://cdn.dummyjson.com/public/qr-code.png");
    expect(product.thumbnail,
        "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp");
    expect(product.images,
        ["https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp"]);
    expect(product.returnPolicy, "No return policy");
    expect(product.minimumOrderQuantity, 48);
    expect(product.warrantyInfo, "1 week warranty");
    expect(product.shippingInfo, "Ships in 3-5 business days");
    expect(product.avaliabilityStatus, "In Stock");
    
  });
}
