import 'package:flutter/material.dart';
import 'package:flutter_base/app/routes/app_pages.dart';
import 'package:flutter_base/app/utils/const.dart';
import 'package:flutter_base/app/utils/static_colors.dart';
import 'package:flutter_base/app/widgets/custom_btn.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          children: [
            PrimaryBtnWithChild(
              width: double.infinity,
              onPressed: () {
                Get.back();
                Get.back();
              },
              child: const Icon(
                FontAwesomeIcons.arrowLeft,
                size: 36,
              ),
            ),
            const SizedBox(height: 8),
            _button(DrawerConstant.addCategory),
            _button(DrawerConstant.addSubCategory),
            _button(DrawerConstant.addProduct),
          ],
        ),
      ),
    );
  }

  Widget _button(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: PrimaryBtn(
        width: double.infinity,
        onPressed: () {
          Get.back();
          Get.toNamed(Routes.ADD_CATEGORY, arguments: text);
        },
        color: StaticColors.greenColor,
        text: text,
        textColor: Colors.white,
      ),
    );
  }
}
