import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_code_scanner_flutter/src/core/theme/theme_provider.dart';

class PleaseCard extends ConsumerWidget {
  const PleaseCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return Card(
      color: currentTheme.cardColor,
      child: Row(
        children: [
          Expanded(
            child: SvgPicture.asset(
              'assets/images/information.svg',
              height: 100,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "pleaseEnter".tr(),
              style: currentTheme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
