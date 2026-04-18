// lib/features/error/presentation/error_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    this.error,
    required this.uri,
  });

  final Exception? error;
  final Uri uri;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 80,
                  color: theme.colorScheme.error,
                ),
                const SizedBox(height: 24),
                Text(
                  'الصفحة غير موجودة',
                  style: theme.textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  uri.toString(),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                FilledButton.icon(
                  onPressed: () => context.goNamed('splash'),
                  icon: const Icon(Icons.home),
                  label: const Text('الرئيسية'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
