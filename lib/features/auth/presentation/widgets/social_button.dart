import 'package:flutter/material.dart';

import '../../../../core/helper/tools.dart';

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
