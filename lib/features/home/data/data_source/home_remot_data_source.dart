import 'dart:developer';

import 'package:ecommerse/core/api/api_consumer.dart';
import 'package:ecommerse/core/api/urls.dart';
import 'package:ecommerse/core/error/error_model.dart';
import 'package:ecommerse/core/error/excetpions.dart';
import 'package:ecommerse/features/home/data/model/product_model.dart';
import 'package:injectable/injectable.dart';


abstract class HomeRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiConsumer api;

  HomeRemoteDataSourceImpl({required this.api});

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await api
          .get(Urls.getProducts, queryParameters: {"skip": 0, "limit": 10});

      final data = response[ApiKeys.list] as List<dynamic>;

      return data.map((e) => ProductModel.fromJson(e)).toList();
    } on ServerException catch (e) {
      log('${e.toString()} in home remote data source');
      throw ErrorModel(message: e.toString());
    } catch (e) {
      log('${e.toString()} in home remote data source');
      throw ErrorModel(message: e.toString());
    }
  }
}
