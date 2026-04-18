part of 'product_details_bloc.dart';

@freezed
abstract class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState.initial() = _Initial;
  const factory ProductDetailsState.loading() = _Loading;
  const factory ProductDetailsState.success(ProductModel product) = _Success;
  const factory ProductDetailsState.failure(String error) = _Failure;
}