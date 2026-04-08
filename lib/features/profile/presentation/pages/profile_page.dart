
import 'package:ecommerse/core/shared/bottons/custom_back_button.dart';
import 'package:ecommerse/features/profile/presentation/profile/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/extensions.dart';
import '../../../../core/helper/tools.dart';
import '../../../../core/shared/bottons/cart_button.dart';
import '../../../../core/theme/app_colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(const ProfileEvent.getUserData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (message, user) => Column(
            children: [
              vSpace(50),

              // Header
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(),
                  Center(
                    child: Text(
                      "My Profile",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  CartButton(),
                ],
              ),
              vSpace(20),
              // Profile info
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  user?.image ??
                      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=300',
                ),
              ),
              vSpace(20),
              Text(
                user?.name.capitalizeFirstLetter() ?? "",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                user?.email.capitalizeFirstLetter() ?? "",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textHint,
                ),
              ),
              vSpace(20),

              CustomListTile(
                icon: Icons.person_outline,
                title: "Account Preferences",
                onTap: () {},
              ),

              const _CustomDriver(),

              CustomListTile(
                icon: Icons.payment,
                title: "Subscription & Payment",
                onTap: () {},
              ),

              const _CustomDriver(),

              CustomListTile(
                icon: Icons.notifications_none,
                title: "App Notifications",
                isToggle: true,
                onChanged: (value) {},
              ),

              const _CustomDriver(),

              CustomListTile(
                icon: Icons.dark_mode,
                title: "Dark Mode",
                isToggle: true,
                onChanged: (value) {},
              ),

              const _CustomDriver(),

              CustomListTile(
                icon: Icons.star_border,
                title: "Rate Us",
                onTap: () {},
              ),

              const _CustomDriver(),

              CustomListTile(
                icon: Icons.info_outline,
                title: "About Us",
                onTap: () {},
              ),

              const _CustomDriver(),

              CustomListTile(
                icon: Icons.logout,
                title: "Logout",
                onTap: () {},
                isLogout: true,
              ),

              const _CustomDriver(),
            ],
          ),
          guest: () => Center(
            child:  Column(
              children: [
                vSpace(100),
                const Text("Guest"),
                vSpace(20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text("Login"),
                ),
              ],
            ),
      
          ),
          orElse: () => Container(
            color: Colors.amber,
          ),
        );
      },
    );
  }
}

class _CustomDriver extends StatelessWidget {
  const _CustomDriver();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.grey,
      indent: 30,
      endIndent: 30,
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.isToggle = false,
    this.onChanged,
    this.isLogout = false,
  });

  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final bool isToggle;
  final void Function(bool)? onChanged;
  final bool? isLogout;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: isToggle ? null : onTap,
      leading: isLogout == true
          ? Icon(
              icon,
              size: 22,
              color: Colors.red,
            )
          : Icon(
              icon,
              size: 22,
            ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
      ),
      trailing: isToggle
          ? Switch(value: isToggle, onChanged: onChanged)
          : Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.textHint.withAlpha(100)),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Colors.grey,
              ),
            ),
    );
  }
}
