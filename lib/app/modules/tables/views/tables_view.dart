import 'package:flutter/material.dart';
import 'package:flutter_base/app/widgets/appbar.dart';

import 'package:get/get.dart';

import '../controllers/tables_controller.dart';

class TablesView extends GetView<TablesController> {
  const TablesView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text(
          'TablesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
