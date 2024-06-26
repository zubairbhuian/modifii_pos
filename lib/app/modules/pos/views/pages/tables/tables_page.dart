import 'package:flutter/material.dart';
import 'package:flutter_base/app/modules/pos/controllers/tables_controller.dart';
import 'package:get/get.dart';
import 'widgets/available_table.dart';
import 'widgets/booked_table.dart';
import 'widgets/table_availability_header.dart';
import 'widgets/table_body.dart';

class TablesPage extends GetView<TablesController> {
  const TablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const TableAvailabilityHeader(),
        const SizedBox(height: 12.0),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 3,
                child: TableBody(),
              ),
              const SizedBox(width: 80),
              Expanded(
                flex: 2,
                child: Obx(
                  () => Visibility(
                    visible: controller
                        .tablesList[controller.selectedTableIndex.value]
                        .isBooked,
                    replacement: AvailableTableOption(controller: controller),
                    child: BookedTableOption(controller: controller),
                  ),
                ),
              ),
              // cart area
            ],
          ),
        ),
      ],
    );
  }
}
