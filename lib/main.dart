import 'package:crypto_mobile/ui/home_page.dart';
import 'package:crypto_mobile/ui/theme/app_theme.dart';
import 'package:crypto_mobile/ui/theme/app_theme_state.dart';
import 'package:crypto_mobile/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/services/storage/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.getInstance();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkEnabled = ref.watch(appThemeStateProvider);
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigator.key,
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: darkEnabled ? ThemeMode.dark : ThemeMode.light,
          home: const HomePage()),
    );
  }
}
