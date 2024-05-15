import 'package:flutter/material.dart';
import 'package:flutter_base/app/modules/order/controllers/bar_controller.dart';
import 'package:flutter_base/app/widgets/my_custom_text.dart';
import 'package:get/get.dart';

class BarOption extends GetView<BarController> {
  const BarOption({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: MyCustomText(
        'Upcoming...',
        fontSize: 69,
      ),
    );
  }
}
