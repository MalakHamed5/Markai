import 'package:ecommerse/core/constants/assets.dart';
import 'package:ecommerse/core/helper/tools.dart';
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

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController confirmPasswordCtrl = TextEditingController();
  final GlobalKey<FormState> _signupFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    bloc = context.read<AuthBloc>();
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    passwordCtrl.dispose();
    confirmPasswordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // variables need build method
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (message) {
            showNotifyMsg(text: message ?? '', context: context);
            context.goNamed('home');
          },
          failure: (error) {
            showNotifyMsg(
              text: error,
              context: context,
              bgColor: context.theme.error,
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Form(
          key: _signupFormKey,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: context.theme.surface,
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
                              color:
                                  context.theme.primary.withValues(alpha: 0.4),
                            ),
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 12,
                            ),
                          ),
                          onPressed: () {
                            context.goNamed('home');
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: context.theme.onSurface,
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
                        controller: nameCtrl,
                        validator: Validation.validateUsername,
                        onChanged: (_) {
                          _signupFormKey.currentState?.validate();
                        },
                      ),

                      // phone number
                      CustomTextField(
                        title: tr.urPhone,
                        hint: "01010039770",
                        icon: Icons.phone_android,
                        controller: phoneCtrl,
                        validator: Validation.validatePhone,
                        onChanged: (_) {
                          _signupFormKey.currentState?.validate();
                        },
                      ),

                      // Email Field
                      CustomTextField(
                        title: tr.email,
                        hint: "You@gmail.com",
                        icon: Icons.email_outlined,
                        controller: emailCtrl,
                        validator: Validation.validateEmail,
                        onChanged: (_) {
                          _signupFormKey.currentState?.validate();
                        },
                      ),

                      // Password Field
                      CustomTextField(
                        title: tr.password,
                        hint: "********",
                        icon: Icons.lock_outline,
                        isPassword: true,
                        controller: passwordCtrl,
                        validator: Validation.validatePassword,
                        onChanged: (_) {
                          _signupFormKey.currentState?.validate();
                        },
                      ),

                      // confirm password
                      CustomTextField(
                        title: tr.confirmPassword,
                        hint: "********",
                        icon: Icons.lock_outline,
                        isPassword: true,
                        controller: confirmPasswordCtrl,
                        validator: (value) {
                          return Validation.validateConfirmPassword(
                              value, passwordCtrl.text);
                        },
                        onChanged: (_) {
                          _signupFormKey.currentState?.validate();
                        },
                      ),

                      vSpace(10),

                      /// SignUp Button
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: context.theme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            elevation: 0,
                          ),
                          onPressed: () {
                            if (!_signupFormKey.currentState!.validate()) {
                              return;
                            }
                            context.read<AuthBloc>().add(AuthEvent.register(
                                  name: nameCtrl.text,
                                  email: emailCtrl.text,
                                  phone: phoneCtrl.text,
                                  password: passwordCtrl.text,
                                  confirmPassword: confirmPasswordCtrl.text,
                                ));
                          },
                          child: state.maybeWhen(
                            loading: () => CircularProgressIndicator(
                              color: context.theme.onPrimary,
                            ),
                            orElse: () => Text(
                              tr.signup,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: context.theme.onPrimary,
                              ),
                            ),
                          ),
                        ),
                      ),

                      vSpace(25),

                      Text(
                        tr.orContinueWith,
                        style: TextStyle(
                            color: context.theme.onSurface, fontSize: 12),
                      ),

                      const SizedBox(height: 18),

                      /// Social Buttons
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialButton(text: "G"),
                          SizedBox(width: 10),
                          SocialButton(text: ""),
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
                            style: TextStyle(
                              color: context.theme.onSurface,
                              fontSize: 12,
                            ),
                          ),
                          const Text('? '),
                          TextButton(
                            onPressed: () {
                              context.goNamed('login');
                            },
                            child: Text(tr.signIn,
                                style: TextStyle(color: context.theme.primary)),
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
        border: Border.all(color: context.theme.outline),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: context.theme.onSurface,
          ),
        ),
      ),
    );
  }
}
