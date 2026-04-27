import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          success: (_, u) => u,
          orElse: () => null,
        );
        return SliverAppBar(
          floating: true,
          snap: true,
          pinned: true,
          expandedHeight: 70,
          surfaceTintColor: Colors.white,
          title: Text(
            userData != null ? 'Hi, ${(userData.name.split(' ').first)}!' : "Hi There!",
            style: const TextStyle(fontSize: 22),
          ),
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: context.theme.primary.withValues(alpha: .3),
              child: const Icon(Icons.person, color: Colors.white, size: 30),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: context.theme.primary,
              ),
              onPressed: () {
                //ToDo: go to notifications page
                // context.pushNamed('notifications');
              },
            ),
          ],
        );
      },
    );
  }
}
