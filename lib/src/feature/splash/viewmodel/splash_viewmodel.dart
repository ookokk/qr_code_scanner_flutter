import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner_flutter/src/feature/splash/view/splash_view.dart';

mixin SplashViewModel on ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      checkAndNavigate();
    });
  }

  Future<void> checkAndNavigate() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/qrScanner', (route) => false);
    } else if (status.isPermanentlyDenied) {
    } else {}
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
