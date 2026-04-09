import 'package:bloc/bloc.dart';
import 'package:ecommerse/core/helper/tools.dart';
import 'package:ecommerse/core/routes/routes_name.dart';
import 'package:ecommerse/features/auth/data/repositories/auth_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';
part 'auth_event.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // controllers & keys


  final AuthRepo repo;
  AuthBloc({required this.repo}) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.maybeWhen(
        started: () {},

        login: (email, password) async {
          emit(const AuthState.loading());
          final result = await repo.login(
            email: email,
            password: password,
          );
          result.fold(
            (failure) => emit(AuthState.failure(error: failure.message)),
            (user) {
              emit(const AuthState.success(message: "Login Success"));
            },
          );
        },
       
        register: (name, email, phone, password, confirmPassword) async {
          
          emit(const AuthState.loading());
          final result = await repo.register(
            name: name,
            email: email,
            password: password,
            phone: phone,
            confirmPassword: confirmPassword,
          );
          result.fold(
            (failure) => emit(AuthState.failure(error: failure.message)),
            (user) {
              emit(const AuthState.success(message: "Register Success"));
            },
          );
        },
        
        skipLogin: () async {
          emit(const AuthState.loading());
          final result = await repo.userGuest();

          result.fold(
            (failure) => emit(AuthState.failure(error: failure.message)),
            (user) {
              ctx.go(RoutesName.root);
              emit(const AuthState.guest());
            },
          );
        },
      
        orElse: () {},
      );
    });
  }
}
