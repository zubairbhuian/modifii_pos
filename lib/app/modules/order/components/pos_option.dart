import 'package:flutter/material.dart';
import 'package:flutter_base/app/modules/order/widgets/cart_item.dart';
import 'package:flutter_base/app/modules/order/widgets/category_body.dart';
import 'package:flutter_base/app/modules/order/widgets/product_body.dart';
import 'package:flutter_base/app/utils/static_colors.dart';
import 'package:flutter_base/app/widgets/custom_btn.dart';
import 'package:flutter_base/app/widgets/custom_textfield.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_loading.dart';
import '../controllers/order_controller.dart';

class PosOption extends GetView<OrderController> {
  const PosOption({super.key});
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(child: CategoryBody()),
          const SizedBox(width: 24),
          Expanded(
            child: Obx(
              () => controller.isLoadingProduct.value
                  ? const CustomLoading()
                  : const ProductBody(),
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Obx(
              () => controller.isShowCart.value
                  ? _cartArea(theme)
                  : const SizedBox(),
            ),
          ),
          // cart area
        ],
      ),
    );
  }

  //** cart **
  Widget _cartArea(ThemeData theme) {
    return Container(
      // height: double.infinity,
      color: theme.cardColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // add customer
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: CustomDropdownTextField(
                              hint: const Text('Search Customer'),
                              data: const ["demo"],
                              onChanged: (value) {})),
                      const SizedBox(width: 16),
                      PrimaryBtn(
                        onPressed: () {},
                        height: 48,
                        width: 48,
                        color: StaticColors.blueColor,
                        text: '+',
                        textColor: Colors.white,
                        textMaxSize: 30,
                        textMinSize: 18,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryBtn(
                      onPressed: () {},
                      color: StaticColors.blueColor,
                      textColor: Colors.white,
                      textMaxSize: 24,
                      textMinSize: 16,
                      text: 'Take Out',
                    ),
                  ),
                ],
              ),
            ),
            // ****  Cart Items ****
            Container(
              // color: const Color(0xfD9D9D9f),
              color: Colors.grey.shade300,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              width: double.infinity,
              child: Text(
                "Cart Items",
                style: theme.textTheme.titleLarge,
              ),
            ),
            Column(
              children: List.generate(
                3,
                (index) => CartItem(
                  title: 'Ralph Edwards',
                  description: 'Add avocado',
                  amount: 89,
                  quantity: 1,
                  onDecrement: () {},
                  onIncrement: () {},
                  onRemove: () {},
                ),
              ),
            ),
            // Expanded(
            //     child: SingleChildScrollView(
            //   child: Column(
            //     children: List.generate(
            //         12,
            //         (index) => CartItem(
            //               title: "Chana samosa ",
            //               description: "Add avocado",
            //               amount: 89,
            //               quantity: 1,
            //               onDecrement: () {},
            //               onIncrement: () {},
            //               onRemove: () {},
            //             )),
            //   ),
            // )),
            // amount
            const Divider(),
            _row(theme, title: "Subtotal :", value: "\$00"),
            _row(theme, title: "GST 5% :", value: "\$00"),
            const Divider(),
            _row(theme, title: "Total :", value: "\$00", fontSize: 20),
            // order btn
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: PrimaryBtn(
                      onPressed: () {},
                      color: StaticColors.greenColor,
                      textColor: Colors.white,
                      text: 'Place Order',
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: PrimaryBtn(
                      onPressed: () {},
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
      ),
    );
  }

  // row
  Widget _row(ThemeData theme,
      {double? fontSize, required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
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
