import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerse/core/api/api_consumer.dart';
import 'package:ecommerse/core/api/urls.dart';
import 'package:ecommerse/core/error/excetpions.dart';
import 'package:ecommerse/features/home/data/model/catagory_model.dart';
import 'package:ecommerse/features/home/data/model/product_model.dart';
import 'package:injectable/injectable.dart';

abstract class ProductDataSource {
  Future<List<ProductModel>> getProducts();
  Future<ProductModel> getProductById(int id);
  Future<List<CatagoryModel>> getCatagory();
}

@LazySingleton(as: ProductDataSource)
class ProductDataSourceImpl implements ProductDataSource {
  final ApiConsumer api;

  ProductDataSourceImpl({required this.api});

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await api
          .get(Urls.getProducts, queryParameters: {"skip": 0, "limit": 10});

      final data = response[ApiKeys.list] as List<dynamic>;
      log('get Products (remote data source)');
      return data.map((e) => ProductModel.fromJson(e)).toList();
    } on DioException catch (e) {
      handleDioException(e);
      rethrow;
    }
  }

  @override
  Future<ProductModel> getProductById(int id) async {
    try {
      final response = await api.get(
        Urls.getProductById(id),
      );
      log('get single Producte (remote data source)');
      return ProductModel.fromJson(response);
    } on DioException catch (e) {
      handleDioException(e);
      rethrow;
    }
  }

  @override
  Future<List<CatagoryModel>> getCatagory() async {
    try {
      final response = await api.get(Urls.getCategories);
      log("response is: ${response.toString()}");
      final data = response[ApiKeys.list] as List<dynamic>;
      log('get catagories (remote data source)');
      return data.map((e) => CatagoryModel.fromJson(e)).toList();
    } on DioException catch (e) {
      handleDioException(e);
      rethrow;
    }
  }
}
