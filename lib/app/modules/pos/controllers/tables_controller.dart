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

  // int? selectedBookedTableOption;
  // void setSelectedBookedTableOption(int? index) {
  //   selectedBookedTableOption = index;
  //   update();
  // }

  // List<Map<String, Color>> bookedTableOptions = [
  //   {'Go to Order': StaticColors.greenColor},
  //   {'Add Items': StaticColors.orangeColor},
  //   {'Print Check': StaticColors.blueLightColor},
  //   {'Split Order': StaticColors.purpleColor},
  // ];

  // Widget? getSelectedOption() {
  //   if (selectedBookedTableOption != null) {
  //     if (selectedBookedTableOption == 0) {
  //       return const SplitOrder();
  //     }
  //     if (selectedBookedTableOption == 1) {
  //       return const SplitOrder();
  //     }
  //     if (selectedBookedTableOption == 2) {
  //       return const SplitOrder();
  //     }
  //     if (selectedBookedTableOption == 3) {
  //       return const SplitOrder();
  //     }
  //   }
  //   return null;
  // }

  //Order Items
  List<List<OrderItemModel>> orderReceiptsList = [];
  List<OrderItemModel> orderItemsList = [];
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
  }

  //split order
  void createAnotherOrderItemsList() {
    if (orderItemsList.isNotEmpty) {
      //remove last item from first list
      orderItemsList = [orderItemsList.removeLast()];

      //create new list, item is last item from first list
      List<OrderItemModel> newList = [orderItemsList.last];
      orderReceiptsList.add(newList);

      update();
    }
  }

  @override
  void onInit() {
    getTables();
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
