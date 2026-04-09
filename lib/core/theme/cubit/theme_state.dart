part of 'theme_cubit.dart';

class ThemeState {
  final ThemeMode themeMode;
  const ThemeState({this.themeMode = ThemeMode.light});

  ThemeState copyWith({ThemeMode? mode}) {
    return ThemeState(themeMode: mode ?? this.themeMode);
  }
}
