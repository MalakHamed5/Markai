import 'package:flutter/material.dart';

import '../../../../core/helper/tools.dart';

class ForgotButton extends StatelessWidget {
  const ForgotButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        tr.forgotPassword,
        style: TextStyle(
          color: context.theme.primary,
          fontSize: 14,
        ),
      ),
    );
  }
}