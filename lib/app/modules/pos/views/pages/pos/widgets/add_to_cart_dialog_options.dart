import 'package:flutter/material.dart';
import 'package:flutter_base/app/modules/pos/controllers/pos_controller.dart';
import 'package:flutter_base/app/modules/pos/models/product_model.dart';
import 'package:flutter_base/app/widgets/custom_btn.dart';
import 'package:flutter_base/app/widgets/custom_textfield.dart';
import 'package:flutter_base/app/widgets/my_custom_text.dart';
import 'package:get/get.dart';

import '../../../../../../widgets/popup_dialogs.dart';
import '../../../../models/order_place_model.dart';

class AddToCartDialogOptions extends StatelessWidget {
  final ProductModel item;

  const AddToCartDialogOptions({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PosController>(builder: (c) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //item name & price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyCustomText(
                item.name,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              MyCustomText(
                '\$${item.price}',
                fontSize: 20,
                fontWeight: FontWeight.w700,
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
          MyCustomText(
            item.description == '' ? 'N/A' : item.description,
            fontSize: 14,
          ),
          const SizedBox(height: 14),
          //kitchen note
          MyCustomText(
            'Kitchen Note',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).hintColor,
          ),
          const SizedBox(height: 4),
          const CustomTextField(
            maxLines: 2,
            isFilled: true,
          ),
          const SizedBox(height: 14),
          //order types
          Row(
            children: [
              Expanded(
                child: PrimaryBtn(
                  onPressed: () {
                    c.toggleOrderTypeSelection(isTogo: true);
                  },
                  text: 'TO GO',
                  isOutline: true,
                  color: c.isTogoSelected
                      ? Theme.of(context).primaryColorLight
                      : Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: PrimaryBtn(
                  onPressed: () {
                    c.toggleOrderTypeSelection(isDontMake: true);
                  },
                  text: "DON'T MAKE",
                  isOutline: true,
                  color: c.isDontMakeSelected
                      ? Theme.of(context).primaryColorLight
                      : Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: PrimaryBtn(
                  onPressed: () {
                    c.toggleOrderTypeSelection(isRush: true);
                  },
                  text: 'RUSH',
                  isOutline: true,
                  color: c.isRushSelected
                      ? Theme.of(context).primaryColorLight
                      : Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          //order types 2
          Row(
            children: List.generate(
              c.orderTypes2.length,
              (index) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: PrimaryBtn(
                    onPressed: () {
                      c.setSelectedOrderTypesIndex2(index);
                    },
                    text: c.orderTypes2[index],
                    isOutline: true,
                    color: c.selectedOrderTypesIndex2 == index
                        ? Theme.of(context).primaryColorLight
                        : Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          //order modifiers
          Visibility(
            visible: !c.isDrink,
            child: Row(
              children: List.generate(
                c.orderModifiers.length,
                (index) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: PrimaryBtn(
                      onPressed: () {
                        c.setSelectedOrderModifiersIndex(index);
                      },
                      text: c.orderModifiers[index],
                      isOutline: true,
                      color: c.selectedOrderModifiersIndex == index
                          ? Theme.of(context).primaryColorLight
                          : Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ),
              ),
            ),
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
                        c.updateOrderQuantity(false, item.price.toDouble());
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
                        c.updateOrderQuantity(true, item.price.toDouble());
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
            child: PrimaryBtn(
              onPressed: () {
                Cart order = Cart(
                  id: item.id.toString(),
                  name: item.name,
                  description: item.description,
                  type: item.productType,
                  price: item.price,
                  quantity: c.orderQuantity,
                );

                //** Add item **
                c.onAddCartItem(order);
                Get.back();
                PopupDialog.showSuccessDialog("Cart Items Added Successfully");
              },
              text: 'ADD',
              textMaxSize: 22,
              textMinSize: 18,
              textColor: Colors.white,
            ),
          ),
        ],
      );
    });
  }
}
