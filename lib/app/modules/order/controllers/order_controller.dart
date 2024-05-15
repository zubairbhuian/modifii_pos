import 'package:dio/dio.dart';
import 'package:flutter_base/app/modules/order/models/category_model.dart';
import 'package:flutter_base/app/modules/order/models/product_model.dart';
import 'package:flutter_base/app/utils/logger.dart';
import 'package:flutter_base/app/utils/urls.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
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
      "limit": limit ?? 200,
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

  RxInt selectedTableIndex = (-1).obs;
  void updateSelectedTableIndex(int value) {
    selectedTableIndex.value = value;
  }

  @override
  void onInit() {
    getCategory();
    getProduct();
    super.onInit();
  }
}
