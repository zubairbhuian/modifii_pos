import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../../../utils/my_formatter.dart';
import '../../../../../../widgets/custom_btn.dart';
import '../../../../../../widgets/my_custom_text.dart';
import '../../../../controllers/orders_controller.dart';
import '../../../../controllers/tables_controller.dart';
import '../../../../models/dine_in_order_model.dart';

class PrintReceiptOverview extends StatelessWidget {
  const PrintReceiptOverview({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return SingleChildScrollView(
      child: GetBuilder<TablesController>(builder: (c) {
        OrderData? order = c.selectedOrder;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const MyCustomText(
                  'Print Invoice',
                  fontWeight: FontWeight.w600,
                ),
                IconButton(
                    onPressed: Get.back,
                    icon: const Icon(
                      FontAwesomeIcons.xmark,
                      size: 14,
                    ))
              ],
            ),
            GetBuilder<OrdersController>(builder: (c) {
              return Row(
                children: [
                  const Expanded(
                    child: SizedBox(),
                    // child: PrimaryBtn(
                    //     onPressed: () {},
                    //     text: 'Customer Copy',
                    //     textColor: Colors.white),
                  ),
                  const SizedBox(width: 6.0),
                  const Expanded(
                    child: SizedBox(),
                    // child: PrimaryBtn(
                    //     onPressed: () {},
                    //     text: 'Customer Copy',
                    //     textColor: Colors.white),
                  ),
                  const SizedBox(width: 6.0),
                  Expanded(
                    child: PrimaryBtn(
                        onPressed: () async {
                          c.printReceipt();
                        },
                        text: 'Print',
                        textColor: Colors.white),
                  ),
                  const SizedBox(width: 6.0),
                ],
              );
            }),
            Divider(
              color: Colors.grey.shade400,
              height: 30,
            ),
            SvgPicture.asset(
              'assets/images/splash/login_logo.svg',
              height: 100,
            ),
            const MyCustomText(
              '7488 King George Blvd.',
              fontWeight: FontWeight.w600,
              height: 2,
            ),
            const MyCustomText(
              'Unit 350, Surrey, B.C. V3W 0H9',
              fontWeight: FontWeight.w600,
            ),
            MyCustomText(
              'Phone: ${order?.server?.phone}',
              fontWeight: FontWeight.w600,
              height: 3,
            ),
            const Divider(color: Colors.black54),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(child: MyCustomText('Order: #${order?.id}')),
                const SizedBox(width: 10.0),
                Expanded(
                  child: MyCustomText(
                      '${MyFormatter.formatDate(order?.deliveryDate ?? '')};${order?.deliveryTime}'),
                ),
              ],
            ),
            const SizedBox(height: 6.0),
            Row(
              children: [
                Expanded(child: MyCustomText('Server: ${order?.serverName}')),
                const SizedBox(width: 10.0),
                const Expanded(child: MyCustomText('Station: 1')),
              ],
            ),
            const SizedBox(height: 6.0),
            Row(
              children: [
                Expanded(child: MyCustomText('Table: ${order?.tableId}')),
                const SizedBox(width: 10.0),
                const Expanded(child: MyCustomText('Guests: 0')),
              ],
            ),
            const SizedBox(height: 6.0),
            Row(
              children: [
                Expanded(child: MyCustomText('Type: ${order?.orderType}')),
                const SizedBox(width: 10.0),
                const Expanded(child: MyCustomText('')),
              ],
            ),
            const SizedBox(height: 16.0),
            const Row(
              children: [
                Expanded(flex: 1, child: MyCustomText('QTY', fontSize: 18)),
                SizedBox(width: 10.0),
                Expanded(flex: 3, child: MyCustomText('Item', fontSize: 18)),
                SizedBox(width: 10.0),
                Expanded(flex: 1, child: MyCustomText('AMT', fontSize: 18)),
              ],
            ),
            Divider(color: theme.colorScheme.background, height: 25),
            ...List.generate(order?.details?.length ?? 0, (index) {
              var item = order?.details?[index];
              return Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: MyCustomText('${item?.quantity} x', fontSize: 18),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                      flex: 3,
                      child: MyCustomText(
                          item?.productDetails?.name.toString() ?? '',
                          fontSize: 18)),
                  const SizedBox(width: 10.0),
                  const Expanded(
                      flex: 1, child: MyCustomText('00', fontSize: 18)),
                ],
              );
            }),
            Divider(color: theme.colorScheme.background, height: 25),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const MyCustomText('Sub total'),
                const SizedBox(width: 10.0),
                MyCustomText('\$${order?.orderAmount}'),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const MyCustomText('GST 5%'),
                const SizedBox(width: 10.0),
                MyCustomText('\$${order?.totalTaxAmount}'),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const MyCustomText('Tip'),
                const SizedBox(width: 10.0),
                MyCustomText('\$${order?.tipAmount}'),
              ],
            ),
            const SizedBox(height: 10.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyCustomText('Total (PAID)', fontSize: 20),
                SizedBox(width: 10.0),
                MyCustomText('\$0000', fontSize: 20),
              ],
            ),
            const SizedBox(height: 14.0),
            Divider(color: theme.colorScheme.background, height: 20),
            const MyCustomText(
              'Customer Copy',
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            const SizedBox(height: 4.0),
            const MyCustomText(
              'Visa Credit Card Sale',
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            Divider(color: theme.colorScheme.background, height: 20),
            const MyCustomText(
              'Thank you for visiting HAVELI BISTRO',
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            Divider(color: theme.colorScheme.background, height: 20),
            const MyCustomText(
              'Please review us on Google',
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            Divider(color: theme.colorScheme.background, height: 20),
            const MyCustomText(
              'GST NUMBER: GST 717783914 RT0001',
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ],
        );
      }),
    );
  }
}
