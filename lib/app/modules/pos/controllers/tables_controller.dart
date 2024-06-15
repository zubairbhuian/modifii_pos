// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';
// import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/app/modules/pos/controllers/pos_controller.dart';
import 'package:flutter_base/app/modules/pos/models/dine_in_order_model.dart';
import 'package:flutter_base/app/utils/my_formatter.dart';
import 'package:flutter_base/app/utils/urls.dart';
import 'package:get/get.dart';

import '../../../utils/logger.dart';
import '../models/table_model.dart';

class TablesController extends GetxController {
  static TablesController get to => Get.find();
  OrderData? selectedOrder;
  void updateSelectedOrder(OrderData? orderData) {
    selectedOrder = orderData;
    update();
  }

  RxInt selectedTableIndex = 0.obs;
  void updateSelectedTableIndex(int value) {
    selectedTableIndex.value = value;
  }

  RxList<TableModel> tablesList = <TableModel>[].obs;

  void getTables() async {
    try {
      var res = await Dio().get(URLS.tableList);
      if (res.statusCode == 200) {
        tablesList.assignAll(
          (res.data as List).map((e) => TableModel.fromJson(e)).toList(),
        );

        availableTablesIdNumber = getAvailableList(tablesList);
      }
    } catch (e) {
      kLogger.e('Error from %%%% get tables %%%% => $e');
    }
  }

  RxList<TableModel> barsList = <TableModel>[].obs;

  void getBars() async {
    try {
      var res = await Dio().get(URLS.barList);
      if (res.statusCode == 200) {
        barsList.assignAll(
          (res.data as List).map((e) => TableModel.fromJson(e)).toList(),
        );

        availableBarsIdNumber = getAvailableList(barsList);
      }
    } catch (e) {
      kLogger.e('Error from %%%% get bars %%%% => $e');
    }
  }

  RxList<TableModel> hallsList = <TableModel>[].obs;
  void getHalls() async {
    try {
      var res = await Dio().get(URLS.hallList);
      if (res.statusCode == 200) {
        hallsList.assignAll(
          (res.data as List).map((e) => TableModel.fromJson(e)).toList(),
        );
      }
    } catch (e) {
      kLogger.e('Error from %%%% get halls %%%% => $e');
    }
  }

  List<Map<String, String>> availableTablesIdNumber = [];
  String? selectedTableId;
  void updateSelectedTableId(String? value) {
    selectedTableId = value;
    update();
  }

  List<Map<String, String>> availableBarsIdNumber = [];
  String? selectedBarId;
  void updateSelectedBarId(String? value) {
    selectedBarId = value;
    update();
  }

  bool isTableOrBarSelected() {
    // if (selectedBarId != null || selectedTableId != null) {
    if (selectedTableId != null) {
      return true;
    } else {
      return false;
    }
  }

  List<Map<String, String>> getAvailableList(List list) {
    var values = list
        .where((e) => e.status == 1) //available
        .map((e) => {'${e.id}': '${e.number}'})
        .toList();
    update();
    return values;
  }

  List<String> guestNumbers = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15'
  ];
  String? selectedGuestNumbers;
  void updatedSelectedGuestNumbers(String? value) {
    selectedGuestNumbers = value;
    PosController.to.getTotalPrice();
    update();
  }

  clearSelections() {
    selectedTableId = null;
    selectedBarId = null;
    selectedGuestNumbers = null;
    update();
  }

  //*******ORDER ITEMS RECIEPTS******* */
  //list of total receipts
  List<List<OrderItemModel>> orderReceiptsList = [];
  //initial receipt items
  List<OrderItemModel> orderItemsList = [];
  //copy list of orderItemsList
  List<OrderItemModel> orderItemsListTemporary = [];

  void getOrderItems() {
    for (int i = 1; i <= 8; i++) {
      int randomInt = Random().nextInt(4) + 1;
      double randomDouble = Random().nextDouble() * 199;
      orderItemsList.add(
        OrderItemModel(
          name: 'Item Name',
          quantity: randomInt,
          price: randomDouble,
        ),
      );
    }

    orderReceiptsList.add(orderItemsList);
    update();
    orderItemsListTemporary = List.from(orderItemsList);
  }

  final List<String> branches = [
    'Branch 1',
    'Branch 2',
    'Branch 3',
  ];
  String? selectedBranch;
  void updateSelectedBranch(String? value) {
    selectedBranch = value;
    update();
  }

  List<OrderItemModel> orderItemsListSplit = [];
  void toggleOrderItemsListSplit(OrderItemModel item) {
    if (!orderItemsListSplit.contains(item)) {
      orderItemsListSplit.add(item);
      orderItemsListTemporary.remove(item);
    } else {
      orderItemsListSplit.remove(item);
      orderItemsListTemporary.add(item);
    }
    isItemContainsOnSplitList(item);
    update();
  }

  bool isItemContainsOnSplitList(OrderItemModel item) {
    return orderItemsListSplit.contains(item);
  }

  void splitReceipts() {
    if (orderItemsListSplit.isNotEmpty) {
      List<OrderItemModel> list = List.from(orderItemsListSplit);
      orderReceiptsList.add(list);
      orderReceiptsList[0] = List.from(orderItemsListTemporary);
      orderItemsListSplit.clear();
      update();
    }
  }

  TextEditingController startDateTEC = TextEditingController();
  updateStartDate(DateTime? date) {
    if (date != null) {
      startDateTEC.text =
          MyFormatter.formatDate(date.toString().split(' ').first);
      update();
    }
  }

  TextEditingController endDateTEC = TextEditingController();
  updateEndDate(DateTime? date) {
    if (date != null) {
      endDateTEC.text =
          MyFormatter.formatDate(date.toString().split(' ').first);
      update();
    }
  }

  @override
  void onInit() {
    getTables();
    getBars();
    getHalls();
    getOrderItems();
    super.onInit();
  }
}

//temporary table model
class TableModelTemp {
  String tableNo;
  bool isBooked;
  TableModelTemp({
    required this.tableNo,
    required this.isBooked,
  });
}

//temporary orderItem model
class OrderItemModel {
  String name;
  int quantity;
  double price;
  OrderItemModel({
    required this.name,
    required this.quantity,
    required this.price,
  });
}
