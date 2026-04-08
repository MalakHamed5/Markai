import 'package:ecommerse/core/constants/assets.dart';
import 'package:ecommerse/core/helper/tools.dart';
import 'package:ecommerse/core/routes/routes_name.dart';
import 'package:ecommerse/core/theme/app_colors.dart';
import 'package:ecommerse/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helper/functions.dart';
import '../../../../core/helper/validation.dart';
import '../widgets/custom_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final AuthBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<AuthBloc>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc.emailOrPhone.clear();
      bloc.password.clear();
      bloc.confirmPassword.clear();
      bloc.username.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    // variables need build method
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
            success: (message) {
              showNotifyMsg(text: message!, context: context);
            },
            orElse: () {});
      },
      builder: (context, state) {
        return Form(
          key: bloc.signupFormKey,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                physics: isKeyboardOpen
                    ? const BouncingScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      vSpace(10),

                      /// Skip Button
                      Align(
                        alignment: Alignment.topLeft,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: AppColors.primary.withValues(alpha: 0.4),
                            ),
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 12,
                            ),
                          ),
                          onPressed: () {
                            context.go(RoutesName.root);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: AppColors.black,
                          ),
                        ),
                      ),

                      /// Logo
                      Image.asset(Assets.imagesMarketi),
                      vSpace(8),
                      // name
                      CustomTextField(
                        title: tr.urName,
                        hint: tr.fullName,
                        icon: Icons.person_outline,
                        controller: bloc.username,
                        validator: Validation.validateUsername,
                        onChanged: (_) {
                          bloc.signupFormKey.currentState?.validate();
                        },
                      ),

                      // phone number
                      CustomTextField(
                        title: tr.urPhone,
                        hint: "01010039770",
                        icon: Icons.phone_android,
                        controller: bloc.emailOrPhone,
                        validator: Validation.validatePhone,
                        onChanged: (_) {
                          bloc.signupFormKey.currentState?.validate();
                        },
                      ),

                      // Email Field
                      CustomTextField(
                        title: tr.email,
                        hint: "You@gmail.com",
                        icon: Icons.email_outlined,
                        controller: bloc.emailOrPhone,
                        validator: Validation.validateEmail,
                        onChanged: (_) {
                          bloc.signupFormKey.currentState?.validate();
                        },
                      ),

                      // Password Field
                      CustomTextField(
                        title: tr.password,
                        hint: "********",
                        icon: Icons.lock_outline,
                        isPassword: true,
                        controller: bloc.password,
                        validator: Validation.validatePassword,
                        onChanged: (_) {
                          bloc.signupFormKey.currentState?.validate();
                        },
                      ),

                      // confirm password
                      CustomTextField(
                        title: tr.confirmPassword,
                        hint: "********",
                        icon: Icons.lock_outline,
                        isPassword: true,
                        controller: bloc.confirmPassword,
                        validator: (value) {
                          return Validation.validateConfirmPassword(
                              value, bloc.password.text);
                        },
                        onChanged: (_) {
                          bloc.signupFormKey.currentState?.validate();
                        },
                      ),

                      vSpace(10),

                      /// SignUp Button
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            elevation: 0,
                          ),
                          onPressed: () {
                            context
                                .read<AuthBloc>()
                                .add(const AuthEvent.register());
                          },
                          child: Text(
                            tr.signup,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ),

                      vSpace(25),

                      Text(
                        tr.orContinueWith,
                        style: const TextStyle(
                            color: AppColors.textPrimary, fontSize: 12),
                      ),

                      const SizedBox(height: 18),

                      /// Social Buttons
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialButton(text: "G"),
                          SizedBox(width: 10),
                          SocialButton(text: ""),
                          SizedBox(width: 10),
                          SocialButton(text: "f"),
                        ],
                      ),

                      vSpace(25),

                      /// Register Text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            tr.haveAnAccount,
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 12,
                            ),
                          ),
                          const Text('? '),
                          TextButton(
                            onPressed: () {
                              context.go(RoutesName.login);
                            },
                            child: Text(tr.signIn,
                                style:
                                    const TextStyle(color: AppColors.primary)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
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
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
