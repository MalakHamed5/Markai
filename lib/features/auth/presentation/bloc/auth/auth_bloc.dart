import 'package:bloc/bloc.dart';
import 'package:ecommerse/features/auth/data/repositories/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';
part 'auth_event.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // controllers & forms

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  final AuthRepo repo;

  AuthBloc({ required this.repo})
      : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.maybeWhen(
        started: () {},
        
        login: (email, password) async {
          emit(const AuthState.loading());
          final result = await repo.login(email, password);
          result.fold(
            (failure) => emit(AuthState.failure(error: failure.message)),
            (user) => emit(const AuthState.success(message: "Login Success")),
          );
        },
       
        register: (name, email, password, phone, confirmPassword) async {
          emit(const AuthState.loading());
          final result = await repo.register(
              name, email, password, phone, confirmPassword);
          result.fold(
            (failure) => emit(AuthState.failure(error: failure.message)),
            (user) =>
                emit(const AuthState.success(message: "Register Success")),
          );
        },
    
        orElse: () {},
      );
    });
  }
}
