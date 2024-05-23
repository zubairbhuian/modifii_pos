import 'package:flutter/material.dart';
import 'package:flutter_base/app/modules/pos/models/product_model.dart';
import 'package:flutter_base/app/utils/static_colors.dart';
import 'package:flutter_base/app/widgets/custom_btn.dart';
import 'package:flutter_base/app/widgets/custom_textfield.dart';
import 'package:flutter_base/app/widgets/my_custom_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AddToCartDialogOptions extends StatefulWidget {
  final ProductModel item;

  const AddToCartDialogOptions({super.key, required this.item});

  @override
  State<AddToCartDialogOptions> createState() => _AddToCartDialogOptionsState();
}

class _AddToCartDialogOptionsState extends State<AddToCartDialogOptions> {
  final TextEditingController _noteControllet = TextEditingController();

  int activeIndex = 0;
  int quantity = 1;
  late num price = widget.item.price;
  late num orderTotalPrice = widget.item.price;


  // 


  

  //** Update quantity **
  void updateOrderQuantity(bool isIncrease) {
    if (isIncrease && quantity < 20) {
      quantity++;
      orderTotalPrice += price;
    } else if (!isIncrease && quantity > 1) {
      quantity--;
      orderTotalPrice -= price;
    }
    setState(() {});
  }

  @override
  void dispose() {
    _noteControllet.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.4,
      child: Stack(
        alignment: Alignment.topRight,
        clipBehavior: Clip.none,
        children: [
          //close button
          Positioned(
            top: -30,
            right: -20,
            child: IconButton(
              onPressed: Get.back,
              icon: const Icon(
                FontAwesomeIcons.circleXmark,
                color: Colors.redAccent,
              ),
            ),
          ),
          Column(
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
                    price.toString(),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: StaticColors.yellowColor,
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
              //order types
              // Row(
              //   children: [
              //     Expanded(
              //       child: PrimaryBtn(
              //         onPressed: () {
              //           // c.isTogoSelected = !c.isTogoSelected;
              //           // c.update();
              //         },
              //         text: 'TO GO',
              //         isOutline: true,
              //         color: c.isTogoSelected
              //             ? Theme.of(context).primaryColorLight
              //             : Theme.of(context).scaffoldBackgroundColor,
              //       ),
              //     ),
              //     const SizedBox(width: 12),
              //     Expanded(
              //       child: PrimaryBtn(
              //         onPressed: () {
              //           c.isDontMakeSelected = !c.isDontMakeSelected;
              //           c.update();
              //         },
              //         text: "DON'T MAKE",
              //         isOutline: true,
              //         color: c.isDontMakeSelected
              //             ? Theme.of(context).primaryColorLight
              //             : Theme.of(context).scaffoldBackgroundColor,
              //       ),
              //     ),
              //     const SizedBox(width: 12),
              //     Expanded(
              //       child: PrimaryBtn(
              //         onPressed: () {
              //           c.isRushSelected = !c.isRushSelected;
              //           c.update();
              //         },
              //         text: 'RUSH',
              //         isOutline: true,
              //         color: c.isRushSelected
              //             ? Theme.of(context).primaryColorLight
              //             : Theme.of(context).scaffoldBackgroundColor,
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 14),
              //order types 2
              // Row(
              //   children: List.generate(
              //     c.orderTypes2.length,
              //     (index) => Expanded(
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 4.0),
              //         child: PrimaryBtn(
              //           onPressed: () {
              //             c.setSelectedOrderTypesIndex2(index);
              //           },
              //           text: c.orderTypes2[index],
              //           isOutline: true,
              //           color: c.selectedOrderTypesIndex2 == index
              //               ? Theme.of(context).primaryColorLight
              //               : Theme.of(context).scaffoldBackgroundColor,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 14),
              // **** order variations *****
              if (widget.item.variations.isNotEmpty)
                Row(
                  children: List.generate(
                    widget.item.variations.length,
                    (index) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: PrimaryBtn(
                          onPressed: () {
                            setState(() {
                              activeIndex = index;
                            });
                            // c.setSelectedOrderModifiersIndex(index);
                          },
                          text:
                              widget.item.variations.first.values[index].label,
                          isOutline: true,
                          color: activeIndex == index
                              ? Theme.of(context).primaryColorLight
                              : Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ),
                    ),
                  ),
                ),
              // VariationsCard(data:item.variations.first.values,),
              // Row(
              //     children: List.generate(
              //       item.variations.first.values.length,
              //       (index) => Expanded(
              //         child: Padding(
              //           padding: const EdgeInsets.symmetric(horizontal: 4.0),
              //           child: PrimaryBtn(
              //             onPressed: () {
              //               c.setSelectedOrderModifiersIndex(index);
              //             },
              //             text: c.orderModifiers[index],
              //             isOutline: true,
              //             color: c.selectedOrderModifiersIndex == index
              //                 ? Theme.of(context).primaryColorLight
              //                 : Theme.of(context).scaffoldBackgroundColor,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
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
                        // '\$${c.orderTotalPrice.toStringAsFixed(2)}',
                        orderTotalPrice.toStringAsFixed(2),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: StaticColors.yellowColor,
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
                        'Order',
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
      ),
    );
  }
}
