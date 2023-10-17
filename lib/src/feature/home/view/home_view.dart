import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner_flutter/src/feature/home/model/custom_app_bar.dart';
import 'package:qr_code_scanner_flutter/src/feature/home/widget/home_button.dart';
import 'package:qr_code_scanner_flutter/src/feature/home/widget/rate_us_card.dart';

class HomeView extends ConsumerWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HomeButton(
                    text: "scan".tr(),
                    imagePath: "assets/animations/scan.json",
                    onTap: () {
                      Navigator.pushNamed(context, '/qrScanner');
                    },
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  HomeButton(
                    text: "create".tr(),
                    imagePath: "assets/animations/create.json",
                    onTap: () {
                      Navigator.pushNamed(context, '/personal');
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              const RateUsCard()
            ],
          ),
        ),
      ),
    ));
  }
}
