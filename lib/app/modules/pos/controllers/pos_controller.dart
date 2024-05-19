import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/app/modules/pos/models/category_model.dart';
import 'package:flutter_base/app/modules/pos/models/product_model.dart';
import 'package:flutter_base/app/utils/logger.dart';
import 'package:flutter_base/app/utils/urls.dart';
import 'package:get/get.dart';

class PosController extends GetxController {
  static PosController get to => Get.find();

  //** change page **
  PageController pageController = PageController();
  RxBool isShowPos = true.obs;
  onchangePage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    if (index == 0) {
      isShowPos.value = false;
    } else {
      isShowPos.value = true;
    }
  }

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

  // List<String> orderTypes = ['TO GO', "DON'T MAKE", 'RUSH'];
  bool isTogoSelected = false;
  bool isDontMakeSelected = false;
  bool isRushSelected = false;

  List<String> orderTypes2 = ['APPETIZERS 1st', "ALL-TOGETHER"];
  int? selectedOrderTypesIndex2;
  void setSelectedOrderTypesIndex2(int index) {
    selectedOrderTypesIndex2 = index;
    update();
  }

  bool isDrink = true;
  List<String> orderModifiers = ['MILD', "MEDIUM", 'HOT', 'EXTRA HOT'];
  int? selectedOrderModifiersIndex;
  void setSelectedOrderModifiersIndex(int index) {
    selectedOrderModifiersIndex = index;
    update();
  }

  int orderQuantity = 1;
  double orderTotalPrice = 0;
  void updateOrderQuantity(bool isIncrease, double price) {
    if (isIncrease && orderQuantity < 10) {
      orderQuantity++;
      orderTotalPrice += price;
      update();
    } else if (!isIncrease && orderQuantity > 1) {
      orderQuantity--;
      orderTotalPrice -= price;
      update();
    }
  }

  @override
  void onInit() {
    getCategory();
    getProduct();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
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

// class OrderController extends GetxController {
//   static OrderController get to => Get.find();
//   int? categoryId;

//   RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
//   RxInt selectedCategoryIndex = (-1).obs;
//   void updateSelectedCategoryIndex(int value) {
//     selectedCategoryIndex.value = value;
//   }

//   RxList<ProductModel> productList = <ProductModel>[].obs;
//   RxList<ProductModel> mainProductList = <ProductModel>[].obs;
//   RxBool isProductPage = false.obs;
//   RxBool isShowCart = false.obs;
//   void toggleShowCart() {
//     isShowCart.value = true;
//   }

//   RxBool isLoadingCategory = false.obs;
//   getCategory({String? type, int? offset, int? limit}) async {
//     isLoadingCategory.value = true;
//     Map<String, dynamic>? queryParameters = {
//       "type": type,
//       "offset": offset,
//       "limit": limit
//     };
//     try {
//       var res =
//           await Dio().get(URLS.categories, queryParameters: queryParameters);
//       if (res.statusCode == 200) {
//         categoryList.assignAll((res.data["data"] as List)
//             .map((e) => CategoryModel.fromJson(e))
//             .toList());
//       }
//       isLoadingCategory.value = false;

//       // kLogger.e(categoryList.length);
//     } catch (e) {
//       kLogger.e('Error from %%%% get categori %%%% => $e');
//     }
//   }

//   RxBool isLoadingProduct = false.obs;
//   getProduct({String? type, int? offset, int? limit, int? categoryIds}) async {
//     isLoadingProduct.value = true;
//     productList.clear();
//     categoryId = categoryIds;
//     Map<String, dynamic>? queryParameters = {
//       "product_type": type,
//       "offset": offset,
//       "limit": limit ?? 800,
//       "category_ids": categoryIds
//     };
//     try {
//       var res =
//           await Dio().get(URLS.products, queryParameters: queryParameters);
//       if (res.statusCode == 200) {
//         productList.assignAll((res.data["products"] as List)
//             .map((e) => ProductModel.fromJson(e))
//             .toList());
//         mainProductList.assignAll((res.data["products"] as List)
//             .map((e) => ProductModel.fromJson(e))
//             .toList());

//         /// Save fetched posts to Hive for future use
//         // await MyHive.saveAllProducts(productList);

//         isLoadingProduct.value = false;
//       }
//       // kLogger.e(productList.length);
//     } catch (e) {
//       kLogger.e('Error from %%%% get categori %%%% => $e');
//     }
//   }

//   //** find product categoryId**
//   findProductsByCategoryId(String categoryId) {
//     productList.assignAll(mainProductList
//         .where((product) => product.categoryIds
//             .expand((category) => [category.id])
//             .contains(categoryId))
//         .toList());
//   }

//   @override
//   void onInit() {
//     getCategory();
//     getProduct();
//     super.onInit();
//   }
// }
