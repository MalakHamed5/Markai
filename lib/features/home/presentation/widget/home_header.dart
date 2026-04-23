import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helper/tools.dart';
import '../../../profile/presentation/profile/profile_bloc.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final userData = state.maybeWhen(
          success: (context, u) => u,
          orElse: () => null,
        );
        return SliverAppBar(
          floating: true,
          snap: true,
          expandedHeight: 70,
          surfaceTintColor: Colors.transparent,
          title: Text(
            'hi ${userData?.name.split(' ').first ?? 'There'}!',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CircleAvatar(
              radius: 22,
              backgroundColor: context.theme.primary.withValues(alpha: .3),
              backgroundImage: userData?.image != null
                  ? NetworkImage(userData!.image)
                  : null,
              child: userData?.image == null
                  ? const Icon(Icons.person, color: Colors.white, size: 30)
                  : null,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: context.theme.primary,
              ),
              onPressed: () {
                context.pushNamed('notifications');
              },
            ),
          ],
        );
      },
    );
  }
}