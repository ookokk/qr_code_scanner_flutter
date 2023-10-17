// ignore_for_file: unrelated_type_equality_checks

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner_flutter/generated/codegen_loader.g.dart';
import 'package:qr_code_scanner_flutter/src/core/cache/cache_manager.dart';
import 'package:qr_code_scanner_flutter/src/core/const/routes.dart';
import 'package:qr_code_scanner_flutter/src/core/lang/language_manager.dart';
import 'package:qr_code_scanner_flutter/src/core/theme/theme_provider.dart';
import 'package:qr_code_scanner_flutter/src/feature/home/view/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: 'assets/translations',
      startLocale: LanguageManager.instance.englishLocale,
      assetLoader: const CodegenLoader(),
      child: const ProviderScope(child: MyApp())));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<String?>(
      future: CacheManager().getCustomData('theme'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final themePreference = snapshot.data;
          ThemeData? currentTheme;
          if (themePreference == 'dark') {
            currentTheme = ThemeProvider.darkTheme;
          } else {
            currentTheme = ThemeProvider.lightTheme;
          }
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            locale: context.locale,
            routes: Routes.routes,
            theme: currentTheme,
            debugShowCheckedModeBanner: false,
            home: const HomeView(),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
