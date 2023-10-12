import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_code_scanner_flutter/src/core/const/device_size.dart';
import 'package:qr_code_scanner_flutter/src/core/theme/theme_provider.dart';
import 'package:qr_code_scanner_flutter/src/feature/splash/viewmodel/splash_viewmodel.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashPage> with SplashViewModel {
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
        child: Scaffold(
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      body: SizedBox(
        child: Center(
            child: Lottie.asset(
          'assets/animations/splash.json',
          height: DeviceSize.kHeight(context) * 0.2,
          repeat: true,
          animate: true,
        )),
      ),
    ));
  }
}
