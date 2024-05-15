import 'package:flutter/material.dart';
import 'package:flutter_base/app/modules/order/controllers/tables_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../../../../utils/static_colors.dart';
import '../../../../../widgets/custom_btn.dart';

class TableBody extends GetView<TablesController> {
  const TableBody({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return _body(theme);
  }

  //** Body **
  Widget _body(ThemeData theme) {
    return SingleChildScrollView(
      child: Obx(() {
        return StaggeredGrid.count(
          crossAxisCount: 7,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          children: List.generate(
            controller.tablesList.length,
            (index) => Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: controller.selectedTableIndex.value == index
                    ? StaticColors.blueLightColor
                    : Colors.transparent,
              ),
              child: PrimaryBtn(
                onPressed: () {
                  controller.updateSelectedTableIndex(index);
                },
                height: 75,
                width: 75,
                color: controller.tablesList[index].isBooked
                    ? StaticColors.yellowColor
                    : StaticColors.greenColor,
                style:
                    theme.textTheme.titleLarge?.copyWith(color: Colors.white),
                text: controller.tablesList[index].tableNo,
              ),
            ),
          ),
        );
      }),
    );
  }
}
