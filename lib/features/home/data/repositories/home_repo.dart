import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerse/core/error/error_model.dart';
import 'package:ecommerse/features/home/data/data_source/home_remot_data_source.dart';
import 'package:ecommerse/features/home/data/model/product_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/excetpions.dart';

abstract class HomeRepo {
  Future<Either<ErrorModel, List<ProductModel>>> getProducts();
}

//--------------------------- Implementation ---------------------------

@LazySingleton(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource dataSource;

  HomeRepoImpl({required this.dataSource});

  @override
  Future<Either<ErrorModel, List<ProductModel>>> getProducts() async {
    try {
      return right(await dataSource.getProducts());
    } on ServerException catch (e) {
      log('${e.toString()} in home repo');
      return left(ErrorModel(message: e.toString()));
    } catch (e) {
      log('${e.toString()} in home repo');
      return left(ErrorModel(message: e.toString()));
    }
  }
}
