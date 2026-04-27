part of 'favorite_bloc.dart';

@freezed
abstract class FavoriteEvent with _$FavoriteEvent {
  const factory FavoriteEvent.getFavorites() = _GetFavorites;
  const factory FavoriteEvent.toggleFavorite({
    required ProductModel product,
  }) = _ToggleFavorite;
}
