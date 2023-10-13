import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner_flutter/src/core/const/device_size.dart';
import 'package:qr_code_scanner_flutter/src/core/const/strings.dart';
import 'package:qr_code_scanner_flutter/src/core/theme/theme_provider.dart';

class GetStartedView extends ConsumerWidget {
  const GetStartedView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
        child: Scaffold(
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.asset(
                "assets/images/gs.png",
                height: DeviceSize.kHeight(context) * 0.35,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                Strings.getStartedWelcome,
                style: currentTheme.textTheme.displayMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                Strings.appName,
                style: currentTheme.textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 70,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      minimumSize: const Size(60, 60),
                      maximumSize: const Size(60, 60)),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/home', (route) => false);
                  },
                  child: const Icon(
                    Icons.arrow_forward_sharp,
                    size: 30,
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
