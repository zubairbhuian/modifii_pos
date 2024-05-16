import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_base/app/utils/static_colors.dart';
import 'package:flutter_base/app/widgets/custom_btn.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../../widgets/my_custom_text.dart';
import '../controllers/pos_controller.dart';

class TablesOption extends GetView<PosController> {
  const TablesOption({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TableAvailabilityHeader(),
          const SizedBox(height: 12.0),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 3,
                  child: TableBody(),
                ),
                const SizedBox(width: 80),
                Expanded(
                  flex: 2,
                  child: Obx(() => Visibility(
                        visible: controller
                            .tablesList[controller.selectedTableIndex.value]
                            .isBooked,
                        replacement:
                            AvailableTableOption(controller: controller),
                        child: BookedTableOption(controller: controller),
                      )),
                ),
                // cart area
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AvailableTableOption extends StatelessWidget {
  const AvailableTableOption({
    super.key,
    required this.controller,
  });

  final PosController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(color: StaticColors.greenColor),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyCustomText(
            'Table ${controller.selectedTableIndex.value + 1}',
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              PrimaryBtn(
                onPressed: () {},
                width: 150,
                text: 'Start Order',
                textColor: Colors.white,
                color: StaticColors.orangeColor,
              ),
              const SizedBox(width: 30),
              PrimaryBtn(
                onPressed: () {},
                width: 150,
                text: 'Hold Table',
                textColor: Colors.white,
                color: StaticColors.pinkColor,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BookedTableOption extends StatelessWidget {
  const BookedTableOption({
    super.key,
    required this.controller,
  });

  final PosController controller;

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

class TableBody extends GetView<PosController> {
  const TableBody({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return _body(theme);
  }

  //** Body **
  Widget _body(ThemeData theme) {
    return SingleChildScrollView(
      child: Obx(() {
        return StaggeredGrid.count(
          crossAxisCount: 7,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          children: List.generate(
            controller.tablesList.length,
            (index) => Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: controller.selectedTableIndex.value == index
                    ? StaticColors.blueLightColor
                    : Colors.transparent,
              ),
              child: PrimaryBtn(
                onPressed: () {
                  controller.updateSelectedTableIndex(index);
                },
                height: 75,
                width: 75,
                color: controller.tablesList[index].isBooked
                    ? StaticColors.yellowColor
                    : StaticColors.greenColor,
                style:
                    theme.textTheme.titleLarge?.copyWith(color: Colors.white),
                text: controller.tablesList[index].tableNo,
              ),
            ),
          ),
        );
      }),
    );
  }
}

class TableAvailabilityHeader extends StatelessWidget {
  const TableAvailabilityHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        MyCustomText(
          ' Table Availability',
          fontWeight: FontWeight.w500,
        ),
        SizedBox(width: 10.0),
        ColorTextRow(
          color: StaticColors.greenColor,
          text: 'Available',
        ),
        ColorTextRow(
          color: StaticColors.yellowColor,
          text: 'Walk-In Booking',
        ),
        ColorTextRow(
          color: StaticColors.orangeColor,
          text: 'Cooking/Serving',
        ),
        ColorTextRow(
          color: StaticColors.blueColor,
          text: 'Online Booking',
        ),
        ColorTextRow(
          color: StaticColors.purpleColor,
          text: 'Combined Tables',
        ),
        ColorTextRow(
          color: StaticColors.pinkColor,
          text: 'Hold Tables',
        ),
      ],
    );
  }
}

class ColorTextRow extends StatelessWidget {
  const ColorTextRow({
    super.key,
    required this.color,
    required this.text,
  });

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 8,
            backgroundColor: color,
          ),
          const SizedBox(width: 3.0),
          MyCustomText(
            text,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
