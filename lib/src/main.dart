import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner_flutter/generated/codegen_loader.g.dart';
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
      startLocale: LanguageManager.instance.currentLocale,
      assetLoader: const CodegenLoader(),
      child: const ProviderScope(child: MyApp())));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      routes: Routes.routes,
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
