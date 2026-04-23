import 'package:bloc/bloc.dart';
import 'package:ecommerse/features/home/data/model/catagory_model.dart';
import 'package:ecommerse/features/home/data/repositories/product_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failure.dart' show Failure;

part 'catagory_state.dart';
part 'catagory_bloc.freezed.dart';

@injectable
class CatagoryBloc extends Cubit<CatagoryState> {
  final ProdcutRepository prodcutRepository;
  CatagoryBloc({required this.prodcutRepository})
      : super(const CatagoryState.initial()) {
    getCatagories();
  }

  Future<void> getCatagories() async {
    emit(const CatagoryState.loading());

    final result = await prodcutRepository.getCatagory();
    result.fold(
      (failure) => emit(CatagoryState.failure(failure)),
      (catagories) => emit(CatagoryState.success(catagories)),
    );
  }
}
