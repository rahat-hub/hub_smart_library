import 'dart:async';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final RxDouble syncProgress = 0.0.obs;
  final RxBool isDatabaseSynced = false.obs;
  final RxBool isConnected = true.obs;
  final RxInt activeEbooks = 45000.obs;

  Timer? _syncTimer;
  int _currentStep = 0;

  @override
  void onInit() {
    super.onInit();
    _startSimulatedSync();
  }

  @override
  void onClose() {
    _syncTimer?.cancel();
    super.onClose();
  }

  void _startSimulatedSync() {
    _currentStep = 0;
    _syncTimer = Timer.periodic(const Duration(milliseconds: 25), (timer) {
      _currentStep += 5;
      if (_currentStep >= 100) {
        syncProgress.value = 1.0;
        isDatabaseSynced.value = true;
        timer.cancel();
      } else {
        syncProgress.value = _currentStep / 100.0;
      }
    });
  }

  void goToLogin() {
    Get.toNamed('/login');
  }

  String get syncPercentageText {
    final int percent = (syncProgress.value * 100).toInt();
    const englishToBengali = {
      '0': '০',
      '1': '১',
      '2': '২',
      '3': '৩',
      '4': '৪',
      '5': '৫',
      '6': '৬',
      '7': '৭',
      '8': '৮',
      '9': '৯',
    };
    final bengaliDigits = percent
        .toString()
        .split('')
        .map((char) => englishToBengali[char] ?? char)
        .join('');
    return '$bengaliDigits%';
  }
}
