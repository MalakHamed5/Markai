import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommerse/features/home/data/repositories/product_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/product_model.dart';

part 'product_details_state.dart';
part 'product_details_bloc.freezed.dart';


@injectable
class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProdcutRepository repo;
  ProductDetailsCubit({required this.repo})
      : super(const ProductDetailsState.initial());

  Future<void> getSinglprodcut(int id) async {
    emit(const ProductDetailsState.loading());
    final result = await repo.getProductById(id);

    result.fold(
      (error) {
        emit(ProductDetailsState.failure(error.message));
        log('${error.message} in home bloc');
      },
      (product) => emit(ProductDetailsState.success(product)),
    );
  }
}
