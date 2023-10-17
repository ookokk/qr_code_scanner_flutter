import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_scanner_flutter/src/core/theme/theme_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class RateUsCard extends ConsumerWidget {
  static const String rateUsUrl =
      "https://play.google.com/store/apps/details?id=com.okok.qr_code_scanner";
  const RateUsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);

    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: currentTheme.shadowColor, width: 1.2)),
      elevation: 2,
      color: currentTheme.splashColor,
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/feel.svg',
            height: 130,
          ),
          const SizedBox(
            height: 8,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 30,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 30,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 30,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 30,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 30,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            textAlign: TextAlign.center,
            "needFeedback".tr(), // Metin
            style: currentTheme.textTheme.titleMedium,
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(120, 45),
                backgroundColor: currentTheme.cardColor),
            onPressed: () async {
              const url = rateUsUrl;
              final Uri uri = Uri.parse(url);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              } else {
                throw 'error can not open url: $url';
              }
            },
            child: Text(
              "rateUs".tr(),
              style: currentTheme.textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
