import 'package:flutter/material.dart';
import 'package:flutter_base/app/modules/pos/controllers/pos_controller.dart';
import 'package:flutter_base/app/modules/pos/models/product_model.dart';
import 'package:flutter_base/app/utils/static_colors.dart';
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
          const SizedBox(height: 18),
          //kitchen note

          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MyCustomText(
                      'Kitchen Note',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      controller: c.kitchenNoteTEC,
                      hintText: 'Write a note for kitchen',
                      maxLines: 3,
                      isFilled: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 14),
              //order types 2
              Expanded(
                flex: 2,
                child: Column(
                  children: List.generate(
                    c.orderTypes2.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: _popupPrimaryBtn(
                        onPressed: () {
                          c.setSelectedOrderTypesIndex2(index);
                        },
                        text: c.orderTypes2[index],
                        isSelected: c.selectedOrderTypesIndex2 == index,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),
          //order types
          Row(
            children: [
              Expanded(
                child: _popupPrimaryBtn(
                  onPressed: () {
                    c.toggleOrderTypeSelection(isTogo: true);
                  },
                  text: 'TO GO',
                  isSelected: c.isTogoSelected,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _popupPrimaryBtn(
                  onPressed: () {
                    c.toggleOrderTypeSelection(isDontMake: true);
                  },
                  text: "DON'T MAKE",
                  isSelected: c.isDontMakeSelected,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _popupPrimaryBtn(
                  onPressed: () {
                    c.toggleOrderTypeSelection(isRush: true);
                  },
                  text: 'RUSH',
                  isSelected: c.isRushSelected,
                ),
              ),
            ],
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
                    child: _popupPrimaryBtn(
                      onPressed: () {
                        c.setSelectedOrderModifiersIndex(index);
                      },
                      text: c.orderModifiers[index],
                      isSelected: c.selectedOrderModifiersIndex == index,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryBtnWithChild(
                      onPressed: () {
                        c.updateOrderQuantity(false, item.price.toDouble());
                      },
                      width: 48,
                      child: const Icon(
                        Icons.remove,
                        size: 24,
                        color: Colors.white,
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
                      width: 48,
                      child: const Icon(
                        Icons.add,
                        size: 24,
                        color: Colors.white,
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

  PrimaryBtn _popupPrimaryBtn(
      {required VoidCallback onPressed,
      required String text,
      required bool isSelected}) {
    return PrimaryBtn(
      onPressed: onPressed,
      width: double.infinity,
      text: text,
      isOutline: true,
      color: isSelected
          ? StaticColors.blueColor
          : Theme.of(Get.context!).scaffoldBackgroundColor,
      borderColor:
          isSelected ? StaticColors.blueColor : StaticColors.greenColor,
    );
  }
}
