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
      child: GetBuilder<TablesController>(builder: (c) {
        return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: c.orderReceiptsList.length,
            itemBuilder: (context, index) {
              var receipt = c.orderReceiptsList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: 265,
                        color: theme.cardColor,
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
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: theme.colorScheme.background,
                                    width: 0.33,
                                  ),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children:
                                        List.generate(receipt.length, (index) {
                                      var item = receipt[index];
                                      return ItemTile(
                                        onTap: () {
                                          c.toggleOrderItemsListSplit(item);
                                        },
                                        name: item.name,
                                        qnty: item.quantity,
                                        price: item.price,
                                        bgColor:
                                            c.isItemContainsOnSplitList(item)
                                                ? theme.splashColor
                                                : Colors.transparent,
                                      );
                                    }),
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
                            _row(theme,
                                title: "Total :", value: "\$00", fontSize: 18),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    //Buttons
                    SizedBox(
                      width: 265,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: PrimaryBtn(
                                  onPressed: () {
                                    TablesController.to.splitReceipts();
                                  },
                                  text: 'CREATE NEW ORDER',
                                  textColor: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: PrimaryBtn(
                                  onPressed: () {},
                                  text: 'PRINT CHECK',
                                  textColor: Colors.white,
                                  color: StaticColors.blueLightColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          PrimaryBtn(
                            onPressed: () {},
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
            });
      }),
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
  const ItemTile({
    super.key,
    required this.name,
    required this.qnty,
    required this.price,
    this.onTap,
    this.bgColor,
  });

  final String name;
  final int qnty;
  final double price;
  final VoidCallback? onTap;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: Theme.of(context).focusColor, width: 0.15),
        ),
        child: Row(
          children: [
            Expanded(flex: 4, child: MyCustomText(name)),
            Expanded(flex: 1, child: MyCustomText('x$qnty')),
            Expanded(
              flex: 2,
              child: MyCustomText('\$${price.toStringAsFixed(2)}'),
            ),
          ],
        ),
      ),
    );
  }
}
