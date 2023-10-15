// ignore_for_file: must_be_immutable

import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner_flutter/src/core/cache/cache_manager.dart';
import 'package:qr_code_scanner_flutter/src/core/theme/theme_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCreateView extends ConsumerWidget {
  QrCreateView(
      {super.key,
      this.linkedin,
      this.website,
      this.address,
      this.email,
      this.phone,
      this.job,
      this.name});
  late String? name;
  late String? linkedin;
  late String? website;
  late String? address;
  late String? email;
  late String? phone;
  late String? job;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    const String message = 'osman';

    final FutureBuilder<ui.Image> qrFutureBuilder = FutureBuilder<ui.Image>(
      future: _loadOverlayImage(),
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
                  print(name);
                  print(job);
                },
                child: Text('Get Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<ui.Image> _loadOverlayImage() async {
    final Completer<ui.Image> completer = Completer<ui.Image>();
    final ByteData byteData =
        await rootBundle.load('assets/images/details.png');
    ui.decodeImageFromList(byteData.buffer.asUint8List(), completer.complete);
    return completer.future;
  }

  void getSavedData() async {
    final cache = CacheManager();
    final name = await cache.getCustomData('name');
    final job = await cache.getCustomData('job');
    final phone = await cache.getCustomData('phone');
    final email = await cache.getCustomData('email');
    final address = await cache.getCustomData('address');
    final website = await cache.getCustomData('website');
    final linkedin = await cache.getCustomData('linkedin');
    this.name = name;
    this.job = job;
    this.phone = phone;
    this.email = email;
    this.address = address;
    this.website = website;
    this.linkedin = linkedin;
  }
}
