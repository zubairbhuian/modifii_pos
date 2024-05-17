// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';
// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/static_colors.dart';
import '../views/pages/tables/widgets/split_order.dart';

class TablesController extends GetxController {
  static TablesController get to => Get.find();
  RxInt selectedTableIndex = 0.obs;
  void updateSelectedTableIndex(int value) {
    selectedTableIndex.value = value;
  }

  List<TableModel> tablesList = [];
  void getTables() {
    for (int i = 1; i <= 60; i++) {
      bool isBooked = Random().nextBool();
      tablesList.add(
        TableModel(
          tableNo: 'T$i',
          isBooked: isBooked,
        ),
      );
    }
  }

  int? selectedBookedTableOption;
  void setSelectedBookedTableOption(int? index) {
    selectedBookedTableOption = index;
    update();
  }

  List<Map<String, Color>> bookedTableOptions = [
    {'Go to Order': StaticColors.greenColor},
    {'Add Items': StaticColors.orangeColor},
    {'Print Check': StaticColors.blueLightColor},
    {'Split Order': StaticColors.purpleColor},
  ];

  Widget? getSelectedOption() {
    if (selectedBookedTableOption != null) {
      if (selectedBookedTableOption == 0) {
        return const SplitOrder();
      }
      if (selectedBookedTableOption == 1) {
        return const SplitOrder();
      }
      if (selectedBookedTableOption == 2) {
        return const SplitOrder();
      }
      if (selectedBookedTableOption == 3) {
        return const SplitOrder();
      }
    }
    return null;
  }

  @override
  void onInit() {
    getTables();
    super.onInit();
  }
}

//temporary table model
class TableModel {
  String tableNo;
  bool isBooked;
  TableModel({
    required this.tableNo,
    required this.isBooked,
  });
}
