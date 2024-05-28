// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';
// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TablesController extends GetxController {
  static TablesController get to => Get.find();
  RxInt selectedTableIndex = 0.obs;
  void updateSelectedTableIndex(int value) {
    selectedTableIndex.value = value;
  }

  List<TableModel> tablesList = [];
  List<TableModel> barList = [];
  List<TableModel> hallList = [];
  void getTables() {
    for (int i = 1; i <= 20; i++) {
      bool isBooked = Random().nextBool();
      tablesList.add(
        TableModel(
          tableNo: 'T$i',
          isBooked: isBooked,
        ),
      );
    }
  }

  void getBars() {
    for (int i = 1; i <= 10; i++) {
      bool isBooked = Random().nextBool();
      barList.add(
        TableModel(
          tableNo: 'B$i',
          isBooked: isBooked,
        ),
      );
    }
  }

  void getHalls() {
    for (int i = 1; i <= 14; i++) {
      bool isBooked = Random().nextBool();
      hallList.add(
        TableModel(
          tableNo: 'H$i',
          isBooked: isBooked,
        ),
      );
    }
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

//Table Orders

  TextEditingController startDateTEC = TextEditingController();
  TextEditingController endDateTEC = TextEditingController();
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
class TableModel {
  String tableNo;
  bool isBooked;
  TableModel({
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
