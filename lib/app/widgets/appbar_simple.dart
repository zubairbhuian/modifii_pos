import 'package:flutter/material.dart';
import 'package:flutter_base/app/widgets/my_custom_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SimpleAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SimpleAppbar({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      forceMaterialTransparency: true,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: Get.back,
        icon: const Icon(
          FontAwesomeIcons.arrowLeft,
          size: 22,
        ),
      ),
      title: MyCustomText(title),
    );
  }
}
