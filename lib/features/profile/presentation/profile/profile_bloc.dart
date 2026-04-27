import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommerse/features/profile/data/models/profile_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/repositories/profile_repo.dart';

part 'profile_state.dart';
part 'profile_event.dart';
part 'profile_bloc.freezed.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepo profileRepo;
  ProfileBloc({required this.profileRepo})
      : super(const ProfileState.initial()) {
    on<ProfileEvent>((event, emit) async {
      await event.maybeWhen(
        saveChanges: () {},
        pickImage: () {},
        changePhone: () {},
        changePassword: () {},
        getUserData: () async {
          emit(const ProfileState.loading());
          final result = await profileRepo.getProfileData();
          result.fold(
            (failure) {
              emit(ProfileState.failure(error: failure.toString()));
              log("error is ${failure.toString()}");
            },
            (user) {
              emit(ProfileState.success(user: user));

              log("user data is $user");
            },
          );
        },
        orElse: () {},
      );
    });
  }
}
