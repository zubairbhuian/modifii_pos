import 'package:flutter/material.dart';
import 'package:flutter_base/app/widgets/custom_btn.dart';
import 'package:flutter_base/app/widgets/my_custom_text.dart';
import 'package:get/get.dart';
import '../../../../../../utils/static_colors.dart';
import '../../../../controllers/tables_controller.dart';

class SplitOrder extends GetView<TablesController> {
  const SplitOrder({super.key});
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.85,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(color: StaticColors.greenColor),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: 250,
              color: Colors.white,
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyCustomText('Order: #123123',
                          fontWeight: FontWeight.w500),
                      MyCustomText('Type: Dine-In',
                          fontWeight: FontWeight.w500),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          8,
                          (index) => const ItemTile(),
                        ),
                      ),
                    ),
                  ),
                  _row(theme,
                      title: "Subtotal :",
                      value: "\$00",
                      fontWeight: FontWeight.w500),
                  _row(theme,
                      title: "GST 5% :",
                      value: "\$00",
                      fontWeight: FontWeight.w500),
                  _row(theme, title: "Total :", value: "\$00", fontSize: 18),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          //Buttons
          SizedBox(
            width: 250,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: PrimaryBtn(
                        onPressed: () {
                          controller.setSelectedBookedTableOption(null);
                        },
                        text: 'CREATE NEW ORDER',
                        textColor: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: PrimaryBtn(
                        onPressed: () {
                          controller.setSelectedBookedTableOption(null);
                        },
                        text: 'PRINT CHECK',
                        textColor: Colors.white,
                        color: StaticColors.blueLightColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                PrimaryBtn(
                  onPressed: () {
                    controller.setSelectedBookedTableOption(null);
                  },
                  width: double.infinity,
                  text: 'GO TO ORDER',
                  textColor: Colors.white,
                  color: StaticColors.pinkColor,
                ),
                const SizedBox(height: 8),
                PrimaryBtn(
                  onPressed: () {},
                  width: double.infinity,
                  text: 'PAY',
                  textColor: Colors.white,
                  color: StaticColors.greenColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// row
Widget _row(ThemeData theme,
    {double? fontSize,
    FontWeight? fontWeight,
    required String title,
    required String value}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: theme.textTheme.titleSmall?.copyWith(
            fontSize: fontSize ?? 14,
            fontWeight: fontWeight ?? FontWeight.w700),
      ),
      Text(
        value,
        style: theme.textTheme.titleSmall?.copyWith(
            fontSize: fontSize ?? 14,
            fontWeight: fontWeight ?? FontWeight.w700),
      ),
    ],
  );
}

class ItemTile extends StatelessWidget {
  const ItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38, width: 0.15),
      ),
      child: const Row(
        children: [
          Expanded(flex: 4, child: MyCustomText('Item Name')),
          Expanded(flex: 1, child: MyCustomText('x1')),
          Expanded(flex: 1, child: MyCustomText('\$999')),
        ],
      ),
    );
  }
}
