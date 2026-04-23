import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/brand_model.dart';
import '../../../data/repositories/product_repository.dart';

part 'brand_state.dart';
part 'brand_bloc.freezed.dart';

@injectable
class BrandBloc extends Cubit<BrandState> {
  final ProdcutRepository productRepository;
  BrandBloc({required this.productRepository})
      : super(const BrandState.initial()) {
    getBrands();
  }

  Future<void> getBrands() async {
    emit(const BrandState.loading());

    final result = await productRepository.getBrands();
    result.fold(
      (failure) => emit(BrandState.failure(failure.message)),
      (brands) => emit(BrandState.success(brands)),
    );
  }
}
