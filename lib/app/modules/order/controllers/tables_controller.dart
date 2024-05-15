// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';
// import 'package:dio/dio.dart';
import 'package:get/get.dart';

class TablesController extends GetxController {
  static TablesController get to => Get.find();
  RxInt selectedTableIndex = 0.obs;
  void updateSelectedTableIndex(int value) {
    selectedTableIndex.value = value;
  }

  List<TableModel> tablesList = [];
  void getTables() {
    for (int i = 1; i <= 40; i++) {
      bool isBooked = Random().nextBool();
      tablesList.add(
        TableModel(
          tableNo: 'Table $i',
          isBooked: isBooked,
        ),
      );
    }
  }

  @override
  void onInit() {
    getTables();
    super.onInit();
  }
}

class TableModel {
  String tableNo;
  bool isBooked;
  TableModel({
    required this.tableNo,
    required this.isBooked,
  });
}
