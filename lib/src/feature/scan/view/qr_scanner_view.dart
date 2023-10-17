import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner_flutter/src/core/theme/theme_provider.dart';
import 'package:qr_code_scanner_flutter/src/feature/scan/viewmodel/iqr_scanner_state.dart';
import 'package:url_launcher/url_launcher.dart';

class QrScannerView extends ConsumerStatefulWidget {
  const QrScannerView({Key? key}) : super(key: key);

  @override
  QrScannerViewState createState() => QrScannerViewState();
}

class QrScannerViewState extends ConsumerState<QrScannerView>
    with IQRScannerState {
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.read(themeProvider);
    return Scaffold(
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (result != null)
                    Column(
                      children: [
                        Text('Data: ${result!.code}'),
                        pauseResumeButton(currentTheme, () async {
                          final url = result!.code;
                          final Uri uri = Uri.parse(url!);
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          } else {
                            throw 'error can not open url: $url';
                          }
                        }, "Open Link"),
                      ],
                    )
                  else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        flashAndCameraButton(currentTheme, () async {
                          await controller?.toggleFlash();
                          setState(() {});
                        }, Icons.flash_on, Icons.flash_off),
                        flashAndCameraButton(currentTheme, () async {
                          await controller?.flipCamera();
                          setState(() {});
                        }, Icons.photo_camera_back, Icons.photo_camera_front)
                      ],
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      pauseResumeButton(currentTheme, () async {
                        await controller?.pauseCamera();
                      }, "pause".tr()),
                      pauseResumeButton(currentTheme, () async {
                        await controller?.resumeCamera();
                      }, "resume".tr())
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container flashAndCameraButton(ThemeData currentTheme, VoidCallback onTap,
      IconData activeIcon, IconData passiveIcon) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: currentTheme.cardColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18))),
          onPressed: onTap,
          child: FutureBuilder(
            future: controller?.getFlashStatus(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                if (snapshot.data == true) {
                  return Icon(activeIcon, color: currentTheme.indicatorColor);
                } else {
                  return Icon(
                    passiveIcon,
                    color: currentTheme.indicatorColor,
                  );
                }
              }
              return const Text('loading');
            },
          )),
    );
  }

  Container pauseResumeButton(
    ThemeData currentTheme,
    VoidCallback onTap,
    String text,
  ) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: currentTheme.cardColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18))),
        onPressed: onTap,
        child: Text(text, style: currentTheme.textTheme.titleSmall),
      ),
    );
  }
}
