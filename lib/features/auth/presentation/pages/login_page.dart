import 'package:ecommerse/core/constants/assets.dart';
import 'package:ecommerse/core/helper/tools.dart';
import 'package:ecommerse/core/shared/bottons/primary_button.dart';
import 'package:ecommerse/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:ecommerse/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helper/functions.dart';
import '../../../../core/helper/validation.dart';
import '../widgets/forget_button.dart';
import '../widgets/regiester_button.dart';
import '../widgets/remember_me_button.dart';
import '../widgets/skip_button.dart';
import '../widgets/social_buttons_row.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final AuthBloc bloc;

  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    bloc = context.read<AuthBloc>();
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // variables need build method
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            loading: () {
              return;
            },
            success: (message) {
              context.goNamed('home');
            },
            failure: (error) {
              showNotifyMsg(
                  text: error, context: context, bgColor: context.theme.error);
            },
            guest: () {
              context.goNamed('home');
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return Form(
            key: _loginFormKey,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: isKeyboardOpen
                    ? const BouncingScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      vSpace(10),

                      //! Skip Button
                      const SkipButton(),
                      vSpace(60),

                      /// Logo
                      Column(
                        children: [
                          Image.asset(Assets.imagesMarketi),
                          vSpace(8),
                        ],
                      ),

                      vSpace(70),
                      // Email Field
                      CustomTextField(
                        hint: tr.usernameOrEmail,
                        icon: Icons.email_outlined,
                        controller: emailCtrl,
                        validator: Validation.validateEmail,
                        onChanged: (value) {
                          _loginFormKey.currentState!.validate();
                        },
                      ),
                      vSpace(14),

                      // Password Field
                      CustomTextField(
                        hint: tr.password,
                        icon: Icons.lock_outline,
                        isPassword: true,
                        controller: passwordCtrl,
                        validator: Validation.validatePassword,
                        onChanged: (value) {
                          _loginFormKey.currentState!.validate();
                        },
                      ),

                      vSpace(10),

                      /// Remember & Forgot
                      Row(
                        children: [
                          const RememberMeButton(),
                          hSpace(8),
                          Text(
                            tr.remeberMe,
                            style: TextStyle(
                              fontSize: 14,
                              color: context.theme.onSurface,
                            ),
                          ),
                          const Spacer(),
                          const ForgotButton(),
                        ],
                      ),
                      vSpace(20),

                      //! Login Button
                      PrimaryButton(
                        child: state.maybeWhen(
                          loading: () => CircularProgressIndicator(
                            color: context.theme.onPrimary,
                          ),
                          orElse: () => Text(
                            tr.login,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: context.theme.onPrimary,
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (_loginFormKey.currentState!.validate()) {
                            bloc.add(AuthEvent.login(
                              email: emailCtrl.text,
                              password: passwordCtrl.text,
                            ));
                          }
                        },
                      ),

                      vSpace(25),
                      Text(
                        tr.orContinueWith,
                        style: TextStyle(
                          color: context.theme.onSurface,
                          fontSize: 12,
                        ),
                      ),
                      vSpace(18),

                      /// Social Buttons
                      const SocialButtonsRow(),
                      vSpace(25),

                      /// Register Text
                      const RegisterText(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
