import 'package:flutter/material.dart';
import 'package:flutter_base/app/modules/pos/controllers/pos_controller.dart';
import 'package:flutter_base/app/modules/pos/widgets/cart_item.dart';
import 'package:flutter_base/app/modules/pos/views/pages/pos/widgets/category_body.dart';
import 'package:flutter_base/app/modules/pos/views/pages/pos/widgets/product_body.dart';
import 'package:flutter_base/app/utils/static_colors.dart';
import 'package:flutter_base/app/widgets/custom_btn.dart';
import 'package:get/get.dart';
import '../../../../../widgets/custom_loading.dart';
import 'widgets/search_custom_item_row.dart';

class PosPage extends GetView<PosController> {
  const PosPage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              //search row
              const SearchAndCustomItemRow(),
              const SizedBox(height: 12),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // item 1 (Category)
                    const Expanded(child: CategoryBody()),
                    const SizedBox(width: 24),
                    // item 2 (Product)
                    Expanded(
                      child: Obx(
                        () => controller.isLoadingProduct.value
                            ? const CustomLoading()
                            : const ProductBody(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 24),
        // item 3 (Cart)
        Expanded(flex: 1, child: _cartArea(theme)),
        // cart area
      ],
    );
  }

  //** cart **
  Widget _cartArea(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        children: [
          Expanded(
            child: GetBuilder<PosController>(
              builder: (controller) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.cartList.length,
                  itemBuilder: (context, index) {
                    var data = controller.cartList[index];
                    return CartItem(
                      title: data.name ?? "",
                      description: data.description ?? "",
                      amount: data.price * data.quantity,
                      quantity: data.quantity,
                      onDecrement: () {
                        controller.quantityUpdateWithCartListIndex(index,
                            isIncriment: false);
                      },
                      onIncrement: () {
                        controller.quantityUpdateWithCartListIndex(index,
                            isIncriment: true);
                      },
                      onRemove: () {
                        controller.onRemoveCartItemWithIndex(index);
                      },
                    );
                  }),
            ),
          ),
          // amount
          const Divider(),
          _row(theme, title: "Subtotal :", value: "\$00"),
          _row(theme, title: "GST 5% :", value: "\$00"),
          _row(theme, title: "PST 10% :", value: "\$00"),
          const Divider(),
          _row(theme, title: "Total :", value: "\$00", fontSize: 20),
          // order btn
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: PrimaryBtn(
                    onPressed: () {},
                    height: 48,
                    color: StaticColors.greenColor,
                    textColor: Colors.white,
                    text: 'Place Order',
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: PrimaryBtn(
                    onPressed: () {},
                    height: 48,
                    color: theme.colorScheme.error,
                    textColor: Colors.white,
                    text: 'Cancel',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // row
  Widget _row(ThemeData theme,
      {double? fontSize, required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      child: Row(
        children: [
          Expanded(
              child: Text(
            title,
            style: theme.textTheme.titleSmall?.copyWith(
                fontSize: fontSize ?? 16, fontWeight: FontWeight.w700),
          )),
          Text(
            value,
            style: theme.textTheme.titleSmall?.copyWith(
                fontSize: fontSize ?? 16, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
