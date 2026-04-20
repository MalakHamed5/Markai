import 'package:ecommerse/core/services/service_locator.dart';
import 'package:ecommerse/core/theme/cubit/theme_cubit.dart';
import 'package:ecommerse/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:ecommerse/features/home/presentation/bloc/catagory/catagory_bloc.dart';
import 'package:ecommerse/features/home/presentation/bloc/product_details/product_details_bloc.dart';
import 'package:ecommerse/features/profile/presentation/profile/profile_bloc.dart';
import 'package:ecommerse/marketi_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/home/presentation/bloc/product/product_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<ThemeCubit>()..loadTheme()),
        BlocProvider(create: (context) => sl<AuthBloc>()),
        BlocProvider(create: (context) => sl<ProfileBloc>()),
        BlocProvider(create: (context) => sl<ProductCubit>()..getProducts()),
        BlocProvider(create: (context) => sl<ProductDetailsCubit>()),
        BlocProvider(create: (context) => sl<CatagoryBloc>()..getCatagories()),
      ],
      child: const MarketiApp(),
    ),
  );
}
