import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner_flutter/src/core/const/strings.dart';
import 'package:qr_code_scanner_flutter/src/core/theme/theme_provider.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final VoidCallback? onTap;
  final String? title;
  final Widget? icon;
  const CustomAppBar({Key? key, this.title, this.onTap, this.icon})
      : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.08);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return AppBar(
      actions: [
        icon ??
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
                icon: Icon(
                  Icons.settings,
                  color: currentTheme.indicatorColor,
                  size: 30,
                )),
        const SizedBox(
          width: 8,
        )
      ],
      title: Text(
        title ?? Strings.appName,
        style: currentTheme.textTheme.headlineMedium,
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: onTap,
        icon: Icon(
          Icons.arrow_back,
          color: currentTheme.indicatorColor,
        ),
      ),
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      elevation: 2,
    );
  }
}
