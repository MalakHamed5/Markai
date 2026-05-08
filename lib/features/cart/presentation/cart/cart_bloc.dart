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

  CartBloc({required this.repo}) : super(const CartState.initial()) {
    on<CartEvent>((event, emit) async {
      await event.maybeWhen(
        getCart: () async {
          emit(const CartState.loading());

          final result = await repo.getCart();
          log('in cart bloc $result');

          return result.fold(
            (failure) => emit(CartState.error(failure.toString())),
            (products) => emit(CartState.success(products)),
          );
        },
        addCart: (value) {},
        deleteCart: (value) {},
        orElse: () {},
      );
    });
  }
}
