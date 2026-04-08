import 'package:ecommerse/core/services/service_locator.dart';
import 'package:ecommerse/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:ecommerse/features/profile/presentation/profile/profile_bloc.dart';
import 'package:ecommerse/marketi_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/data/repositories/auth_repo.dart';
import 'features/profile/data/repositories/profile_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(repo: sl<AuthRepo>())),
        BlocProvider(
          create: (context) => ProfileBloc(profileRepo: sl<ProfileRepo>()),
        ),
      ],
      child: const MarketiApp(),
    ),
  );
}
