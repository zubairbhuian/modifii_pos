import 'package:flutter/material.dart';
import 'package:flutter_base/app/modules/pos/views/pages/pos/widgets/custom_order_dialog_options.dart';
import 'package:flutter_base/app/widgets/popup_dialogs.dart';
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
            PopupDialog.customDialog(
              child: const CustomOrderDialogOptions(productType:"Custom Food"),
            );
          },
          text: 'Custom Food',
          textColor: Colors.white,
        )),
        const SizedBox(width: 12.0),
        Expanded(
            child: PrimaryBtn(
          onPressed: () {
            PopupDialog.customDialog(
              child: const CustomOrderDialogOptions(productType:"Custom Drink"),
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



}
