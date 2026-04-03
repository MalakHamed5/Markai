import 'package:ecommerse/core/constants/assets.dart';
import 'package:ecommerse/core/helper/tools.dart';
import 'package:ecommerse/core/routes/routes_name.dart';
import 'package:ecommerse/core/shared/bottons/primary_button.dart';
import 'package:ecommerse/core/theme/app_colors.dart';
import 'package:ecommerse/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:ecommerse/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

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

    final bloc = context.read<AuthBloc>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            success: () {
              showNotifyMsg(text: "تم تسجيل الدخول بنجاح", context: context);
            },
            failure: (error) {
              showNotifyMsg(text: error, context: context, bgColor: Colors.red);
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return Form(
            // key: bloc.loginFormKey,
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
                      Align(
                        alignment: Alignment.topLeft,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: AppColors.primary.withValues(alpha: 0.4),
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
                            context.go(RoutesName.root);
                          },
                          child: Text(
                            tr.skip,
                            style: const TextStyle(
                              color: AppColors.primary,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      vSpace(60),

                      /// Logo
                      Column(
                        children: [
                          Image.asset(Assets.imagesMarketi),
                          vSpace(8),
                        ],
                      ),

                      vSpace(70),

                      /// Email Field
                      CustomTextField(
                        hint: tr.usernameOrEmail,
                        icon: Icons.email_outlined,
                        controller: emailCtrl,
                      ),

                      vSpace(14),

                      /// Password Field
                      CustomTextField(
                        hint: tr.password,
                        icon: Icons.lock_outline,
                        isPassword: true,
                        controller: passwordCtrl,
                      ),

                      vSpace(10),

                      /// Remember + Forgot
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: Checkbox(
                              value: true,
                              activeColor: AppColors.primary,
                              onChanged: (_) {},
                            ),
                          ),
                          hSpace(8),
                          Text(
                            tr.remeberMe,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              tr.forgotPassword,
                              style: const TextStyle(
                                color: AppColors.primary,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),

                      vSpace(20),

                      //! Login Button
                      PrimaryButton(
                        child: state.maybeWhen(
                          loading: () => const CircularProgressIndicator(
                            color: Colors.white,
                          ),
                          orElse: () => Text(
                            tr.login,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                        onPressed: () {
                          bloc.add(
                            AuthEvent.login(
                              email: emailCtrl.text,
                              password: passwordCtrl.text,
                            ),
                          );
                        },
                      ),

                      vSpace(25),

                      Text(
                        tr.orContinueWith,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 12,
                        ),
                      ),

                      vSpace(18),

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

                      const SizedBox(height: 25),

                      /// Register Text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            tr.areYouNewInMarketi,
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 12,
                            ),
                          ),
                          const Text('? '),
                          Text(
                            tr.register,
                            style: const TextStyle(color: AppColors.primary),
                          ),
                        ],
                      ),
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

void showNotifyMsg({
  Color bgColor = Colors.green,
  required String text,
  required BuildContext context,
}) {
  ScaffoldMessenger.of(context)
    ..clearSnackBars() // optional: remove any current one
    ..showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: bgColor,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(bottom: 30, left: 30, right: 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        duration: const Duration(seconds: 2),
      ),
    );
}
