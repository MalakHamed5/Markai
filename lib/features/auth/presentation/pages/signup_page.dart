import 'package:ecommerse/core/constants/assets.dart';
import 'package:ecommerse/core/helper/tools.dart';
import 'package:ecommerse/core/theme/app_colors.dart';
import 'package:ecommerse/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final confirmPasswordCtrl = TextEditingController();

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    phoneCtrl.dispose();
    nameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // variables need build method
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
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
                      Navigator.pop(context);
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

                CustomTextField(
                  title: tr.urName,
                  hint: tr.fullName,
                  icon: Icons.person_outline,
                  controller: emailCtrl,
                ),

                CustomTextField(
                  title: tr.username,
                  hint: tr.username,
                  icon: Icons.person_outline,
                  controller: nameCtrl,
                ),

                CustomTextField(
                  title: tr.urPhone,
                  hint: "01010039770",
                  icon: Icons.phone_android,
                  controller: phoneCtrl,
                ),

                /// Email Field
                CustomTextField(
                  title: tr.email,
                  hint: "You@gmail.com",
                  icon: Icons.email_outlined,
                  controller: emailCtrl,
                ),

                /// Password Field
                CustomTextField(
                  title: tr.password,
                  hint: "********",
                  icon: Icons.lock_outline,
                  isPassword: true,
                  controller: passwordCtrl,
                ),
                CustomTextField(
                  title: tr.confirmPassword,
                  hint: "********",
                  icon: Icons.lock_outline,
                  isPassword: true,
                  controller: confirmPasswordCtrl,
                ),

                vSpace(10),

                /// Login Button
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
                    onPressed: () {},
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
                  style: const TextStyle(color: AppColors.textPrimary, fontSize: 12),
                ),

                const SizedBox(height: 18),

                /// Social Buttons
              const  Row(
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
                    Text(tr.signIn, style: const TextStyle(color: AppColors.primary)),
                  ],
                ),
              ],
            ),
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
