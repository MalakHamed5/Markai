import 'package:ecommerse/core/helper/tools.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterText extends StatelessWidget {
  const RegisterText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          tr.areYouNewInMarketi,
          style: TextStyle(
            color: context.theme.onSurface,
            fontSize: 12,
          ),
        ),
        const Text('? '),
        TextButton(
          onPressed: () {
            context.pushNamed('signup');
          },
          child: Text(
            tr.register,
            style: TextStyle(color: context.theme.primary),
          ),
        ),
      ],
    );
  }
}