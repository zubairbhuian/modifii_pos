import 'package:flutter/material.dart';
import 'package:flutter_base/app/utils/static_colors.dart';
import 'package:flutter_base/app/widgets/custom_btn.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../../widgets/my_custom_text.dart';
import '../controllers/order_controller.dart';

class TablesOption extends GetView<OrderController> {
  const TablesOption({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
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
                const SizedBox(width: 110),
                Expanded(
                  flex: 2,
                  child: Obx(
                    () => controller.selectedTableIndex.value != -1
                        ? Column(
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
                                    onPressed: () {},
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
                          )
                        : const SizedBox(),
                  ),
                ),
                // cart area
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TableBody extends GetView<OrderController> {
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
            38,
            (index) => Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: controller.selectedTableIndex.value == index
                    ? StaticColors.yellowColor
                    : Colors.transparent,
              ),
              child: PrimaryBtn(
                onPressed: () {
                  controller.updateSelectedTableIndex(index);
                },
                height: 75,
                width: 75,
                color: StaticColors.greenColor,
                style:
                    theme.textTheme.titleLarge?.copyWith(color: Colors.white),
                text: 'T ${index + 1}',
              ),
            ),
          ),
        );
      }),
    );
  }
}

class TableAvailabilityHeader extends StatelessWidget {
  const TableAvailabilityHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        MyCustomText(
          ' Table Availability',
          fontWeight: FontWeight.w500,
        ),
        SizedBox(width: 10.0),
        ColorTextRow(
          color: StaticColors.greenColor,
          text: 'Available',
        ),
        ColorTextRow(
          color: StaticColors.yellowColor,
          text: 'Walk-In Booking',
        ),
        ColorTextRow(
          color: StaticColors.orangeColor,
          text: 'Cooking/Serving',
        ),
        ColorTextRow(
          color: StaticColors.blueColor,
          text: 'Online Booking',
        ),
        ColorTextRow(
          color: StaticColors.purpleColor,
          text: 'Combined Tables',
        ),
        ColorTextRow(
          color: StaticColors.pinkColor,
          text: 'Hold Tables',
        ),
      ],
    );
  }
}

class ColorTextRow extends StatelessWidget {
  const ColorTextRow({
    super.key,
    required this.color,
    required this.text,
  });

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 8,
            backgroundColor: color,
          ),
          const SizedBox(width: 3.0),
          MyCustomText(
            text,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
