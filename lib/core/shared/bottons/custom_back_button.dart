import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../helper/tools.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: InkWell(
        onTap: () {
          context.pop();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: context.theme.primary.withValues(alpha: 0.4),
            ),
          ),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: context.theme.onSurface,
          ),
        ),
      ),
    );
  }
}
