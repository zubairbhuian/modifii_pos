import 'package:flutter/material.dart';
import 'package:flutter_base/app/modules/pos/views/pages/tables/tables_page.dart';
import 'package:flutter_base/app/widgets/appbar.dart';
import 'package:get/get.dart';
import '../controllers/pos_controller.dart';
import 'pages/pos/pos_page.dart';

class PosView extends GetView<PosController> {
  const PosView({super.key});
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
=======
    // ThemeData theme = Theme.of(context);
>>>>>>> dev
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: PageView(
          controller: controller.pageController,
          onPageChanged: (value) {},
          children: const [
            PosPage(),
            TablesPage(),
          ],
        ),
      ),
    );
  }
}
