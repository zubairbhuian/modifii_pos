import 'package:flutter/material.dart';
import 'package:flutter_base/app/utils/static_colors.dart';
import 'package:flutter_base/app/widgets/appbar.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_btn.dart';
import '../controllers/clock_in_controller.dart';

class ClockInView extends GetView<ClockInController> {
  const ClockInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        hasButtonsRow: false,
        isLeading: false,
        hasHomeButton: false,
      ),
      body: Center(
        child: PrimaryBtn(
          onPressed: controller.clockIn,
          height: 220,
          width: 220,
          textMaxSize: 32,
          textMinSize: 24,
          text: 'CLOCK IN',
          color: StaticColors.greenColor,
          style: Theme.of(context)
              .textTheme
              .displayLarge
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
