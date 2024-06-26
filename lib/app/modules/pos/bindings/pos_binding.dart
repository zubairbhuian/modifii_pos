import 'package:flutter_base/app/modules/pos/controllers/tables_controller.dart';
import 'package:get/get.dart';

import '../controllers/pos_controller.dart';

class PosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PosController>(() => PosController());
    Get.lazyPut<TablesController>(() => TablesController());
  }
}
