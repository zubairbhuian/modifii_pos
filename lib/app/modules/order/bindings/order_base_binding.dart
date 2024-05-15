import 'package:get/get.dart';

import '../controllers/order_base_controller.dart';

class OrderBaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderBaseController>(
      () => OrderBaseController(),
    );
  }
}
