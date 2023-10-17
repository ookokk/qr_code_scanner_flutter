import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuildShowDialog {
  Future<dynamic> buildShowDialog(
      BuildContext context, ThemeData currentTheme) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "success".tr(),
            style: currentTheme.textTheme.titleLarge,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/images/success.svg',
                width: 100,
                height: 100,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "saved".tr(),
                style: currentTheme.textTheme.labelLarge,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/qrCreate');
              },
              child: Text(
                "okay".tr(),
                style: currentTheme.textTheme.titleSmall
                    ?.copyWith(color: Colors.blue),
              ),
            ),
          ],
        );
      },
    );
  }
}
