part of 'profile_bloc.dart';

@freezed
abstract class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.saveChanges() = _SaveChanges;
  const factory ProfileEvent.getUserData() = _GetUserData;

  const factory ProfileEvent.pickImage() = _PickImage;
  const factory ProfileEvent.changePhone() = _ChangePhone;
  const factory ProfileEvent.changePassword() = _ChangePassword;
}