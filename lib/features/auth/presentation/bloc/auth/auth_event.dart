part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _Started;
  const factory AuthEvent.login({
    required String email,
    required String password,
  }) = _Login;
  const factory AuthEvent.register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) = _Register;
  const factory AuthEvent.logout() = _Logout;

  const factory AuthEvent.resendOtp() = _ResendOtp;
  const factory AuthEvent.verifyOtp() = _VerifyOtp;

  const factory AuthEvent.forgetPassword() = _ForgetPassword;
  const factory AuthEvent.resetPassword() = _ResetPassword;
}
