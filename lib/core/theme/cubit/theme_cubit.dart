import 'package:bloc/bloc.dart';
import 'package:ecommerse/core/cache/cache_helper.dart';
import 'package:ecommerse/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'theme_state.dart';

@injectable
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(themeMode: ThemeMode.light));

  Future<void> toggleTheme(ThemeMode mode) async {
    await sl<CacheHelper>().saveData(key: 'theme', value: mode.name);
    emit(ThemeState(themeMode: mode));
  }

  Future<void> loadTheme() async {
    final String readTheme = await sl<CacheHelper>().getData(key: 'theme') ??
        ThemeMode.system.name; // light // dark // system
    switch (readTheme) {
      case 'light':
        emit(const ThemeState(themeMode: ThemeMode.light));
        break;
      case 'dark':
        emit(const ThemeState(themeMode: ThemeMode.dark));
        break;
      case 'system':
        emit(const ThemeState(themeMode: ThemeMode.system));
        break;
    }
  }
}
