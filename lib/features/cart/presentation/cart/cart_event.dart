part of 'cart_bloc.dart';

@freezed
sealed class CartEvent with _$CartEvent {
  const factory CartEvent.getCart() = _GetCart;
  const factory CartEvent.addCart(String produictId) = _AddCart;
  const factory CartEvent.deleteCart(String produictId) = _DeleteCart;
}