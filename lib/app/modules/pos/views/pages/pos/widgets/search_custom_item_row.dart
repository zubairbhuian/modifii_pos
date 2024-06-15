import 'package:flutter/material.dart';
import 'package:flutter_base/app/modules/pos/controllers/pos_controller.dart';
import 'package:flutter_base/app/utils/static_colors.dart';
import 'package:flutter_base/app/widgets/popup_dialogs.dart';
import 'package:get/get.dart';
import '../../../../../../widgets/custom_btn.dart';
import '../../../../../../widgets/custom_textfield.dart';
import 'custom_order_dialog_options.dart';

class SearchAndCustomItemRow extends StatelessWidget {
  const SearchAndCustomItemRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: PrimaryBtn(
          onPressed: () {
            PopupDialog.customDialog(
              child: const CustomOrderDialogOptions(productType: "custom_food"),
            );
          },
          color: StaticColors.blueColor,
          text: 'Custom Food',
          textColor: Colors.white,
        )),
        const SizedBox(width: 12.0),
        Expanded(
            child: PrimaryBtn(
          onPressed: () {
            PopupDialog.customDialog(
              child:
                  const CustomOrderDialogOptions(productType: "custom_drink"),
            );
          },
          color: StaticColors.blueColor,
          text: 'Custom Drink',
          textColor: Colors.white,
        )),
        const SizedBox(width: 36.0),
        Expanded(
          flex: 2,
          child: GetBuilder<PosController>(builder: (c) {
            return CustomTextField(
              controller: c.itemSearchTEC,
              hintText: 'Search item',
              prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
              suffixIcon: Visibility(
                visible: c.itemSearchTEC.text.isNotEmpty,
                child: IconButton(
                    onPressed: c.clearSearchItem,
                    icon: const Icon(Icons.close, color: Colors.redAccent)),
              ),
              onChange: c.searchItemList,
            );
          }),
        ),
        const SizedBox(width: 36.0),
        Expanded(
            child: PrimaryBtn(
          onPressed: () {
            PopupDialog.customDialog(
              child: const CustomOrderDialogOptions(productType: "custom_bar"),
            );
          },
          color: StaticColors.blueColor,
          text: 'Custom Bar',
          textColor: Colors.white,
        )),
        const SizedBox(width: 12.0),
        // Expanded(
        //     child: PrimaryBtn(
        //   onPressed: () {
        //     PopupDialog.customDialog(
        //       child: const DiscountDialogOptions(),
        //     );
        //   },
        //   color: StaticColors.blueColor,
        //   text: 'Discount',
        //   textColor: Colors.white,
        // )),
      ],
    );
  }
}
