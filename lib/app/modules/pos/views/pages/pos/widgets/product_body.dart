import 'package:flutter/material.dart';
import 'package:flutter_base/app/modules/pos/controllers/pos_controller.dart';
import 'package:flutter_base/app/widgets/custom_btn.dart';
import 'package:flutter_base/app/widgets/popup_dialogs.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../../models/order_place_model.dart';
import 'add_to_cart_dialog_options.dart';

class ProductBody extends GetView<PosController> {
  const ProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return _body(theme, context);
  }

  //** Body **
  Widget _body(ThemeData theme, BuildContext context) {
    return SingleChildScrollView(child: Obx(() {
      return StaggeredGrid.count(
        crossAxisCount: MediaQuery.sizeOf(context).shortestSide < 900 ? 3 : 4,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: List.generate(controller.productList.length, (index) {
          var item = controller.productList[index];
          return PrimaryBtn(
            onPressed: () {
              controller.orderTotalPrice = item.price.toDouble();
              controller.orderQuantity = 1;
              controller.selectedProductVariationValue = null;
              controller.checkHasVariations(item.variations);
              if (controller.hasVariations) {
                PopupDialog.customDialog(
                    child: AddToCartDialogOptions(item: item));
              } else {
                Cart order = Cart(
                  id: item.id.toString(),
                  name: item.name,
                  description: item.description,
                  type: item.productType,
                  price: item.price,
                  quantity: PosController.to.orderQuantity,
                  isLiquor: item.isLiquor == 1 ? true : false,
                  togo: controller.isTogoSelected ? "TO GO" : '',
                  dontMake: controller.isDontMakeSelected ? "DON'T MAKE" : '',
                  rush: controller.isRushSelected ? "RUSH" : '',
                  serveFirst: controller.selectedOrderTypes2,
                  kitchenNote: controller.kitchenNoteTEC.text,
                );

                //** Add item **
                PosController.to.onAddCartItem(order);
              }
            },
            isOutline: true,
            text: item.name,
          );
          // return Container();
        }),
      );
    }));
  }
}
