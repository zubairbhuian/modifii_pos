import 'package:flutter/material.dart';
import 'package:flutter_base/app/modules/order/controllers/order_controller.dart';
import 'package:flutter_base/app/modules/order/models/category_model.dart';
import 'package:flutter_base/app/utils/my_func.dart';
import 'package:flutter_base/app/widgets/custom_btn.dart';
import 'package:get/get.dart';

class CategoryBody extends GetView<OrderController> {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return _body(theme);
  }
  //** Body **
  Widget _body(ThemeData theme) {
    return SingleChildScrollView(
      child: Obx(() {
        List<CategoryModel> veg = controller.categoryList
            .where((value) => value.type == 'veg')
            .toList();
        List<CategoryModel> nonVeg = controller.categoryList
            .where((value) => value.type == 'non_veg')
            .toList();
        List<CategoryModel> drinks = controller.categoryList
            .where((value) => value.type == 'drinks')
            .toList();
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _categoryBtn(theme, veg),
            const SizedBox(width: 20),
            _categoryBtn(theme, nonVeg),
            const SizedBox(width: 20),
            _categoryBtn(theme, drinks),
          ],
        );
      }),
    );
  }

  Widget _categoryBtn(ThemeData theme, List<CategoryModel> data) => Expanded(
          child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) => PrimaryBtn(
          onPressed: () {
            controller.findProductsByCategoryId(
                data[index].id.toString());
          },
          color: MyFunc.productColor(data[index].type),
          style: theme.textTheme.titleLarge?.copyWith(color: Colors.white),
          text: controller.categoryList[index].name,
        ).marginOnly(bottom: 20),
      ));
}
