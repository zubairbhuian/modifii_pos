import 'package:flutter/material.dart';
import 'package:flutter_base/app/modules/drawer/add_category/controllers/add_category_controller.dart';
import 'package:flutter_base/app/widgets/custom_btn.dart';
import 'package:get/get.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../../../widgets/my_custom_text.dart';

class AddCategoryDialog extends StatelessWidget {
  const AddCategoryDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AddCategoryController c = Get.find();
    return Column(
      children: [
        MyCustomText(
          c.routeName,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 48),
        CustomTextField(
          controller: c.catNameTEController,
          hintText: 'Category Name',
          maxLines: 1,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: c.subCatNameTEController,
          hintText: 'Sub-Category Name',
          maxLines: 1,
        ),
        const SizedBox(height: 48),
        PrimaryBtn(
          onPressed: Get.back,
          text: 'Add',
          textColor: Colors.white,
        ),
      ],
    );
  }
}
