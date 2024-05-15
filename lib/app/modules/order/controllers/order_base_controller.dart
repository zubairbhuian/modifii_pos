import 'package:flutter/material.dart';
import 'package:flutter_base/app/modules/order/components/bar/bar_option.dart';
import 'package:get/get.dart';
import '../../../utils/static_colors.dart';
import '../components/pos/pos_option.dart';
import '../components/tables/tables_option.dart';

class OrderBaseController extends GetxController {
  RxInt selectedHeaderOption = 0.obs;

  List<Map<String, Color>> headerOptions = [
    {'POS': StaticColors.greenColor},
    {'ORDERS': StaticColors.yellowColor},
    {'TABLE\nORDERS': StaticColors.yellowColor},
    {'TABLES': StaticColors.purpleColor},
    {'BAR': StaticColors.purpleColor},
    {'TAKEOUT': StaticColors.blueColor},
    {'Check\nSummary': StaticColors.blueColor},
    {'Cash\nOut': StaticColors.greenColor},
  ];

  Widget getSelectedOption() {
    switch (selectedHeaderOption.value) {
      case 0:
        return const PosOption();
      case 3:
        return const TablesOption();
      default:
        return const BarOption();
    }
  }
}
