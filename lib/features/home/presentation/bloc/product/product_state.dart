part of 'product_bloc.dart';

@freezed
abstract class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;
  const factory ProductState.loading() = _Loading;
  const factory ProductState.failure(String error) = _Failure;
  const factory ProductState.success(List<ProductModel> products) = _Success;
}
