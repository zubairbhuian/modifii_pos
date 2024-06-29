import 'package:flutter/material.dart';
import 'package:flutter_base/app/widgets/appbar_simple.dart';
import 'package:flutter_base/app/widgets/custom_btn.dart';
import 'package:flutter_base/app/widgets/my_custom_text.dart';
import 'package:get/get.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../../../widgets/popup_dialogs.dart';
import '../controllers/add_category_controller.dart';
import 'add_category_dialog.dart';
import 'category_tile.dart';

class AddCategoryView extends GetView<AddCategoryController> {
  const AddCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SimpleAppbar(title: controller.routeName),
        body: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: PrimaryBtn(
                      onPressed: () {
                        PopupDialog.customDialog(
                          child: const AddCategoryDialog(),
                        );
                      },
                      text: controller.routeName,
                      textColor: Colors.white,
                    ),
                  ),
                  const Expanded(flex: 2, child: SizedBox()),
                  Expanded(
                    child: CustomTextField(
                      controller: controller.searchTEController,
                      hintText:
                          'search ${controller.routeName.split(' ').last}',
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              Align(
                  alignment: Alignment.centerLeft,
                  child: MyCustomText(
                      'Available ${controller.routeName.split(' ').last}')),
              const SizedBox(height: 36),
              Expanded(
                child: SingleChildScrollView(
                  child: GetBuilder<AddCategoryController>(builder: (c) {
                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: c.categoryList.length,
                      itemBuilder: (_, index) {
                        var item = c.categoryList[index];
                        return CategoryTile(
                          sl: '${index + 1}.',
                          title: item.name,
                          isActive: item.isActive,
                          onStatusChanged: (value) {
                            item.isActive = value;
                            c.update();
                          },
                          onEdit: () {},
                          onDelete: () {},
                        );
                      },
                      separatorBuilder: (_, __) {
                        return const Divider(height: 24);
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
        ));
  }
}
