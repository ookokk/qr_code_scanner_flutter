import 'package:flutter/material.dart';
import 'package:qr_code_scanner_flutter/src/feature/create/view/personal_information_view.dart';
import 'package:qr_code_scanner_flutter/src/feature/get_started/view/get_started_view.dart';
import 'package:qr_code_scanner_flutter/src/feature/home/view/home_view.dart';
import 'package:qr_code_scanner_flutter/src/feature/create/view/qr_create_view.dart';
import 'package:qr_code_scanner_flutter/src/feature/scan/view/qr_scanner_view.dart';
import 'package:qr_code_scanner_flutter/src/feature/splash/view/splash_view.dart';

class Routes {
  //BASE
  static const String splash = '/splash';
  static const String getStarted = '/getStarted';

  //HOME
  static const String home = '/home';
  static const String settings = '/settings';
  //qr
  static const String qrScanner = '/qrScanner';
  static const String qrCreate = '/qrCreate';
  static const String personal = '/personal';

  static final Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashView(),
    getStarted: (context) => const GetStartedView(),
    home: (context) => const HomeView(),
    //   settings: (context) => const SettingsView(),
    qrScanner: (context) => const QrScannerView(),
    qrCreate: (context) => QrCreateView(),
    personal: (context) => PersonalInformationView(),
  };
}
