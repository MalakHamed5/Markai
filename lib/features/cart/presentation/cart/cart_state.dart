part of 'cart_bloc.dart';

@freezed
abstract class CartState with _$CartState {
  const factory CartState({
    @Default(<ProductModel>[]) List<ProductModel> cartProducts,
    @Default(false) bool isLoading,
    String? error,
  }) = _CartState;
}