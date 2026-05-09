import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerse/features/home/data/model/product_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../datasource/cart_remote_data_source.dart';

abstract interface class CartRepository {
  Future<Either<Failure, List<ProductModel>>> getCart();
  Future<Either<Failure, String>> addCart(String produictId);
  Future<Either<Failure, String>> deleteCart(String produictId);
}

//----------------------- Implementation -------------------------------

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource cartRemoteDataSource;
  CartRepositoryImpl({required this.cartRemoteDataSource});

  @override
  Future<Either<Failure, List<ProductModel>>> getCart() async {
    try {
      log('in cart repo get cart');
      return Right(await cartRemoteDataSource.getCart());
    } catch (e, s) {
      log("the stack trace is : ${s.toString()}");
      log('the error in get cart repo is : ${e.toString()}');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addCart(String produictId) async {
    try {
      return Right(await cartRemoteDataSource.addCart(produictId));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteCart(String product) async {
    try {
      return Right(await cartRemoteDataSource.deleteCart(product));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
