
import 'package:flutter/material.dart';

import '../pages/signup_page.dart';

class SocialButtonsRow extends StatelessWidget {
  const SocialButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialButton(text: "G"),
        SizedBox(width: 10),
        SocialButton(text: ""),
        SizedBox(width: 10),
        SocialButton(text: "f"),
      ],
    );
  }
}