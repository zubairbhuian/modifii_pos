import 'package:flutter/material.dart';
import 'package:flutter_base/app/modules/pos/views/pages/pos_page.dart';
import 'package:flutter_base/app/modules/pos/views/pages/tables_page.dart';
import 'package:flutter_base/app/modules/pos/widgets/cart_item.dart';
import 'package:flutter_base/app/modules/pos/widgets/category_body.dart';
import 'package:flutter_base/app/modules/pos/widgets/product_body.dart';
import 'package:flutter_base/app/utils/static_colors.dart';
import 'package:flutter_base/app/widgets/appbar.dart';
import 'package:flutter_base/app/widgets/custom_btn.dart';
import 'package:flutter_base/app/widgets/custom_textfield.dart';
import 'package:get/get.dart';
import '../controllers/pos_controller.dart';

class PosView extends GetView<PosController> {
  const PosView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: PageView(
        controller: controller.pageController,
        onPageChanged: (value){},
        children: const [PosPage(),TablesPage(),],),
    );
  }

}
