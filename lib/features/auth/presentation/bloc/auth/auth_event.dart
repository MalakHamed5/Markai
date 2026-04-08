part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _Started;
  const factory AuthEvent.login() = _Login;
  const factory AuthEvent.register() = _Register;

  const factory AuthEvent.skipLogin() = _SkipLogin;
}
