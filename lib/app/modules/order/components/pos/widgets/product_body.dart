import 'package:flutter/material.dart';
import 'package:flutter_base/app/modules/order/controllers/order_controller.dart';
import 'package:flutter_base/app/widgets/custom_btn.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class ProductBody extends GetView<OrderController> {
  const ProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return _body(theme);
  }

  //** Header **
  // Widget _header(ThemeData theme) {
  //   return Container(
  //     padding: const EdgeInsets.only(bottom: 20),
  //     decoration: BoxDecoration(
  //         border: Border(bottom: BorderSide(color: theme.dividerColor))),
  //     // height: 115,
  //     width: double.infinity,
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         // search bar
  //         SizedBox(
  //             width: 250,
  //             child: CustomTextField(
  //               hintText: "Search Item",
  //               hintStyle: theme.textTheme.labelLarge?.copyWith(
  //                   fontWeight: FontWeight.w600, color: theme.dividerColor),
  //               style: theme.textTheme.labelLarge?.copyWith(
  //                   fontWeight: FontWeight.w600, color: theme.primaryColorDark),
  //               prefixIcon: Icon(
  //                 IconlyBroken.search,
  //                 color: theme.hintColor,
  //               ),
  //             )),
  //         // 1st
  //         Row(
  //           children: [
  //             PrimaryBtn(
  //               onPressed: () {
  //                 controller.getProduct(
  //                     categoryIds: controller.categoryId, type: "veg");
  //               },
  //               color: StaticColors.greenColor,
  //               child: const Text("Veg"),
  //             ),
  //             const SizedBox(width: 10),
  //             PrimaryBtn(
  //               onPressed: () {
  //                 // controller.getCategory(type: 'drinks');
  //                 controller.getProduct(
  //                     categoryIds: controller.categoryId, type: "non_veg");
  //               },
  //               child: const Text("Non Veg"),
  //             ),
  //           ],
  //         ),
  //         // 2nd
  //         Row(
  //           children: [
  //             PrimaryBtn(
  //               onPressed: () {},
  //               color: StaticColors.blueColor,
  //               child: const Text("Custom Food"),
  //             ),
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

  //** Body **
  Widget _body(ThemeData theme) {
    return SingleChildScrollView(child: Obx(() {
      return StaggeredGrid.count(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: List.generate(
          controller.productList.length,
          (index) => PrimaryBtn(
            onPressed: () {
              controller.toggleShowCart();
            },
            isOutline: true,
            text: controller.productList[index].name,
          ),
        ),
      );
    }));
  }
}
