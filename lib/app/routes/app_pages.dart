import 'package:flutter_base/app/modules/order/bindings/bar_binding.dart';
import 'package:flutter_base/app/modules/order/bindings/tables_binding.dart';
import 'package:get/get.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/entryPoint/bindings/entry_point_binding.dart';
import '../modules/entryPoint/views/entry_point_view.dart';
import '../modules/order/bindings/order_base_binding.dart';
import '../modules/order/bindings/order_binding.dart';
import '../modules/order/views/order_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTH;

  static final routes = [
    GetPage(
      name: _Paths.ENTRY_POINT,
      page: () => const EntryPointView(),
      binding: EntryPointBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => const OrderView(),
      bindings: [
        OrderBaseBinding(),
        OrderBinding(),
        TablesBinding(),
        BarBinding(),
      ],
    ),
  ];
}
