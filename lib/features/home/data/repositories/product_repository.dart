import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerse/core/error/failure.dart';
import 'package:ecommerse/features/home/data/data_source/product_data_source.dart';
import 'package:ecommerse/features/home/data/model/product_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/excetpions.dart';
import '../model/catagory_model.dart';

abstract class ProdcutRepository {
  Future<Either<Failure, List<ProductModel>>> getProducts();
  Future<Either<Failure, ProductModel>> getProductById(int id);
  Future<Either<Failure, List<CatagoryModel>>> getCatagory();
}

//--------------------------- Implementation ---------------------------

@LazySingleton(as: ProdcutRepository)
class ProductRepositoryImpl implements ProdcutRepository {
  final ProductDataSource productDataSource;

  ProductRepositoryImpl({required this.productDataSource});

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      log('get Products (reposatory)');
      return right(await productDataSource.getProducts());
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
      return right(await productDataSource.getProductById(id));
    } on ServerException catch (e) {
      log('${e.toString()} in product repo');
      return left(e.failure);
    } catch (e) {
      log('${e.toString()} in product repo');
      return left(UnKnownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CatagoryModel>>> getCatagory() async {
    try {
      log('get catagories (reposatory)');
      return right(await productDataSource.getCatagory());
    } on ServerException catch (e) {
      log('${e.toString()} in catagory repo');
      return left(e.failure);
    } catch (e) {
      log('${e.toString()} in catagory repo');
      return left(UnKnownFailure(e.toString()));
    }
  }
}
