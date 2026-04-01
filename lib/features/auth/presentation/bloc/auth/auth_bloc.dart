import 'package:bloc/bloc.dart';
import 'package:ecommerse/core/api/api_consumer.dart';
import 'package:ecommerse/core/api/urls.dart';
import 'package:ecommerse/core/cache/cache_helper.dart';
import 'package:ecommerse/core/error/excetpions.dart';
import 'package:ecommerse/core/services/secure_token_store.dart';
import 'package:ecommerse/core/services/service_locator.dart';
import 'package:ecommerse/features/auth/data/models/signin_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'auth_state.dart';
part 'auth_event.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // controllers & forms

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  final ApiConsumer api;

  SigninModel? userModel;

  AuthBloc({required this.api}) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      event.maybeWhen(
        started: () {},

        login: (email, password) async {
          try {
            // valication
            if (!loginFormKey.currentState!.validate()) {
              return;
            }
            // api call
            final response = await api.post(
              Urls.signIn,
              data: {ApiKeys.email: email, ApiKeys.password: password},
            );
            // Modeling response
            userModel = SigninModel.formJson(response); //data massage + token *
            final decodedToken = JwtDecoder.decode(userModel!.token);
            final id = decodedToken[ApiKeys.id];

            // save data
            await sl<SecureTokenStore>().save(userModel!.token);
            await sl<CacheHelper>().saveData(key: ApiKeys.id, value: id);

            emit(AuthState.success());
          } on ServerException catch (e) {
            emit(AuthState.failure(error: e.errorModel.message));
          }
        },

        register: (name, email, password, phone) {},
        logout: () {},
        resendOtp: () {},
        verifyOtp: () {},
        forgetPassword: () {},
        resetPassword: () {},
        orElse: () {},
      );
    });
  }
}
