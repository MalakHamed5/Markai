import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommerse/features/home/data/repositories/product_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/product_model.dart';

part 'product_state.dart';
part 'product_bloc.freezed.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  final ProdcutRepository repo;

  ProductCubit({required this.repo}) : super(const ProductState.initial()) {
    getProducts();
  }

  Future<void> getProducts() async {
    emit(const ProductState.loading());
    final result = await repo.getProducts();

    result.fold(
      (error) {
        emit(ProductState.failure(error.message));
        log('${error.message} in home bloc');
      },
      (products) => emit(ProductState.success(products)),
    );
  }
}
