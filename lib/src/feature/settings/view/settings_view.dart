import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_code_scanner_flutter/src/core/const/device_size.dart';
import 'package:qr_code_scanner_flutter/src/core/const/strings.dart';
import 'package:qr_code_scanner_flutter/src/core/theme/theme_provider.dart';
import 'package:qr_code_scanner_flutter/src/feature/settings/widget/language_bottom_sheet.dart';
import 'package:qr_code_scanner_flutter/src/feature/settings/widget/settings_list_tile.dart';
import 'package:qr_code_scanner_flutter/src/feature/settings/widget/theme_switch.dart';

class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ProfileSettingsViewState();
}

class _ProfileSettingsViewState extends ConsumerState<SettingsView> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
        child: Scaffold(
            backgroundColor: currentTheme.scaffoldBackgroundColor,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: DeviceSize.kHeight(context) * 0.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'assets/animations/settings.json',
                          animate: true,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    height: DeviceSize.kHeight(context) * 0.8,
                    child: ListView(children: [
                      SettingsListTile(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return const LanguageBottomSheet();
                                });
                          },
                          text: Strings.language,
                          trailingChild: Icon(
                            Icons.arrow_forward_ios,
                            color: currentTheme.indicatorColor,
                          )),
                      const SettingsListTile(
                          text: Strings.darkTheme,
                          trailingChild: ThemeSwitch()),
                    ]),
                  ),
                ],
              ),
            )));
  }
}
