import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner_flutter/src/core/const/strings.dart';
import 'package:qr_code_scanner_flutter/src/feature/home/model/custom_app_bar.dart';
import 'package:qr_code_scanner_flutter/src/feature/home/widget/home_button.dart';

class HomeView extends ConsumerWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 28,
              ),
              Row(
                children: [
                  HomeButton(
                    text: Strings.scan,
                    imagePath: "assets/animations/scan.json",
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  HomeButton(
                    text: Strings.create,
                    imagePath: "assets/animations/create.json",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
