import 'package:flutter/material.dart';
import 'package:flutter_base/app/modules/pos/controllers/tables_controller.dart';
import 'package:flutter_base/app/utils/static_colors.dart';
import 'package:flutter_base/app/widgets/custom_btn.dart';
import 'package:flutter_base/app/widgets/my_custom_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../../widgets/custom_textfield.dart';

class TableOrderPage extends GetView<TablesController> {
  const TableOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const MyCustomText(
            'All Table Orders         33',
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
          const SizedBox(height: 48.0),
          _dateRange(context),
          const SizedBox(height: 48.0),
          _overviews(),
          const SizedBox(height: 48.0),
          _searchAndExportRow(),
          const SizedBox(height: 48.0),
          _orderTable(theme),
        ],
      ),
    );
  }

  Widget _orderTable(ThemeData theme) {
    const double titleFontSize = 16;
    const double contentFontSize = 14;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.symmetric(
              horizontal: BorderSide(
                width: 2,
                color: theme.colorScheme.background,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
          margin: const EdgeInsets.only(bottom: 28),
          child: const Row(
            children: [
              Expanded(
                  child: MyCustomText(
                'SL',
                fontSize: titleFontSize,
                fontWeight: FontWeight.w600,
              )),
              SizedBox(width: 4.0),
              Expanded(
                  child: MyCustomText(
                'Table No.',
                fontSize: titleFontSize,
                fontWeight: FontWeight.w600,
              )),
              SizedBox(width: 4.0),
              Expanded(
                  flex: 2,
                  child: MyCustomText(
                    'User Name',
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(width: 4.0),
              Expanded(
                  child: MyCustomText(
                'Auth Code',
                fontSize: titleFontSize,
                fontWeight: FontWeight.w600,
              )),
              SizedBox(width: 4.0),
              Expanded(
                  child: MyCustomText(
                'Order ID',
                fontSize: titleFontSize,
                fontWeight: FontWeight.w600,
              )),
              SizedBox(width: 4.0),
              Expanded(
                  flex: 2,
                  child: MyCustomText(
                    'Order Date',
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(width: 4.0),
              Expanded(
                  child: MyCustomText(
                'Order Type',
                fontSize: titleFontSize,
                fontWeight: FontWeight.w600,
              )),
              SizedBox(width: 4.0),
              Expanded(
                  child: MyCustomText(
                'Order Status',
                fontSize: titleFontSize,
                fontWeight: FontWeight.w600,
              )),
              SizedBox(width: 4.0),
              Expanded(
                  child: MyCustomText(
                'Total Amount',
                fontSize: titleFontSize,
                fontWeight: FontWeight.w600,
              )),
              SizedBox(width: 4.0),
              Expanded(
                  child: MyCustomText(
                'Actions',
                fontSize: titleFontSize,
                fontWeight: FontWeight.w600,
              )),
            ],
          ),
        ),
        ...List.generate(
          8,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                    child: MyCustomText(
                  '1',
                  fontSize: contentFontSize,
                )),
                const SizedBox(width: 4.0),
                const Expanded(
                    child: MyCustomText(
                  '23',
                  fontSize: contentFontSize,
                )),
                const SizedBox(width: 4.0),
                const Expanded(
                    flex: 2,
                    child: MyCustomText(
                      'User Name',
                      fontSize: contentFontSize,
                    )),
                const SizedBox(width: 4.0),
                const Expanded(
                    child: MyCustomText(
                  'Asadf333',
                  fontSize: contentFontSize,
                )),
                const SizedBox(width: 4.0),
                const Expanded(
                    child: MyCustomText(
                  '100234',
                  fontSize: contentFontSize,
                )),
                const SizedBox(width: 4.0),
                const Expanded(
                    flex: 2,
                    child: MyCustomText(
                      'May 25, 2024 09:00PM',
                      fontSize: contentFontSize,
                    )),
                const SizedBox(width: 4.0),
                const Expanded(
                    child: MyCustomText(
                  'Dine-In',
                  fontSize: contentFontSize,
                )),
                const SizedBox(width: 4.0),
                const Expanded(
                    child: MyCustomText(
                  'Confirmed',
                  fontSize: contentFontSize,
                )),
                const SizedBox(width: 4.0),
                const Expanded(
                    child: Column(
                  children: [
                    MyCustomText(
                      '\$63,99',
                      fontSize: contentFontSize,
                    ),
                    SizedBox(height: 4.0),
                    MyCustomText(
                      'Paid',
                      fontSize: titleFontSize,
                    ),
                  ],
                )),
                const SizedBox(width: 4.0),
                Expanded(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.eye,
                          size: 18,
                          color: StaticColors.orangeColor,
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.print,
                          size: 18,
                          color: StaticColors.greenColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _searchAndExportRow() {
    return Row(
      children: [
        const Expanded(
          flex: 2,
          child: CustomTextField(
              hintText: 'Search by Order ID, Order Status or Auth Code'),
        ),
        const SizedBox(width: 12.0),
        Expanded(
            child: PrimaryBtn(
          onPressed: () {},
          text: 'Search',
          textColor: Colors.white,
        )),
        const SizedBox(width: 12.0),
        const Expanded(child: SizedBox()),
        const SizedBox(width: 12.0),
        Expanded(
          child: PrimaryBtnWithChild(
            onPressed: () {},
            isOutline: true,
            borderColor: StaticColors.orangeColor,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.download,
                  size: 20,
                  color: StaticColors.orangeColor,
                ),
                SizedBox(width: 14),
                MyCustomText(
                  'Export',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: StaticColors.orangeColor,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _dateRange(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MyCustomText(
          'Select date range',
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 16.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 2,
              child: CustomDropdownTextField(
                label: 'Select Branch',
                hint: MyCustomText('All Branch',
                    color: Theme.of(context).hintColor),
                data: const ["demo"],
                onChanged: (value) {},
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              flex: 2,
              child: CustomTextField(
                controller: controller.startDateTEC,
                extraLabel: 'Start Date',
                hintText: 'dd/mm/yyyy',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.background),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2010, 1),
                    lastDate: DateTime(2050, 12),
                  ).then((date) {
                    if (date != null) {
                      controller.startDateTEC.text =
                          date.toString().split(' ').first;
                      controller.update();
                    }
                  });
                },
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              flex: 2,
              child: CustomTextField(
                controller: controller.endDateTEC,
                extraLabel: 'End Date',
                hintText: 'dd/mm/yyyy',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.background),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2010, 1),
                    lastDate: DateTime(2050, 12),
                  ).then((date) {
                    if (date != null) {
                      controller.endDateTEC.text =
                          date.toString().split(' ').first;
                      controller.update();
                    }
                  });
                },
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              flex: 1,
              child: PrimaryBtn(
                onPressed: () {},
                text: 'Clear',
                color: Colors.white,
                textColor: Colors.black87,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              flex: 1,
              child: PrimaryBtn(
                onPressed: () {},
                text: 'Show Data',
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _overviews() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _labelWithValue(label: 'Confirmed', value: 33),
            const SizedBox(width: 80),
            _labelWithValue(label: 'Cooking', value: 33),
            const SizedBox(width: 80),
            _labelWithValue(label: 'Ready to Serve', value: 33),
          ],
        ),
        const SizedBox(height: 64.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _labelWithValue(label: 'Completed', value: 33),
            const SizedBox(width: 80),
            _labelWithValue(label: 'Canceled', value: 33),
            const SizedBox(width: 80),
            _labelWithValue(label: 'Running', value: 33),
          ],
        ),
      ],
    );
  }

  Widget _labelWithValue({required String label, required int value}) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyCustomText(
            label,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          MyCustomText(
            value.toString(),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}
