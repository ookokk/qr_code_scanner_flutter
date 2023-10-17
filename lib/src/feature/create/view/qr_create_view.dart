import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner_flutter/src/core/theme/theme_provider.dart';
import 'package:qr_code_scanner_flutter/src/feature/create/viewmodel/qr_create_helper.dart';
import 'package:qr_code_scanner_flutter/src/feature/create/widget/show_dialog_btn.dart';
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

class QrCreateViewState extends ConsumerState<QrCreateView> {
  final QRCreateHelper qrHelper = QRCreateHelper();

  @override
  void initState() {
    super.initState();
    qrHelper.getSavedData();
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.read(themeProvider);
    final FutureBuilder<ui.Image> qrFutureBuilder = FutureBuilder<ui.Image>(
      future: qrHelper.loadOverlayImage(),
      builder: (BuildContext ctx, AsyncSnapshot<ui.Image> snapshot) {
        const double size = 300.0;
        if (!snapshot.hasData) {
          return const SizedBox(width: size, height: size);
        }
        return CustomPaint(
          size: const Size.square(size),
          painter: QrPainter(
            data: qrHelper.message,
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
              size: Size.square(50),
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
              ShowDialogBtn(
                elevation: 5,
                bgColor: const Color(0xffe3d5d5),
                text: "generate".tr(),
                onTap: () {
                  setState(() {
                    qrHelper.getSavedData();
                  });
                },
              ),
              Column(
                children: [
                  personalInformationRow(
                      currentTheme,
                      Icons.perm_contact_cal_outlined,
                      qrHelper.informationList[0]),
                  personalInformationRow(currentTheme, Icons.business_center,
                      qrHelper.informationList[1]),
                  personalInformationRow(currentTheme, Icons.local_phone,
                      qrHelper.informationList[2]),
                  personalInformationRow(currentTheme, Icons.email_outlined,
                      qrHelper.informationList[3]),
                  personalInformationRow(currentTheme, Icons.business_outlined,
                      qrHelper.informationList[4]),
                  personalInformationRow(
                      currentTheme, Icons.http, qrHelper.informationList[5]),
                  personalInformationRow(currentTheme, Icons.insert_link,
                      qrHelper.informationList[6]),
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
