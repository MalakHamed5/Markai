part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  // auth states
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.success({String? message}) = _Success;
  const factory AuthState.failure({required String error}) = _Failure;
  // guest state
  const factory AuthState.guest() = _Guest;
}
