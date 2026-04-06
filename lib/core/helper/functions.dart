import 'package:flutter/material.dart';

void showNotifyMsg({
  Color bgColor = Colors.green,
  required String text,
  required BuildContext context,
}) {
  ScaffoldMessenger.of(context)
    ..clearSnackBars() // optional: remove any current one
    ..showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: bgColor,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(bottom: 30, left: 30, right: 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        duration: const Duration(seconds: 2),
      ),
    );
}
