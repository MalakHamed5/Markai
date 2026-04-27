part of 'favorite_bloc.dart';

@freezed
abstract class FavoriteState with _$FavoriteState {
  const factory FavoriteState({
    @Default(<ProductModel>[]) List<ProductModel> favProducts,
    @Default(false) bool loading,
    String? error,
  }) = _FavoriteState;
}
//   const factory FavoriteState.initial() = _Initial;
//   const factory FavoriteState.loading() = _Loading;
//   const factory FavoriteState.toggleSuccess({
//     String? message,
//   }) = _ToggleSuccess;
//   const factory FavoriteState.getFavsSuccess({
//     required List<ProductModel> favProducts,
//   }) = _GetFavsSuccess;
//   const factory FavoriteState.failure({required String error}) = _Failure;
// }
