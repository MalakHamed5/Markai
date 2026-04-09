import 'package:ecommerse/core/constants/assets.dart';
import 'package:ecommerse/core/helper/tools.dart';
import 'package:ecommerse/core/routes/routes_name.dart';
import 'package:ecommerse/core/shared/bottons/primary_button.dart';
import 'package:ecommerse/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:ecommerse/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helper/functions.dart';
import '../../../../core/helper/validation.dart';

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
            success: (message) {
              // showNotifyMsg(text: message!, context: context);
              context.go(RoutesName.root);
            },
            failure: (error) {
              showNotifyMsg(text: error, context: context, bgColor: theme.error);
            },
            guest: () {
              context.go(RoutesName.root);
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
                      const _SkipButton(),
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
                          const _RememberMeButton(),
                          hSpace(8),
                          Text(
                            tr.remeberMe,
                            style: TextStyle(
                              fontSize: 14,
                              color: theme.onSurface,
                            ),
                          ),
                          const Spacer(),
                          const _ForgotButton(),
                        ],
                      ),
                      vSpace(20),

                      //! Login Button
                      PrimaryButton(
                        child: state.maybeWhen(
                          loading: () => CircularProgressIndicator(
                            color: theme.onPrimary,
                          ),
                          orElse: () => Text(
                            tr.login,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: theme.onPrimary,
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
                          color: theme.onSurface,
                          fontSize: 12,
                        ),
                      ),
                      vSpace(18),

                      /// Social Buttons
                      const _SocialButtonsRow(),
                      vSpace(25),

                      /// Register Text
                      const _RegisterText(),
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

class _RegisterText extends StatelessWidget {
  const _RegisterText();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          tr.areYouNewInMarketi,
          style: TextStyle(
            color: theme.onSurface,
            fontSize: 12,
          ),
        ),
        const Text('? '),
        TextButton(
          onPressed: () {
            context.go(RoutesName.signup);
          },
          child: Text(
            tr.register,
            style: TextStyle(color: theme.primary),
          ),
        ),
      ],
    );
  }
}

class _SocialButtonsRow extends StatelessWidget {
  const _SocialButtonsRow();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialButton(text: "G"),
        SizedBox(width: 10),
        SocialButton(text: ""),
        SizedBox(width: 10),
        SocialButton(text: "f"),
      ],
    );
  }
}

class _ForgotButton extends StatelessWidget {
  const _ForgotButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        tr.forgotPassword,
        style: TextStyle(
          color: theme.primary,
          fontSize: 14,
        ),
      ),
    );
  }
}

class _RememberMeButton extends StatelessWidget {
  const _RememberMeButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 20,
      child: Checkbox(
        value: true,
        activeColor: theme.primary,
        onChanged: (_) {},
      ),
    );
  }
}

class _SkipButton extends StatelessWidget {
  const _SkipButton();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: theme.primary.withValues(alpha: 0.4),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 12,
          ),
        ),
        onPressed: () {
          context.read<AuthBloc>().add(const AuthEvent.skipLogin());
          context.go(RoutesName.root);
        },
        child: Text(
          tr.skip,
          style: TextStyle(
            color: theme.primary,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(color: theme.outline),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: theme.onSurface,
          ),
        ),
      ),
    );
  }
}
