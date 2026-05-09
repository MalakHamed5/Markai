import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommerse/features/cart/data/repository/cart_repo.dart';
import 'package:ecommerse/features/home/data/model/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'cart_state.dart';
part 'cart_event.dart';
part 'cart_bloc.freezed.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository repo;

  CartBloc({required this.repo}) : super(const CartState()) {
    on<CartEvent>((event, emit) async {
      await event.maybeWhen(
        getCart: () async {
          emit(state.copyWith(isLoading: true));

          final result = await repo.getCart();
          log('in cart bloc $result');

          return result.fold(
            (failure) => emit(
                state.copyWith(error: failure.toString(), isLoading: false)),
            (products) =>
                emit(state.copyWith(cartProducts: products, isLoading: false)),
          );
        },
        toggle: (product) async {
          emit(state.copyWith(isLoading: true));

          final isInCart = state.cartProducts.any((e) => e.id == product.id);
          final oldCart = List<ProductModel>.from(state.cartProducts);

          if (isInCart) {
            final update =
                state.cartProducts.where((e) => e.id != product.id).toList();
            // ui update
            emit(state.copyWith(cartProducts: update, isLoading: false));

            // backend update
            final result = await repo.deleteCart(product.id.toString());
            log("in delete cart$result");
            result.fold(
              (failure) => emit(state.copyWith(
                  error: failure.toString(),
                  isLoading: false,
                  cartProducts: oldCart)),
              (_) {},
            );
          } else {
            final update = List<ProductModel>.from(oldCart)..add(product);

            // ui update
            emit(state.copyWith(cartProducts: update, isLoading: false));

            // backend update
            final result = await repo.addCart(product.id.toString());
            log("in add cart$result");
            result.fold(
                (f) => emit(state.copyWith(
                    error: f.toString(),
                    isLoading: false,
                    cartProducts: oldCart)),
                (_) {});
          }
        },
        orElse: () {},
      );
    });
  }
}
