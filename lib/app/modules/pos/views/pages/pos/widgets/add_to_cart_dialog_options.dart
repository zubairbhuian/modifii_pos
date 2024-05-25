import 'package:flutter/material.dart';
import 'package:flutter_base/app/modules/pos/controllers/pos_controller.dart';
import 'package:flutter_base/app/modules/pos/models/order_place_model.dart';
import 'package:flutter_base/app/modules/pos/models/product_model.dart';
import 'package:flutter_base/app/widgets/custom_btn.dart';
import 'package:flutter_base/app/widgets/custom_textfield.dart';
import 'package:flutter_base/app/widgets/my_custom_text.dart';
import 'package:flutter_base/app/widgets/popup_dialogs.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class AddToCartDialogOptions extends StatefulWidget {
  final ProductModel item;

  const AddToCartDialogOptions({super.key, required this.item});

  @override
  State<AddToCartDialogOptions> createState() => _AddToCartDialogOptionsState();
}

class _AddToCartDialogOptionsState extends State<AddToCartDialogOptions> {
  final TextEditingController _noteControllet = TextEditingController();

  int variationsActiveIndex = -1;
  int orderTypeActiveIndex = 0;
  int orderType2ActiveIndex = 0;
  int quantity = 1;
  late num price = widget.item.price;
  late num orderTotalPrice = widget.item.price;
  //** order type **
  List<String> orderTypes = ["TO GO", "DON'T MAKE", "RUSH"];
  List<String> orderTypes2 = ["APPETIZERS 1st", "ALL-TOGETHER"];

  //** Update quantity **
  void updateOrderQuantity(bool isIncrease) {
    if (isIncrease && quantity < 10) {
      quantity++;
      orderTotalPrice += price;
    } else if (!isIncrease && quantity > 1) {
      quantity--;
      orderTotalPrice -= price;
    }
    setState(() {});
  }

  //** order variations price  **
  void orderVariationPriceAdd(int index) {
    // reassine the price
    price = widget.item.price;
    // variations price
    String xptraPrice = widget.item.variations.first.values[index].optionPrice;
    Logger().e(xptraPrice);
    // price
    price = price + num.parse(xptraPrice);
    // orderTotalPrice
    orderTotalPrice = price * quantity;
  }

  @override
  void dispose() {
    _noteControllet.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        //item name & price
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyCustomText(
              widget.item.name,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            MyCustomText(
              '\$ $price',
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
        const SizedBox(height: 14),

        //** description **
        MyCustomText(
          'Description',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).hintColor,
        ),
        const SizedBox(height: 4),
        MyCustomText(
          widget.item.description == '' ? 'N/A' : widget.item.description,
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
        CustomTextField(
          controller: _noteControllet,
          maxLines: 2,
          isFilled: true,
        ),
        const SizedBox(height: 14),

        //** order types **
        _orderTypeRow(),
        const SizedBox(height: 14),
        //** order types 2 **
        _orderType2Row(),
        const SizedBox(height: 14),
        // **** order variations *****
        if (widget.item.variations.isNotEmpty) _variationRow(),
        const SizedBox(height: 14),
        //** quantity row **
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
                      updateOrderQuantity(false);
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
                        // c.orderQuantity.toString(),
                        quantity.toString(),
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  PrimaryBtnWithChild(
                    onPressed: () {
                      updateOrderQuantity(true);
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
                  '\$ ${orderTotalPrice.toStringAsFixed(2)}',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 28),
        //order button
        Center(
          child: PrimaryBtn(
            onPressed: () {
              Cart item = Cart(
                  id: widget.item.id.toString(),
                  name: widget.item.name,
                  description: widget.item.description,
                  type: widget.item.productType,
                  price: price,
                  quantity: quantity);

              //** Add item **
              PosController.to.onAddCartItem(item);
              Get.back();
              PopupDialog.showSuccessDialog("Cart Items Added Successfully");
            },
            text: 'Order',
            textMaxSize: 20,
            textMinSize: 16,
            textColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _orderTypeRow() => Row(
        children: List.generate(
          orderTypes.length,
          (index) => Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: PrimaryBtn(
                onPressed: () {
                  setState(
                    () {
                      orderTypeActiveIndex = index;
                    },
                  );
                  // c.setSelectedOrderModifiersIndex(index);
                },
                text: orderTypes[index],
                isOutline: true,
                color: orderTypeActiveIndex == index
                    ? Theme.of(context).primaryColorLight
                    : Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
        ),
      );

  Widget _orderType2Row() => Row(
        children: List.generate(
          orderTypes2.length,
          (index) => Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: PrimaryBtn(
                onPressed: () {
                  setState(
                    () {
                      orderType2ActiveIndex = index;
                    },
                  );
                  // c.setSelectedOrderModifiersIndex(index);
                },
                text: orderTypes2[index],
                isOutline: true,
                color: orderType2ActiveIndex == index
                    ? Theme.of(context).primaryColorLight
                    : Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
        ),
      );

  Widget _variationRow() => Row(
        children: List.generate(
          widget.item.variations.length,
          (index) => Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: PrimaryBtn(
                onPressed: () {
                  setState(
                    () {
                      orderVariationPriceAdd(index);
                      variationsActiveIndex = index;
                    },
                  );
                  // c.setSelectedOrderModifiersIndex(index);
                },
                text: widget.item.variations.first.values[index].label,
                isOutline: true,
                color: variationsActiveIndex == index
                    ? Theme.of(context).primaryColorLight
                    : Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
        ),
      );
}
