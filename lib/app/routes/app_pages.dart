import 'package:get/get.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/entryPoint/bindings/entry_point_binding.dart';
import '../modules/entryPoint/views/entry_point_view.dart';
import '../modules/pos/bindings/pos_binding.dart';
import '../modules/pos/views/pos_view.dart';
import '../modules/tables/bindings/tables_binding.dart';
import '../modules/tables/views/tables_view.dart';

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
      name: _Paths.POS,
      page: () => const PosView(),
      binding: PosBinding(),
    ),
    GetPage(
      name: _Paths.TABLES,
      page: () => const TablesView(),
      binding: TablesBinding(),
    ),
  ];
}
