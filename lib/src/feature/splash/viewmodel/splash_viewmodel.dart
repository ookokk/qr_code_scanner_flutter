import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner_flutter/src/feature/splash/view/splash_page.dart';

mixin SplashViewModel on ConsumerState<SplashPage> {
  @override
  void initState() {
    checkCameraPermission();
    super.initState();
  }

  Future<bool> checkCameraPermission() async {
    var status = await Permission.camera.status;
    if (status.isGranted) {
      return true;
    } else {
      return false;
    }
  }
}
