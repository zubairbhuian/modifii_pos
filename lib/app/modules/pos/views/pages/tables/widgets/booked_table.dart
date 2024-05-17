import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/app/modules/pos/views/pages/tables/widgets/split_order.dart';
import 'package:flutter_base/app/utils/static_colors.dart';
import 'package:flutter_base/app/widgets/custom_btn.dart';
import 'package:flutter_base/app/widgets/my_custom_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../../widgets/custom_alert_dialog.dart';
import '../../../../controllers/tables_controller.dart';

class BookedTableOption extends StatelessWidget {
  const BookedTableOption({
    super.key,
    required this.controller,
  });

  final TablesController controller;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    bool smallHeight = MediaQuery.sizeOf(context).height < 700;
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(color: StaticColors.greenColor),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //Top Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _columnText('Order', '#10004A'),
              _columnText('Server', 'User01'),
              _columnText('Guests', '3'),
              _columnText('Status', 'Confimed'),
              _columnText('Customer', 'Walk-In\nCustomer'),
            ],
          ),
          SizedBox(height: smallHeight ? 0 : 14),
          //Buttons Row
          GetBuilder<TablesController>(builder: (c) {
            return Row(
              children: [
                Expanded(
                  child: PrimaryBtn(
                    onPressed: () {
                      _bookedTableOptionsDialog(context, isGotoOrder: true);
                    },
                    color: StaticColors.greenColor,
                    textColor: Colors.white,
                    text: 'Go to Order',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: PrimaryBtn(
                    onPressed: () {
                      _bookedTableOptionsDialog(context, isAddItem: true);
                    },
                    color: StaticColors.orangeColor,
                    textColor: Colors.white,
                    text: 'Add Items',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: PrimaryBtn(
                    onPressed: () {
                      _bookedTableOptionsDialog(context, isPrintCheck: true);
                    },
                    color: StaticColors.blueLightColor,
                    textColor: Colors.white,
                    text: 'Print Check',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: PrimaryBtn(
                    onPressed: () {
                      // c.setSelectedBookedTableOption(index);
                      _bookedTableOptionsDialog(context, isSplitOrder: true);
                    },
                    color: StaticColors.purpleColor,
                    textColor: Colors.white,
                    text: 'Split Order',
                  ),
                ),
              ],
            );
          }),
          SizedBox(height: smallHeight ? 0 : 14),
          const Divider(),
          //Items List
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 1, child: MyCustomText('SL.')),
              Expanded(flex: 4, child: MyCustomText('Items')),
              Expanded(flex: 1, child: MyCustomText('Qty')),
              Expanded(flex: 1, child: MyCustomText('Price')),
            ],
          ),
          const Divider(),
          const SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  8,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: MyCustomText('${index + 1}'),
                        ),
                        const Expanded(
                          flex: 4,
                          child: Row(
                            children: [
                              AutoSizeText(
                                'Chicken Tikka',
                                maxFontSize: 16,
                                minFontSize: 10,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              AutoSizeText(
                                ' (Heat: Medium)',
                                maxFontSize: 14,
                                minFontSize: 10,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: MyCustomText('1'),
                        ),
                        const Expanded(
                          flex: 1,
                          child: MyCustomText('\$ 16.99'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          //Amounts
          const Divider(),
          _row(theme, title: "Subtotal :", value: "\$00"),
          _row(theme, title: "GST 5% :", value: "\$00"),
          const Divider(),
          _row(theme, title: "Total :", value: "\$00", fontSize: 20),
          SizedBox(height: smallHeight ? 0 : 14),
          PrimaryBtn(
            onPressed: () {},
            height: 48,
            text: 'Pay',
            width: double.infinity,
            textColor: Colors.white,
            color: StaticColors.greenColor,
          ),
        ],
      ),
    );
  }

  Expanded _columnText(String label, String value) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyCustomText(label),
            MyCustomText(
              value,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}

// row
Widget _row(ThemeData theme,
    {double? fontSize, required String title, required String value}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
    child: Row(
      children: [
        Expanded(
            child: Text(
          title,
          style: theme.textTheme.titleSmall
              ?.copyWith(fontSize: fontSize ?? 16, fontWeight: FontWeight.w700),
        )),
        Text(
          value,
          style: theme.textTheme.titleSmall
              ?.copyWith(fontSize: fontSize ?? 16, fontWeight: FontWeight.w700),
        ),
      ],
    ),
  );
}

//Alert Dialog for booking buttons
void _bookedTableOptionsDialog(
  BuildContext context, {
  bool isGotoOrder = false,
  bool isAddItem = false,
  bool isPrintCheck = false,
  bool isSplitOrder = false,
}) {
  if (isSplitOrder) {
    return customAlertDialog(
      context: context,
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Stack(
          alignment: Alignment.topRight,
          clipBehavior: Clip.none,
          children: [
            const SplitOrder(),
            IconButton(
              onPressed: Get.back,
              icon: const Icon(
                FontAwesomeIcons.circleXmark,
                color: Colors.redAccent,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
  return customAlertDialog(
    context: context,
    child: const Center(
      child: Icon(Icons.warning, color: Colors.amber),
    ),
  );
}
