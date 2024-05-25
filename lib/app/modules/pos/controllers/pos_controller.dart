import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/app/modules/pos/models/category_model.dart';
import 'package:flutter_base/app/modules/pos/models/order_place_model.dart';
import 'package:flutter_base/app/modules/pos/models/product_model.dart';
import 'package:flutter_base/app/utils/logger.dart';
import 'package:flutter_base/app/utils/urls.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class PosController extends GetxController {
  static PosController get to => Get.find();

  //** change page **
  PageController pageController = PageController();
  RxBool isShowPos = false.obs;
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

  //** Get all product **
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
  void toggleOrderTypeSelection({
    bool isTogo = false,
    bool isDontMake = false,
    bool isRush = false,
  }) {
    if (isTogo) {
      isTogoSelected = !isTogoSelected;
    }
    if (isDontMake) {
      isDontMakeSelected = !isDontMakeSelected;
    }
    if (isRush) {
      isRushSelected = !isRushSelected;
    }
    update();
  }

  bool isDrink = true;
  void checkIsDrink(String productType) {
    isDrink = productType == 'drinks';
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

  //** Order Process **
  // **======+=======**
  //** Order Process **

  List<Cart> cartList = <Cart>[];
  OrderPlaceModel orderPlaceModel = OrderPlaceModel();

  //** Add cart item  **
  onAddCartItem(Cart item) {
    cartList.add(item);
    update();
  }

  //** Remove cart item with index **
  onRemoveCartItemWithIndex(int index) {
    // Check if the index is within bounds
    if (index >= 0 && index < cartList.length) {
      cartList.removeAt(index);
    }
    update();
  }

  //** Quantity Update **
  void quantityUpdateWithCartListIndex(int index, {required bool isIncriment}) {
    if (cartList[index].quantity < 10 && isIncriment) {
      cartList[index].quantity = cartList[index].quantity + 1;
    } else if (cartList[index].quantity > 1 && !isIncriment) {
      cartList[index].quantity = cartList[index].quantity - 1;
    }
    update();
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
