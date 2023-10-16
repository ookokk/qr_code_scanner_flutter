import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner_flutter/generated/codegen_loader.g.dart';
import 'package:qr_code_scanner_flutter/src/core/const/routes.dart';
import 'package:qr_code_scanner_flutter/src/core/lang/language_manager.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      routes: Routes.routes,
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
