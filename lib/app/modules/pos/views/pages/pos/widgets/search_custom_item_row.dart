import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../widgets/custom_alert_dialog.dart';
import '../../../../../../widgets/custom_btn.dart';
import '../../../../../../widgets/custom_textfield.dart';
import '../../../../../../widgets/my_custom_text.dart';
import '../../../../controllers/pos_controller.dart';

class SearchAndCustomItemRow extends StatelessWidget {
  const SearchAndCustomItemRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 2,
          child: CustomTextField(hintText: 'Search product'),
        ),
        const SizedBox(width: 12.0),
        Expanded(
            child: PrimaryBtn(
          onPressed: () {
            customAlertDialog(
              context: context,
              child: _dialogOptions(context),
            );
          },
          text: 'Custom Food',
          textColor: Colors.white,
        )),
        const SizedBox(width: 12.0),
        Expanded(
            child: PrimaryBtn(
          onPressed: () {
            customAlertDialog(
              context: context,
              child: _dialogOptions(context),
            );
          },
          text: 'Custom Drink',
          textColor: Colors.white,
        )),
        const SizedBox(width: 12.0),
        Expanded(
            child: PrimaryBtn(
          onPressed: () {},
          text: 'Discount',
          textColor: Colors.white,
        )),
      ],
    );
  }

  SizedBox _dialogOptions(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.4,
      child: GetBuilder<PosController>(builder: (c) {
        return Stack(
          alignment: Alignment.topRight,
          clipBehavior: Clip.none,
          children: [
            //close button
            const Positioned(
              top: -35,
              right: -35,
              child: Icon(
                Icons.cancel,
                color: Colors.redAccent,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyCustomText(
                            'Product Name',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).hintColor,
                          ),
                          const SizedBox(height: 4),
                          const CustomTextField(
                            maxLines: 1,
                            isFilled: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyCustomText(
                            'Price',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).hintColor,
                          ),
                          const SizedBox(height: 4),
                          const CustomTextField(
                            maxLines: 1,
                            isFilled: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                //description
                MyCustomText(
                  'Description',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).hintColor,
                ),
                const SizedBox(height: 4),
                const CustomTextField(
                  maxLines: 5,
                  isFilled: true,
                ),
                const SizedBox(height: 14),
                //quantity row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: MyCustomText(
                        'Quantity',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          PrimaryBtnWithChild(
                            onPressed: () {
                              // c.updateOrderQuantity(
                              //     false, item.price.toDouble());
                            },
                            color: Colors.white,
                            width: 48,
                            child: const Icon(
                              Icons.remove,
                              size: 24,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(
                            width: 65,
                            child: Center(
                              child: MyCustomText(
                                c.orderQuantity.toString(),
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          PrimaryBtnWithChild(
                            onPressed: () {
                              // c.updateOrderQuantity(
                              //     true, item.price.toDouble());
                            },
                            color: Colors.white,
                            width: 48,
                            child: const Icon(
                              Icons.add,
                              size: 24,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: MyCustomText(
                          '\$${c.orderTotalPrice.toStringAsFixed(2)}',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                //order button
                Align(
                  alignment: Alignment.bottomCenter,
                  child: PrimaryBtnWithChild(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 28,
                        ),
                        SizedBox(width: 6.0),
                        MyCustomText(
                          'Add',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
