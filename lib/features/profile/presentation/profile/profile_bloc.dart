import 'package:bloc/bloc.dart';
import 'package:ecommerse/core/cache/cache_helper.dart';
import 'package:ecommerse/core/services/service_locator.dart';
import 'package:ecommerse/features/auth/data/models/user_model.dart';
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
          if (await sl<CacheHelper>().getData(key: 'is_guest') == true) {
            emit(const ProfileState.guest());
            return;
          }
          emit(const ProfileState.loading());
          final result = await profileRepo.getProfileData();
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
