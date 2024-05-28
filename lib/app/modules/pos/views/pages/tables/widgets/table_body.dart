import 'package:flutter/material.dart';
import 'package:flutter_base/app/widgets/my_custom_text.dart';
import 'package:get/get.dart';
import '../../../../../../utils/static_colors.dart';
import '../../../../../../widgets/custom_btn.dart';
import '../../../../controllers/tables_controller.dart';

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
      child: Column(
        children: [
          _title('Bar Area'),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 110,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemCount: controller.barList.length,
            itemBuilder: (context, index) {
              return Obx(
                () => Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: controller.selectedTableIndex.value == index
                        ? StaticColors.blueLightColor
                        : Colors.transparent,
                  ),
                  child: PrimaryBtnWithChild(
                    onPressed: () {
                      controller.updateSelectedTableIndex(index);
                    },
                    height: 75,
                    width: 75,
                    padding: const EdgeInsets.all(10.0),
                    color: controller.barList[index].isBooked
                        ? StaticColors.yellowColor
                        : StaticColors.greenColor,
                    style: theme.textTheme.titleLarge
                        ?.copyWith(color: Colors.white),
                    // text: controller.tablesList[index].tableNo,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyCustomText(
                              controller.barList[index].tableNo,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                            const MyCustomText(
                              '16',
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Visibility(
                          visible: controller.barList[index].isBooked,
                          child: const MyCustomText(
                            'username',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Visibility(
                          visible: controller.barList[index].isBooked,
                          child: const MyCustomText(
                            '\$34.99',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          /*******Dine IN******** */
          _title('Dine-In Area'),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 110,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemCount: controller.tablesList.length,
            itemBuilder: (context, index) {
              return Obx(
                () => Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: controller.selectedTableIndex.value == index
                        ? StaticColors.blueLightColor
                        : Colors.transparent,
                  ),
                  child: PrimaryBtnWithChild(
                    onPressed: () {
                      controller.updateSelectedTableIndex(index);
                    },
                    height: 75,
                    width: 75,
                    padding: const EdgeInsets.all(10.0),
                    color: controller.tablesList[index].isBooked
                        ? StaticColors.yellowColor
                        : StaticColors.greenColor,
                    style: theme.textTheme.titleLarge
                        ?.copyWith(color: Colors.white),
                    // text: controller.tablesList[index].tableNo,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyCustomText(
                              controller.tablesList[index].tableNo,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                            const MyCustomText(
                              '16',
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Visibility(
                          visible: controller.tablesList[index].isBooked,
                          child: const MyCustomText(
                            'username',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Visibility(
                          visible: controller.tablesList[index].isBooked,
                          child: const MyCustomText(
                            '\$34.99',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          /*******Hall Area******** */
          _title('Hall Area'),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 110,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemCount: controller.hallList.length,
            itemBuilder: (context, index) {
              return Obx(
                () => Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: controller.selectedTableIndex.value == index
                        ? StaticColors.blueLightColor
                        : Colors.transparent,
                  ),
                  child: PrimaryBtnWithChild(
                    onPressed: () {
                      controller.updateSelectedTableIndex(index);
                    },
                    height: 75,
                    width: 75,
                    padding: const EdgeInsets.all(10.0),
                    color: controller.tablesList[index].isBooked
                        ? StaticColors.yellowColor
                        : StaticColors.greenColor,
                    style: theme.textTheme.titleLarge
                        ?.copyWith(color: Colors.white),
                    // text: controller.tablesList[index].tableNo,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyCustomText(
                              controller.hallList[index].tableNo,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                            const MyCustomText(
                              '16',
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Visibility(
                          visible: controller.hallList[index].isBooked,
                          child: const MyCustomText(
                            'username',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Visibility(
                          visible: controller.hallList[index].isBooked,
                          child: const MyCustomText(
                            '\$34.99',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Container _title(String title) {
    return Container(
      height: 30,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 6),
      color: StaticColors.blackLightColor,
      child: Center(
        child: MyCustomText(
          title,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
