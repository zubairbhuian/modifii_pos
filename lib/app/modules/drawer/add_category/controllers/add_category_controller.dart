import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/const.dart';
import '../../../../utils/urls.dart';

class AddCategoryController extends GetxController {
  String routeName = Get.arguments;

  TextEditingController catNameTEController = TextEditingController();
  TextEditingController subCatNameTEController = TextEditingController();
  TextEditingController searchTEController = TextEditingController();

  //TODO: set url based on routeName.
  //  String url(int? page) => switch (Get.arguments) {
  //       DrawerConstant.addCategory => URLS.category(page: page),
  //       DrawerConstant.addSubCategory => Urls.addSubCategory(page: page),
  //       DrawerConstant.addProduct => Urls.addProduct(page: page),
  //       _ => Urls.category(page: page),
  //     };

  List<AddCategoryModel> categoryList = [];
  List<AddCategoryModel> getCategoryList() {
    for (int i = 0; i < 20; i++) {
      bool isActive = Random().nextBool();
      categoryList
          .add(AddCategoryModel(name: 'Category $i', isActive: isActive));
    }

    return categoryList;
  }

  @override
  void onInit() {
    getCategoryList();
    super.onInit();
  }
}

//temporary model
class AddCategoryModel {
  String name;
  bool isActive;
  AddCategoryModel({
    required this.name,
    required this.isActive,
  });
}
