import 'package:ecommerse/core/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/routes/routes.dart';
import 'core/services/secure_token_store.dart';
import 'core/services/service_locator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      if (!mounted) return;

      final token = await sl<SecureTokenStore>().readToken();

      if (!mounted) return;

      if (token != null) {
        context.go(Routes.root);
      } else {
        context.go(Routes.login);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset(Assets.imagesMarketi)));
  }
}
