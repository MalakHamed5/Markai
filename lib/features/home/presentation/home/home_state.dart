part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.success(List<ProductModel> products) = _Success;
  const factory HomeState.failure(String error) = _Failure;
}