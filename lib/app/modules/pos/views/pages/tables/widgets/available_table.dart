import 'package:flutter/material.dart';
import 'package:flutter_base/app/modules/pos/controllers/pos_controller.dart';
import '../../../../../../utils/static_colors.dart';
import '../../../../../../widgets/custom_btn.dart';
import '../../../../../../widgets/my_custom_text.dart';
import '../../../../controllers/tables_controller.dart';

class AvailableTableOption extends StatelessWidget {
  const AvailableTableOption({
    super.key,
    required this.controller,
  });

  final TablesController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyCustomText(
            'Table ${controller.selectedTableIndex.value + 1}',
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              PrimaryBtn(
                onPressed: () {
                  PosController.to.onchangePage(0);
                },
                width: 150,
                text: 'Start Order',
                textColor: Colors.white,
                color: StaticColors.orangeColor,
              ),
              const SizedBox(width: 30),
              PrimaryBtn(
                onPressed: () {},
                width: 150,
                text: 'Hold Table',
                textColor: Colors.white,
                color: StaticColors.pinkColor,
              ),
            ],
          )
        ],
      ),
    );
  }
}
