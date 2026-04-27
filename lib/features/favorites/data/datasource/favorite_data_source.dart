import 'package:ecommerse/core/api/api_consumer.dart';
import 'package:ecommerse/core/api/urls.dart';
import 'package:ecommerse/core/error/failure.dart';
import 'package:ecommerse/features/home/data/model/product_model.dart';
import 'package:injectable/injectable.dart';

abstract interface class FavoriteDataSource {
  Future<String> addFavorite(String productId);
  Future<String> deleteFavorite(String productId);
  Future<List<ProductModel>> getFavorites();
}

//--------------------- Implementation ----------------------------------
@LazySingleton(as: FavoriteDataSource)
class FavoriteDataSourceImpl implements FavoriteDataSource {
  final ApiConsumer apiConsumer;

  FavoriteDataSourceImpl({required this.apiConsumer});

  @override
  Future<String> addFavorite(String productId) async {
    try {
      final result = await apiConsumer
          .post(Urls.addToFav, data: {ApiKeys.productId: productId});
      return result[ApiKeys.message];
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<String> deleteFavorite(String productId) async {
    try {
      final result = await apiConsumer
          .delete(Urls.removeFav, data: {ApiKeys.productId: productId});

      return result[ApiKeys.message];
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<List<ProductModel>> getFavorites() async {
    try {
      final response = await apiConsumer
          .get(Urls.getFav); //* it returns  a list of map not an object

      final data = response[ApiKeys.list] as List;

      return data.map((e) {
        return ProductModel.fromJson(e);
      }).toList();
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
