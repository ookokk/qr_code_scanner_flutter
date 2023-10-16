import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner_flutter/src/core/cache/cache_manager.dart';

class QRCreateHelper extends ChangeNotifier {
  String message = '';

  List<String> informationList = ['', '', '', '', '', '', ''];

  Future<ui.Image> loadOverlayImage() async {
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
    String combinedData =
        [name, job, phone, email, address, website, linkedin].join('|');
    message = combinedData;
    informationList = combinedData.split('|');
  }
}
