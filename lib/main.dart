import 'package:dio/dio.dart';
import 'package:ecommerse/core/api/dio_consumer.dart';
import 'package:ecommerse/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:ecommerse/marketi_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(api: DioConsumer(dio: Dio()))),
      ],
      child: const MarketiApp(),
    ),
  );
}
