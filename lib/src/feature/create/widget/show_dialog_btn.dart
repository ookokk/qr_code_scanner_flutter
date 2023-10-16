import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner_flutter/src/core/const/device_size.dart';
import 'package:qr_code_scanner_flutter/src/core/theme/theme_provider.dart';

class ShowDialogBtn extends ConsumerWidget {
  final VoidCallback? onTap;
  final String? text;
  const ShowDialogBtn({super.key, this.onTap, this.text});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: currentTheme.cardColor,
        elevation: 3,
        padding: const EdgeInsets.all(8),
        minimumSize: Size(DeviceSize.kWidth(context) * 0.4,
            DeviceSize.kHeight(context) * 0.05),
        maximumSize: Size(DeviceSize.kWidth(context) * 0.4,
            DeviceSize.kHeight(context) * 0.07),
      ),
      onPressed: onTap,
      child: Text(text ?? "", style: currentTheme.textTheme.titleMedium),
    );
  }
}
