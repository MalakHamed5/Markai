import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerse/core/routes/routes.dart';
import 'package:ecommerse/core/shared/bottons/custom_back_button.dart';
import 'package:ecommerse/core/theme/cubit/theme_cubit.dart';
import 'package:ecommerse/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:ecommerse/features/profile/presentation/profile/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
        final user = state.maybeWhen(
          success: (_, u) => u,
          orElse: () => null,
        );

        final isGuest = (user == null);

        if (isGuest) {
          return Stack(
            children: [
              Container(
                color: Colors.black.withOpacity(0.7),
                width: double.infinity,
                height: double.infinity,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    context.go(AppPath.login);
                  },
                  child: Text(tr.login),
                ),
              ),
            ],
          );
        }
        return Column(
          children: [
            vSpace(50),
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomBackButton(),
                Center(
                  child: Text(
                    tr.myProfile,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const CartButton(),
              ],
            ),
            vSpace(20),
            //--------------- Profile info
            const CircleAvatar(
              radius: 50,
              backgroundImage: CachedNetworkImageProvider(
                'https://cdn-icons-png.flaticon.com/512/149/149071.png',
              ),
            ),
            vSpace(20),
            Text(
              user.name.capitalizeFirstLetter(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              user.email.capitalizeFirstLetter(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.textHint,
              ),
            ),
            vSpace(20),

            CustomListTile(
              icon: Icons.person_outline,
              title: tr.accountPreferences,
              onTap: () {},
            ),

            const _CustomDriver(),

            CustomListTile(
              icon: Icons.payment,
              title: tr.subscriptionAndPayment,
              onTap: () {},
            ),

            const _CustomDriver(),

            CustomListTile(
              icon: Icons.notifications_none,
              title: tr.appNotifications,
              isToggle: true,
              onChanged: (value) {},
            ),

            const _CustomDriver(),

            CustomListTile(
              icon: Icons.dark_mode,
              title: tr.darkMode,
              isToggle: true,
              onChanged: (value) {
                final mode = value ? ThemeMode.dark : ThemeMode.light;
                context.read<ThemeCubit>().toggleTheme(mode);
              },
            ),
            const _CustomDriver(),

            CustomListTile(
              icon: Icons.star_border,
              title: tr.rateUs,
              onTap: () {},
            ),

            const _CustomDriver(),

            CustomListTile(
              icon: Icons.info_outline,
              title: tr.aboutUs,
              onTap: () {},
            ),

            const _CustomDriver(),

            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                state.maybeWhen(
                  success: (message) {
                    context.go(AppPath.login);
                  },
                  orElse: () {},
                );
              },
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return CustomListTile(
                    icon: Icons.logout,
                    title: tr.logout,
                    onTap: () {
                      context.read<AuthBloc>().add(const AuthEvent.logout());
                    },
                    isLogout: true,
                  );
                },
              ),
            ),

            const _CustomDriver(),
          ],
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
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: theme.onSurface,
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
