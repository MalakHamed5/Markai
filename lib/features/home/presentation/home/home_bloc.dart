import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommerse/features/home/data/model/product_model.dart';
import 'package:ecommerse/features/home/data/repositories/home_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Cubit<HomeState> {
  final HomeRepo repo;

  HomeBloc({required this.repo}) : super(const HomeState.initial()) {
    getProducts();
  }

  Future getProducts() async {
    emit(const HomeState.loading());
    final result = await repo.getProducts();

    result.fold(
      (error) {
        emit(HomeState.failure(error.message));
        log('${error.message} in home bloc');
      },
      (products) => emit(HomeState.success(products)),
    );
  }
}
