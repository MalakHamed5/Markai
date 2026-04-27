
import 'package:bloc/bloc.dart';
import 'package:ecommerse/features/home/data/model/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/repository/favorite_repo.dart';

part 'favorite_state.dart';
part 'favorite_event.dart';
part 'favorite_bloc.freezed.dart';

@injectable
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteRepo repo;
  FavoriteBloc({required this.repo}) : super(FavoriteState()) {
    on<FavoriteEvent>(
      (event, emit) async {
        await event.maybeWhen(
          getFavorites: () async {
            emit(state.copyWith(loading: true));
            final result = await repo.getFavorites();
            result.fold(
              (failure) => emit(
                  state.copyWith(loading: false, error: failure.toString())),
              (list) => emit(state.copyWith(loading: false, favProducts: list)),
            );
          },
      
          toggleFavorite: (product) async {
           

            // is favorite state
            final isFav = state.favProducts.any((e) => e.id == product.id);

            final oldList = List<ProductModel>.from(state
                .favProducts); // copy list => list.from *same refrance and pointer

            if (isFav) {
              final update =
                  state.favProducts.where((p) => p.id != product.id).toList();

              // 1 ui
              emit(state.copyWith(favProducts: update));

              // 2 backend
              final result = await repo.deleteFavorite(product.id.toString());

              result.fold(
                  (f) => emit(state.copyWith(
                      favProducts: oldList, error: f.toString())),
                  (_) {});
            } else {
              // not favorite product
              // i will add it
              final updated = List<ProductModel>.from(oldList)..add(product);

              // emit
              emit(state.copyWith(favProducts: updated));

              final result = await repo.addFavorite(product.id.toString());

              result.fold(
                  (f) => emit(state.copyWith(
                      favProducts: oldList, error: f.toString())),
                  (_) {});
            }
          },
        
          orElse: () {},
          
        );
      },
    );
  }
}
