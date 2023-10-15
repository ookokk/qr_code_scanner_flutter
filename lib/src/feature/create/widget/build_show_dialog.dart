import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_scanner_flutter/src/core/const/strings.dart';

class BuildShowDialog {
  Future<dynamic> buildShowDialog(
      BuildContext context, ThemeData currentTheme) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            Strings.success,
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
                Strings.saved,
                style: currentTheme.textTheme.labelLarge,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                Strings.okay,
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
