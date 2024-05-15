import 'package:flutter_base/app/modules/order/controllers/order_controller.dart';
import 'package:flutter_base/app/services/base/api_service.dart';
import 'package:flutter_base/app/services/controller/base_controller.dart';
import 'package:flutter_base/app/services/controller/config_controller.dart';
import 'package:get/get.dart';

class BaseBinding extends Bindings {


  final ApiService apiService;

  BaseBinding({required this.apiService});

  @override
  void dependencies() {
        Get.put(
      BaseController(apiService: apiService),
    );
    Get.put(ConfigController());
    Get.put(OrderController());
  }
}
