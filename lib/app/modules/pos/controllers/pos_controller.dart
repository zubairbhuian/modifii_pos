// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:flutter_base/app/modules/pos/models/category_model.dart';
import 'package:flutter_base/app/modules/pos/models/product_model.dart';
import 'package:flutter_base/app/utils/logger.dart';
import 'package:flutter_base/app/utils/urls.dart';

class PosController extends GetxController {
  static PosController get to => Get.find();
  PageController pageController = PageController();

  RxBool isShowOrders = true.obs;
  int? categoryId;

  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  RxInt selectedCategoryIndex = (-1).obs;
  void updateSelectedCategoryIndex(int value) {
    selectedCategoryIndex.value = value;
  }

  RxList<ProductModel> productList = <ProductModel>[].obs;
  RxList<ProductModel> mainProductList = <ProductModel>[].obs;
  RxBool isProductPage = false.obs;
  RxBool isShowCart = false.obs;
  void toggleShowCart() {
    isShowCart.value = true;
  }

  RxBool isLoadingCategory = false.obs;
  getCategory({String? type, int? offset, int? limit}) async {
    isLoadingCategory.value = true;
    Map<String, dynamic>? queryParameters = {
      "type": type,
      "offset": offset,
      "limit": limit
    };
    try {
      var res =
          await Dio().get(URLS.categories, queryParameters: queryParameters);
      if (res.statusCode == 200) {
        categoryList.assignAll((res.data["data"] as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList());
      }
      isLoadingCategory.value = false;

      // kLogger.e(categoryList.length);
    } catch (e) {
      kLogger.e('Error from %%%% get categori %%%% => $e');
    }
  }

  RxBool isLoadingProduct = false.obs;
  getProduct({String? type, int? offset, int? limit, int? categoryIds}) async {
    isLoadingProduct.value = true;
    productList.clear();
    categoryId = categoryIds;
    Map<String, dynamic>? queryParameters = {
      "product_type": type,
      "offset": offset,
      "limit": limit ?? 800,
      "category_ids": categoryIds
    };
    try {
      var res =
          await Dio().get(URLS.products, queryParameters: queryParameters);
      if (res.statusCode == 200) {
        productList.assignAll((res.data["products"] as List)
            .map((e) => ProductModel.fromJson(e))
            .toList());
        mainProductList.assignAll((res.data["products"] as List)
            .map((e) => ProductModel.fromJson(e))
            .toList());

        /// Save fetched posts to Hive for future use
        // await MyHive.saveAllProducts(productList);

        isLoadingProduct.value = false;
      }
      // kLogger.e(productList.length);
    } catch (e) {
      kLogger.e('Error from %%%% get categori %%%% => $e');
    }
  }

  //** find product categoryId**
  findProductsByCategoryId(String categoryId) {
    productList.assignAll(mainProductList
        .where((product) => product.categoryIds
            .expand((category) => [category.id])
            .contains(categoryId))
        .toList());
  }

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

  //** change page **
  onchangePage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  void onInit() {
    getCategory();
    getProduct();
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
