part of 'cart_bloc.dart';

@freezed
sealed class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.success(List<ProductModel> cartProducts) = _Success;
  const factory CartState.error(String error) = _Error;
  const factory CartState.loading() = _Loading;
}