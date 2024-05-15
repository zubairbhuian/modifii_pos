import 'package:flutter/material.dart';
import 'package:flutter_base/app/modules/order/controllers/tables_controller.dart';
import 'package:flutter_base/app/utils/static_colors.dart';
import 'package:flutter_base/app/widgets/custom_btn.dart';
import 'package:flutter_base/app/widgets/my_custom_text.dart';

class BookedTableOption extends StatelessWidget {
  const BookedTableOption({
    super.key,
    required this.controller,
  });

  final TablesController controller;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(color: StaticColors.greenColor),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _columnText('Order', '#10004A'),
                _columnText('Server', 'UserName'),
                _columnText('Guests', '3'),
                _columnText('Status', 'Confimed'),
                _columnText('Customer', 'Walk-In\nCustomer'),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: PrimaryBtn(
                    onPressed: () {},
                    text: 'Go to Order',
                    textColor: Colors.white,
                    color: StaticColors.greenColor,
                  ),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: PrimaryBtn(
                    onPressed: () {},
                    text: 'Add Items',
                    textColor: Colors.white,
                    color: StaticColors.orangeColor,
                  ),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: PrimaryBtn(
                    onPressed: () {},
                    text: 'Print Check',
                    textColor: Colors.white,
                    color: StaticColors.blueLightColor,
                  ),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: PrimaryBtn(
                    onPressed: () {},
                    text: 'Split Order',
                    textColor: Colors.white,
                    color: StaticColors.purpleColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            const Divider(),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 1, child: MyCustomText('SL.')),
                Expanded(flex: 3, child: MyCustomText('Items')),
                Expanded(flex: 1, child: MyCustomText('Qty')),
                Expanded(flex: 1, child: MyCustomText('Price')),
              ],
            ),
            const Divider(),
            const SizedBox(height: 8),
            Column(
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 1, child: MyCustomText('${index + 1}')),
                      const Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              MyCustomText(
                                'Chicken Tikka',
                                fontWeight: FontWeight.w600,
                              ),
                              MyCustomText(
                                ' (Medium)',
                                fontStyle: FontStyle.italic,
                              ),
                            ],
                          )),
                      const Expanded(flex: 1, child: MyCustomText('1')),
                      const Expanded(flex: 1, child: MyCustomText('\$ 16.99')),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(),
            _row(theme, title: "Subtotal :", value: "\$00"),
            _row(theme, title: "GST 5% :", value: "\$00"),
            const Divider(),
            _row(theme, title: "Total :", value: "\$00", fontSize: 20),
            const SizedBox(height: 12),
            PrimaryBtn(
              onPressed: () {},
              text: 'Pay',
              width: double.infinity,
              textColor: Colors.white,
              color: StaticColors.greenColor,
            ),
          ],
        ),
      ),
    );
  }

  Expanded _columnText(String label, String value) {
    return Expanded(
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
    );
  }
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
