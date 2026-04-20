part of 'catagory_bloc.dart';

@freezed
class CatagoryState with _$CatagoryState {
  const factory CatagoryState.initial() = _Initial;
  const factory CatagoryState.loading() = _Loading;
  const factory CatagoryState.success(List<CatagoryModel> catagories) =
      _Success;
  const factory CatagoryState.failure(Failure failure) = _Failure;
}
