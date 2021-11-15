import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppThemeState extends StateNotifier<bool> {
  AppThemeState() : super(true);

  // void setLightTheme() => state = false;
  // void setDarkTheme() => state = true;
  bool istapped = false;
  void toggleTheme() {
    state == false ? state = true : state = false;
  }
}

final appThemeStateProvider = StateNotifierProvider((ref) => AppThemeState());
