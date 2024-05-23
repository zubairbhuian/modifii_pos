import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_base/app/modules/pos/controllers/pos_controller.dart';
import 'package:flutter_base/app/modules/pos/widgets/add_to_cart_dialog_options.dart';
import 'package:flutter_base/app/modules/pos/widgets/variations_card.dart';
import 'package:flutter_base/app/widgets/custom_btn.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../utils/static_colors.dart';
import '../../../widgets/custom_alert_dialog.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/my_custom_text.dart';
import '../models/product_model.dart';

class ProductBody extends GetView<PosController> {
  const ProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return _body(theme, context);
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
  Widget _body(ThemeData theme, BuildContext context) {
    return SingleChildScrollView(child: Obx(() {
      return StaggeredGrid.count(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: List.generate(controller.productList.length, (index) {
          var item = controller.productList[index];
          return PrimaryBtn(
            onPressed: () {
              controller.orderTotalPrice = item.price.toDouble();
              controller.orderQuantity = 1;
              // Logger().e(item.variations.first.values.first.optionPrice);
              customAlertDialog(
                context: context,
                child: AddToCartDialogOptions(item: item),
              );
            },
            isOutline: true,
            text: item.name,
          );
        }),
      );
    }));
  }


}
