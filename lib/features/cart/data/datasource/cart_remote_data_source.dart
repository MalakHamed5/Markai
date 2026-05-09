import 'dart:developer';

import 'package:ecommerse/core/api/api_consumer.dart';
import 'package:ecommerse/core/error/failure.dart';
import 'package:ecommerse/features/home/data/model/product_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/urls.dart';
import '../model/cart_model.dart';

abstract interface class CartRemoteDataSource {
  Future<List<ProductModel>> getCart();
  Future<String> addCart(String productId);
  Future<String> deleteCart(String productId);
}

//----------------- Impelementation -------------------
@LazySingleton(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  // api consumer
  final ApiConsumer api;
  CartRemoteDataSourceImpl({required this.api});

  // get cart
  @override
  Future<List<ProductModel>> getCart() async {
    try {
      // api call
      final response = await api.get(Urls.getCart);
      log("TYPE: ${response.runtimeType}");
      log("KEYS: ${response.keys}");

      // modeling
      final List<ProductModel> products = CartModel.fromJson(response).products;

      log("products is : $products");
      return products;
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<String> addCart(String productId) async {
    try {
      // api call
      final response = await api.post(Urls.addCart, data: productId);

      return response['message'];
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<String> deleteCart(String productId) async {
    try {
      // api call
      final response = await api.delete(Urls.deleteCart, data: productId);

      return response['message'];
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
