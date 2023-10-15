import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner_flutter/src/core/theme/theme_provider.dart';

class CustomTextField extends ConsumerWidget {
  final TextEditingController controller;
  final String? hintText;
  final VoidCallback? onIconButtonPressed;
  final Icon icon;
  final String? isRequiredText;
  final TextInputType? keyboardType;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.hintText,
    this.onIconButtonPressed,
    required this.icon,
    this.isRequiredText,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isRequiredText != null)
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text(
                isRequiredText!,
                style: currentTheme.textTheme.titleMedium,
              ),
            ),
          SizedBox(
            height: 52,
            child: TextFormField(
              keyboardType: keyboardType,
              controller: controller,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: onIconButtonPressed,
                    icon: icon,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  fillColor: currentTheme.scaffoldBackgroundColor,
                  filled: true,
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
