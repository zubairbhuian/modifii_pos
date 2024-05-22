import 'dart:async';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class ClockInController extends GetxController {
  static ClockInController get to => Get.find();

  Timer? timer;
  RxInt secondsElapsed = 0.obs;

  void clockIn() {
    if (timer != null && timer!.isActive) return;

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      secondsElapsed.value++;
    });

    Get.offAllNamed(Routes.ENTRY_POINT);
  }

  void clockOut() {
    timer?.cancel();
    secondsElapsed.value = 0;
    Get.offAllNamed(Routes.CLOCK_IN);
  }

  String showClockInTimer(int seconds) {
    final hours = (seconds ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((seconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$secs";
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
