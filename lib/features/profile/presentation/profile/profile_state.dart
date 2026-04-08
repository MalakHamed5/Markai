part of 'profile_bloc.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.success({String? message,required UserModel? user}) = _Success;
  const factory ProfileState.failure({required String error}) = _Failure;

  const factory ProfileState.updateUI() = _UpdateUI;
  const factory ProfileState.seccessUI() = _SeccessUI;

  const factory ProfileState.guest() = _Guest;
}