import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_code_scanner_flutter/src/core/const/device_size.dart';
import 'package:qr_code_scanner_flutter/src/core/theme/theme_provider.dart';

class HomeButton extends ConsumerWidget {
  final VoidCallback? onTap;
  final String text;
  final Color? color;
  final String imagePath;

  const HomeButton(
      {Key? key,
      this.color,
      this.onTap,
      required this.text,
      required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(color: currentTheme.canvasColor),
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(DeviceSize.kWidth(context) / 2 - 10,
              DeviceSize.kHeight(context) * 0.4),
        ),
        maximumSize: MaterialStateProperty.all<Size>(
          Size(DeviceSize.kWidth(context) / 2 - 10,
              DeviceSize.kHeight(context) * 0.4),
        ),
        elevation: MaterialStateProperty.all<double>(3),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          color ?? currentTheme.canvasColor,
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Lottie.asset(imagePath, animate: true),
          ),
          Expanded(
            child: Text(
              text,
              style: currentTheme.textTheme.headlineMedium,
            ),
          )
        ],
      ),
    );
  }
}
