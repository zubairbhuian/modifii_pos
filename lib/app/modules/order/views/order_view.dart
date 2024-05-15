import 'package:flutter/material.dart';
import 'package:flutter_base/app/modules/order/widgets/header_options.dart';
import 'package:flutter_base/app/utils/static_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../../../widgets/custom_loading.dart';
import '../controllers/order_base_controller.dart';
import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderBaseController> {
  const OrderView({super.key});
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: _appBar(theme),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () => OrderController.to.isLoadingCategory.value
              ? const CustomLoading()
              : Column(
                  children: [
                    const HeaderOptions(),
                    const SizedBox(height: 16),
                    Obx(() => controller.getSelectedOption()),
                  ],
                ),
        ),
      ),
    );
  }

  //** Appbar **
  PreferredSizeWidget _appBar(ThemeData theme) {
    return AppBar(
      automaticallyImplyLeading: true,
      titleSpacing: 24,
      elevation: 0,
      centerTitle: false,
      leadingWidth: 80,
      backgroundColor: const Color(0xffF2F8FD),
      // foregroundColor: kTextColor,
      // titleTextStyle: kTitleLarge.copyWith(color: const Color(0xff2F2F2F)),
      // appbar leading
      leading: InkWell(
          onTap: () {
            Get.back();
            // if (controller.isProductPage.value) {
            //   controller.isProductPage.value = false;
            // } else {
            //   Get.back();
            // }
          },
          child: const Icon(IconlyLight.arrow_left)),
      // appbar title
      title:
          SvgPicture.asset(width: 200, 'assets/images/splash/logo_light.svg'),
      // appbar actions),
      actions: [
        InkWell(
          onTap: () {},
          splashFactory: NoSplash.splashFactory,
          child: const Icon(
            Icons.menu,
            size: 40,
            color: StaticColors.purpleColor,
          ),
        ),
        const SizedBox(width: 24),
      ],
    );
  }
}
