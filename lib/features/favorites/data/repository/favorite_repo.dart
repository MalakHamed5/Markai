import 'package:ecommerse/features/favorites/data/datasource/favorite_data_source.dart';
import 'package:ecommerse/features/home/data/model/product_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, String>> addFavorite(String productId);
  Future<Either<Failure, String>> deleteFavorite(String productId);
  Future<Either<Failure, List<ProductModel>>> getFavorites();
}

@LazySingleton(as: FavoriteRepo)
class FavoriteRepoImpl implements FavoriteRepo {
  final FavoriteDataSource favoriteDataSource;

  FavoriteRepoImpl({required this.favoriteDataSource});
  @override
  Future<Either<Failure, String>> addFavorite(String productId) async {
    try {
      final result = await favoriteDataSource.addFavorite(productId);
      return right(result.toString());
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteFavorite(String productId) async {
    try {
      final result = await favoriteDataSource.deleteFavorite(productId);
      return right(result.toString());
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getFavorites() async {
    try {
      final result = await favoriteDataSource.getFavorites();
      return right(result);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
