import 'package:ecommerse/features/home/data/model/product_model.dart';

class CartModel {
  final List<ProductModel> products;

  CartModel({required this.products});
  factory CartModel.fromJson(Map<String, dynamic> json) {
    final innerList = json['list'][0]['list'] as List<dynamic>;

    return CartModel(
        products: innerList.map((e) => ProductModel.fromJson(e)).toList());
  }
}
