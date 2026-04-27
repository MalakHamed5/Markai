import 'package:ecommerse/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helper/tools.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            guest: () => context.goNamed('home'),
            orElse: () => null,
          );
        },
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: context.theme.primary.withValues(alpha: 0.4),
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
          },
          child: Text(
            tr.skip,
            style: TextStyle(
              color: context.theme.primary,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
