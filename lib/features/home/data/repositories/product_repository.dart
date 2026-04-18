import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerse/core/error/failure.dart';
import 'package:ecommerse/features/home/data/data_source/product_data_source.dart';
import 'package:ecommerse/features/home/data/model/product_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/excetpions.dart';

abstract class ProdcutRepository {
  Future<Either<Failure, List<ProductModel>>> getProducts();
  Future<Either<Failure, ProductModel>> getProductById(int id);
}

//--------------------------- Implementation ---------------------------

@LazySingleton(as: ProdcutRepository)
class ProductRepositoryImpl implements ProdcutRepository {
  final ProductDataSource dataSource;

  ProductRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      log('get Products (reposatory)');
      return right(await dataSource.getProducts());
    } on ServerException catch (e) {
      log('${e.toString()} in home repo');
      return left(e.failure);
    } catch (e) {
      log('${e.toString()} in home repo');
      return left(UnKnownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProductById(int id) async {
    try {
      log('get single Producte (reposatory)');
      return right(await dataSource.getProductById(id));
    } on ServerException catch (e) {
      log('${e.toString()} in product repo');
      return left(e.failure);
    } catch (e) {
      log('${e.toString()} in product repo');
      return left(UnKnownFailure(e.toString()));
    }
  }
}
