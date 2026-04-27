import 'package:flutter/material.dart';

import '../../../../core/helper/tools.dart';

class RememberMeButton extends StatelessWidget {
  const RememberMeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 20,
      child: Checkbox(
        value: true,
        activeColor: context.theme.primary,
        onChanged: (_) {},
      ),
    );
  }
}
