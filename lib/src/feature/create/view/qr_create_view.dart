import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner_flutter/src/core/theme/theme_provider.dart';
import 'package:qr_code_scanner_flutter/src/feature/create/viewmodel/iqr_create_state.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCreateView extends ConsumerStatefulWidget {
  const QrCreateView(
      {super.key,
      this.linkedin,
      this.website,
      this.address,
      this.email,
      this.phone,
      this.job,
      this.name});
  final String? name;
  final String? linkedin;
  final String? website;
  final String? address;
  final String? email;
  final String? phone;
  final String? job;

  @override
  QrCreateViewState createState() => QrCreateViewState();
}

class QrCreateViewState extends ConsumerState<QrCreateView>
    with IQRCreateState {
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.read(themeProvider);

    final FutureBuilder<ui.Image> qrFutureBuilder = FutureBuilder<ui.Image>(
      future: loadOverlayImage(),
      builder: (BuildContext ctx, AsyncSnapshot<ui.Image> snapshot) {
        const double size = 300.0;
        if (!snapshot.hasData) {
          return const SizedBox(width: size, height: size);
        }
        return CustomPaint(
          size: const Size.square(size),
          painter: QrPainter(
            data: message,
            version: QrVersions.auto,
            eyeStyle: const QrEyeStyle(
              eyeShape: QrEyeShape.square,
              color: Color(0xff128760),
            ),
            dataModuleStyle: const QrDataModuleStyle(
              dataModuleShape: QrDataModuleShape.circle,
              color: Color(0xff1a5441),
            ),
            embeddedImage: snapshot.data,
            embeddedImageStyle: const QrEmbeddedImageStyle(
              size: Size.square(60),
            ),
          ),
        );
      },
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: currentTheme.scaffoldBackgroundColor,
        body: Material(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 18,
              ),
              Center(
                child: SizedBox(
                  width: 280,
                  child: qrFutureBuilder,
                ),
              ),
              TextButton(
                onPressed: () {
                  getSavedData();
                  print(message);
                  print(informationList);
                  print(informationList[2]);
                },
                child: const Text('Get Data'),
              ),
              Column(
                children: [
                  personalInformationRow(currentTheme,
                      Icons.perm_contact_cal_outlined, informationList[0]),
                  personalInformationRow(
                      currentTheme, Icons.business_center, informationList[1]),
                  personalInformationRow(
                      currentTheme, Icons.local_phone, informationList[2]),
                  personalInformationRow(
                      currentTheme, Icons.email_outlined, informationList[3]),
                  personalInformationRow(currentTheme, Icons.business_outlined,
                      informationList[4]),
                  personalInformationRow(
                      currentTheme, Icons.http, informationList[5]),
                  personalInformationRow(
                      currentTheme, Icons.insert_link, informationList[6]),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget personalInformationRow(
      ThemeData currentTheme, IconData iconData, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Icon(
              iconData,
              color: currentTheme.indicatorColor,
              size: 35,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              text,
              style: currentTheme.textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}
