import 'package:flutter/material.dart';
import 'package:flutter_base/app/modules/order/components/pos_option.dart';
import 'package:flutter_base/app/modules/order/components/tables_option.dart';
import 'package:flutter_base/app/utils/static_colors.dart';
import 'package:flutter_base/app/widgets/custom_btn.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../../../widgets/custom_loading.dart';
import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({super.key});
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: _appBar(theme),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () => controller.isLoadingCategory.value
              ? const CustomLoading()
              : Column(
                  children: [
                    _header(theme),
                    const SizedBox(height: 16),
                    Obx(
                      () => Visibility(
                        visible: controller.isShowOrders.value,
                        replacement: const TablesOption(),
                        child: const PosOption(),
                      ),
                    ),
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

  //** Header **
  Widget _header(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: theme.dividerColor))),
      // height: 115,
      width: double.infinity,
      child: Row(
        children: [
          PrimaryBtn(
            onPressed: () {
              // controller.getCategory(type: 'foods');
              controller.isShowOrders.value = true;
            },
            color: StaticColors.greenColor,
            textColor: Colors.white,
            text: 'POS',
          ),
          const SizedBox(width: 10),
          PrimaryBtn(
            onPressed: () {
              // controller.getCategory(type: 'drinks');
            },
            color: StaticColors.yellowColor,
            textColor: Colors.white,
            text: 'ORDERS',
          ),
          const SizedBox(width: 10),
          PrimaryBtn(
            onPressed: () {
              // controller.getCategory(type: 'drinks');
            },
            color: StaticColors.yellowColor,
            textColor: Colors.white,
            text: 'TABLE\nORDERS',
          ),
          const SizedBox(width: 10),
          PrimaryBtn(
            onPressed: () {
              // controller.getCategory(type: 'drinks');
              controller.isShowOrders.value = false;
            },
            color: StaticColors.purpleColor,
            textColor: Colors.white,
            text: 'TABLES',
          ),
          const SizedBox(width: 10),
          PrimaryBtn(
            onPressed: () {
              // controller.getCategory(type: 'drinks');
            },
            color: StaticColors.purpleColor,
            textColor: Colors.white,
            text: 'BAR',
          ),
          const SizedBox(width: 10),
          PrimaryBtn(
            onPressed: () {
              // controller.getCategory(type: 'drinks');
            },
            color: StaticColors.blueColor,
            textColor: Colors.white,
            text: 'TAKEOUT',
          ),
          const SizedBox(width: 10),
          PrimaryBtn(
            onPressed: () {
              // controller.getCategory(type: 'drinks');
            },
            color: StaticColors.blueColor,
            textColor: Colors.white,
            text: 'Check\nSummery',
          ),
          const SizedBox(width: 10),
          PrimaryBtn(
            onPressed: () {
              // controller.getCategory(type: 'drinks');
            },
            color: StaticColors.greenColor,
            textColor: Colors.white,
            text: 'Cash\nOut',
          ),
        ],
      ),
    );
  }
}
