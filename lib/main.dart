import 'package:ecommerse/core/services/service_locator.dart';
import 'package:ecommerse/core/theme/cubit/theme_cubit.dart';
import 'package:ecommerse/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:ecommerse/features/favorites/presentation/favorite/favorite_bloc.dart';
import 'package:ecommerse/features/home/presentation/bloc/brand/brand_bloc.dart';
import 'package:ecommerse/features/home/presentation/bloc/catagory/catagory_bloc.dart';
import 'package:ecommerse/features/home/presentation/bloc/product/product_bloc.dart';
import 'package:ecommerse/features/profile/presentation/profile/profile_bloc.dart';
import 'package:ecommerse/app/marketi_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  //* excute before app run
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<ThemeCubit>()..loadTheme()),
        BlocProvider(create: (context) => sl<AuthBloc>()),
        BlocProvider(create: (context) => sl<ProfileBloc>()),
        BlocProvider(create: (context) => sl<ProductCubit>()),
        BlocProvider(create: (context) => sl<CatagoryBloc>()),
        BlocProvider(create: (context) => sl<BrandBloc>()),
        BlocProvider(create: (context) => sl<FavoriteBloc>()),
        
      ],
      child: const MarketiApp(),
    ),
  );
}
