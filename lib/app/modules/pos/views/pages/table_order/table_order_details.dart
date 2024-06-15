import 'package:flutter/material.dart';
import 'package:flutter_base/app/modules/pos/controllers/tables_controller.dart';
import 'package:flutter_base/app/utils/my_formatter.dart';
import 'package:flutter_base/app/utils/static_colors.dart';
import 'package:flutter_base/app/widgets/custom_btn.dart';
import 'package:flutter_base/app/widgets/my_custom_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../../widgets/custom_alert_dialog.dart';
import '../../../models/dine_in_order_model.dart';
import 'widgets/print_receipt_overview.dart';

class TableOrderDetails extends StatelessWidget {
  const TableOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SingleChildScrollView(
      child: GetBuilder<TablesController>(builder: (c) {
        OrderData? order = c.selectedOrder;
        return Column(
          children: [
            _overviewRow(order),
            const SizedBox(height: 18),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: theme.colorScheme.background),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14.0),
                          child: Row(
                            children: [
                              _dateTimeAuth(order),
                              const Spacer(),
                              const SizedBox(width: 12),
                              PrimaryBtn(
                                onPressed: () {
                                  customAlertDialog(
                                    contentPadding: const EdgeInsets.all(12),
                                    context: context,
                                    child: const PrintReceiptOverview(),
                                  );
                                },
                                text: 'Print Check',
                                color: StaticColors.blueLightColor,
                                textColor: Colors.white,
                              ),
                              const SizedBox(width: 12),
                              PrimaryBtn(
                                width: 250,
                                onPressed: () {},
                                text: 'Print Items for Kitchen/Bar',
                                color: StaticColors.greenColor,
                                textColor: Colors.white,
                              ),
                              const SizedBox(width: 12),
                              PrimaryBtn(
                                onPressed: () {},
                                text: 'Discount',
                                color: StaticColors.blueColor,
                                textColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        _itemsListTable(order?.details, theme),
                        const SizedBox(height: 22),
                        PrimaryBtn(
                          onPressed: () {},
                          text: 'Split Order',
                          textColor: Colors.white,
                        ),
                        const Divider(height: 50),
                        _prices(order, context),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 18),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: theme.colorScheme.background),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Column(
                    children: [
                      MyCustomText('Order setup'),
                      SizedBox(height: 12),
                      MyCustomText('Change Order Status'),
                    ],
                  ),
                ),
              ],
            )
          ],
        );
      }),
    );
  }

  Column _dateTimeAuth(OrderData? order) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.calendar_month, size: 18),
            const SizedBox(width: 6),
            MyCustomText(
                '${MyFormatter.formatDate(order?.deliveryDate ?? '')}  ${order?.deliveryTime}',
                fontWeight: FontWeight.bold),
          ],
        ),
        const SizedBox(height: 8),
        MyCustomText('Authorization Code: ${order?.authorizationCode}',
            fontWeight: FontWeight.bold),
      ],
    );
  }

  Align _prices(OrderData? order, BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.33,
        child: Column(
          children: [
            _amountsRow(label: 'Subtotal', price: 00),
            _amountsRow(label: 'GST', price: order?.totalTaxAmount ?? 0),
            _amountsRow(label: 'Gratuity', price: order?.gratuityAmount ?? 0),
            _amountsRow(label: 'PST', price: order?.pstAmount ?? 0),
            _amountsRow(label: 'Tip', price: order?.tipAmount ?? 0),
            const Divider(height: 30),
            _amountsRow(
              label: 'Total',
              price: order?.orderAmount ?? 0,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }

  Widget _amountsRow({
    required String label,
    required num price,
    FontWeight fontWeight = FontWeight.normal,
    double fontSize = 16,
  }) {
    return Visibility(
      visible: price > 0,
      child: Row(
        children: [
          MyCustomText(
            '$label:',
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),
          const Spacer(),
          MyCustomText(
            '\$$price',
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),
        ],
      ).paddingOnly(bottom: 8),
    );
  }

  Row _overviewRow(OrderData? order) {
    return Row(
      children: [
        MyCustomText('Order: #${order?.id}', fontWeight: FontWeight.bold),
        const SizedBox(width: 28),
        MyCustomText('Item: ${order?.details?.length}',
            fontWeight: FontWeight.bold),
        const SizedBox(width: 28),
        MyCustomText('Table: ${order?.tableId}', fontWeight: FontWeight.bold),
        const SizedBox(width: 28),
        MyCustomText('Guest: ${order?.isGuest}', fontWeight: FontWeight.bold),
        const SizedBox(width: 28),
        MyCustomText('Server: ${order?.serverName}',
            fontWeight: FontWeight.bold),
        const SizedBox(width: 28),
        MyCustomText('Order Type: ${order?.orderType}',
            fontWeight: FontWeight.bold),
        const Spacer(),
        //close order details
        IconButton(
          onPressed: () {
            TablesController.to.updateSelectedOrder(null);
          },
          icon: const Icon(
            FontAwesomeIcons.xmark,
            color: Colors.redAccent,
            size: 24,
          ),
        ),
      ],
    );
  }

  Column _itemsListTable(
      List<OrderProductDetailsModel>? products, ThemeData theme) {
    const double titleFontSize = 16;
    const double contentFontSize = 14;

    //title Row
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
                  flex: 3,
                  child: MyCustomText(
                    'Items',
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(width: 4.0),
              Expanded(
                  child: MyCustomText(
                'Qty',
                fontSize: titleFontSize,
                fontWeight: FontWeight.w600,
              )),
              SizedBox(width: 4.0),
              Expanded(
                  child: MyCustomText(
                'Price',
                fontSize: titleFontSize,
                fontWeight: FontWeight.w600,
              )),
              SizedBox(width: 4.0),
              Expanded(
                  child: MyCustomText(
                'Discount',
                fontSize: titleFontSize,
                fontWeight: FontWeight.w600,
              )),
              SizedBox(width: 4.0),
              Expanded(
                  child: MyCustomText(
                'Tax',
                fontSize: titleFontSize,
                fontWeight: FontWeight.w600,
              )),
              SizedBox(width: 4.0),
              Expanded(
                  child: MyCustomText(
                'Total Price',
                fontSize: titleFontSize,
                fontWeight: FontWeight.w600,
              )),
            ],
          ),
        ),
        ...List.generate(products?.length ?? 0, (index) {
          var item = products?[index];
          return _itemsTableContentRow(
            contentFontSize,
            sl: index + 1,
            name: item?.productDetails!.name ?? '',
            quantity: item?.quantity ?? 0,
            price: item?.price ?? 0,
            discount: item?.discountOnProduct ?? 0,
            tax: item?.taxAmount ?? 0,
            total: 00,
          );
        }),
      ],
    );
  }

  Widget _itemsTableContentRow(
    double fontSize, {
    required int sl,
    required String name,
    required int quantity,
    required double price,
    required num discount,
    required double tax,
    required double total,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Expanded(
              child: MyCustomText(
            sl.toString(),
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          )),
          const SizedBox(width: 4.0),
          Expanded(
              flex: 3,
              child: MyCustomText(
                name,
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
              )),
          const SizedBox(width: 4.0),
          Expanded(
              child: MyCustomText(
            quantity.toString(),
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          )),
          const SizedBox(width: 4.0),
          Expanded(
              child: MyCustomText(
            price.toString(),
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          )),
          const SizedBox(width: 4.0),
          Expanded(
              child: MyCustomText(
            discount.toString(),
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          )),
          const SizedBox(width: 4.0),
          Expanded(
              child: MyCustomText(
            tax.toString(),
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          )),
          const SizedBox(width: 4.0),
          Expanded(
              child: MyCustomText(
            total.toString(),
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          )),
        ],
      ),
    );
  }
}
