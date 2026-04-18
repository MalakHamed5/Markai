import 'package:ecommerse/core/routes/app_router.dart';
import 'package:ecommerse/generated/l10n.dart';
import 'package:flutter/material.dart';

final tr = S.of(appRouter.configuration.navigatorKey.currentContext!);

final ctx = appRouter.configuration.navigatorKey.currentContext!;

final theme = Theme.of(ctx).colorScheme;

SizedBox vSpace(double height) => SizedBox(height: height);
SizedBox hSpace(double width) => SizedBox(width: width);
