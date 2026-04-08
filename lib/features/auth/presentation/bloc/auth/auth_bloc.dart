import 'package:bloc/bloc.dart';
import 'package:ecommerse/core/helper/tools.dart';
import 'package:ecommerse/core/routes/routes_name.dart';
import 'package:ecommerse/features/auth/data/repositories/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

part 'auth_state.dart';
part 'auth_event.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // controllers & keys
  final TextEditingController username = TextEditingController();
  final TextEditingController emailOrPhone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  final AuthRepo repo;

  AuthBloc({required this.repo}) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.maybeWhen(
        started: () {},
        login: () async {
          if (!loginFormKey.currentState!.validate()) {
            return;
          }
          emit(const AuthState.loading());
          final result = await repo.login(
            email: emailOrPhone.text,
            password: password.text,
          );
          result.fold(
            (failure) => emit(AuthState.failure(error: failure.message)),
            (user) {
              emailOrPhone.clear();
              password.clear();
              ctx.go(RoutesName.root);
              emit(const AuthState.success(message: "Login Success"));
            },
          );
        },
        register: () async {
          // validate form
          if (!signupFormKey.currentState!.validate()) {
            return;
          }
          emit(const AuthState.loading());
          final result = await repo.register(
            name: username.text,
            email: emailOrPhone.text,
            password: password.text,
            phone: emailOrPhone.text,
            confirmPassword: confirmPassword.text,
          );
          result.fold(
            (failure) => emit(AuthState.failure(error: failure.message)),
            (user) {
              username.clear();
              emailOrPhone.clear();
              password.clear();
              confirmPassword.clear();
              ctx.go(RoutesName.root);
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

/**
 * 
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
 */
