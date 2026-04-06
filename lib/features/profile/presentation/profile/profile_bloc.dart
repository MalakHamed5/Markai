import 'package:bloc/bloc.dart';
import 'package:ecommerse/features/auth/data/models/user_model.dart';
import 'package:ecommerse/features/auth/data/repositories/auth_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.dart';
part 'profile_event.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthRepoImpl authRepoImpl;
  ProfileBloc({required this.authRepoImpl})
      : super(const ProfileState.initial()) {
    on<ProfileEvent>((event, emit) async {
      await event.maybeWhen(
        saveChanges: () {},
        pickImage: () {},
        changePhone: () {},
        changePassword: () {},

        getUserData: () async {
          emit(const ProfileState.loading());

          final result = await authRepoImpl.getProfileData();
          
          result.fold(
            (failure) => emit(ProfileState.failure(error: failure.message)),
            (user) => emit(ProfileState.success(user: user)),
          );
        },

        orElse: () {},
      );
    });
  }
}
