import 'package:flutter_base/app/modules/pos/controllers/pos_controller.dart';
import 'package:flutter_base/app/modules/pos/controllers/tables_controller.dart';
import 'package:flutter_base/app/services/controller/config_controller.dart';
import 'package:flutter_base/app/utils/static_colors.dart';
import 'package:flutter_base/app/widgets/custom_alert_dialog.dart';
import 'package:flutter_base/app/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/app/widgets/my_custom_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../routes/app_pages.dart';
import 'custom_inkwell.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isLeading;
  final bool hasHomeButton;
  final bool hasButtonsRow;
  final bool hasLogoutBtn;
  final double? preferredHeight;
  final Color? backgroundColor;
  final bool centerTitle;

  const CustomAppBar({
    super.key,
    this.centerTitle = false,
    this.isLeading = true,
    this.hasHomeButton = true,
    this.hasLogoutBtn = true,
    this.preferredHeight,
    this.backgroundColor,
    this.hasButtonsRow = true,
  });
// Specify the desired height of the AppBar
  @override
  Size get preferredSize => Size.fromHeight(preferredHeight ?? 65.0);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 12,
      elevation: 0,
      centerTitle: centerTitle,
      // leadingWidth: 80,
      backgroundColor: backgroundColor ?? theme.canvasColor,
      // foregroundColor: kTextColor,
      // titleTextStyle: kTitleLarge.copyWith(color: const Color(0xff2F2F2F)),
      // appbar leading
      // appbar title
      title: _topBar(theme, context),
      // flexibleSpace: SizedBox(
      //   // decoration: BoxDecoration(
      //   //     border: Border(bottom: BorderSide(color: theme.dividerColor))),
      //   width: double.infinity,
      //   child: Column(
      //     children: [
      //       // topbar
      //       _topBar(theme, context),
      //       // Visibility(
      //       //   visible: hasButtonsRow,
      //       //   child: _buttons(theme),
      //       // ),
      //     ],
      //   ),
      // ),
    );
  }

  //** Buttons **
  Widget _topBar(ThemeData theme, BuildContext context) {
    ConfigController configController = ConfigController.to;
    // ClockInController clockInController = ClockInController.to;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // if (isLeading)
              //   CustomInkWell(
              //     onTap: () => Get.back(),
              //     child: const Icon(
              //       FontAwesomeIcons.arrowLeft,
              //       size: 28,
              //     ),
              //   ).marginOnly(right: 20),
              // if (hasHomeButton)
              //   CustomInkWell(
              //     onTap: () {},
              //     child: const Icon(
              //       FontAwesomeIcons.house,
              //       size: 28,
              //     ),
              //   ).marginOnly(right: 20),
              SvgPicture.asset(
                width: 155,
                'assets/images/splash/yogo_logo_write.svg',
                colorFilter: ColorFilter.mode(
                  configController.isLightTheme ? Colors.black : Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
          Row(
            children: [
              CustomInkWell(
                onTap: configController.toggleTheme,
                child: SvgPicture.asset(
                  'assets/icons/theme.svg',
                  height: 45,
                  colorFilter: ColorFilter.mode(
                      configController.isLightTheme
                          ? Colors.black
                          : Colors.white,
                      BlendMode.srcIn),
                ),
              ),
              const SizedBox(width: 18),
              Visibility(
                visible: hasLogoutBtn,
                child: PrimaryBtn(
                  onPressed: () {
                    // ClockInController.to.clockOut();
                    Get.offAllNamed(AppPages.INITIAL);
                    TablesController.to.clearSelections();
                    PosController.to.clearCartList();
                  },
                  height: 48,
                  text: 'Logout',
                  textMaxSize: 14,
                  textMinSize: 12,
                  textColor: Colors.white,
                  color: StaticColors.redColor,
                ),
              ),
              // PrimaryBtn(
              //   onPressed: () => Get.offAllNamed(AppPages.INITIAL),
              //   width: 80,
              //   text: 'Logout',
              //   textColor: Colors.white,
              //   color: Colors.redAccent,
              // ),
            ],
          ),
          // InkWell(
          //   onTap: () {},
          //   splashFactory: NoSplash.splashFactory,
          //   child: const Icon(
          //     Icons.menu,
          //     size: 40,
          //   ),
          // )
        ],
      ),
    );
  }

  //** buttons **
  Widget _buttons(ThemeData theme) {
    const double btnSize = 130;
    const double txtMaxSize = 22;
    const double txtMinSize = 18;
    return Expanded(
      child: ColoredBox(
        color: theme.scaffoldBackgroundColor,
        child: Row(
          children: [
            Obx(
              () => Visibility(
                visible: PosController.to.isShowPos.value,
                replacement: const SizedBox(width: 16),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 10),
                  child: PrimaryBtn(
                    width: btnSize,
                    height: btnSize,
                    onPressed: () {
                      PosController.to.onchangePage(0);
                    },
                    color: StaticColors.greenColor,
                    textColor: Colors.white,
                    text: 'POS',
                    textMaxSize: txtMaxSize,
                    textMinSize: txtMinSize,
                  ),
                ),
              ),
            ),
            PrimaryBtn(
              width: btnSize,
              height: btnSize,
              onPressed: () {
                // controller.getCategory(type: 'drinks');
              },
              color: StaticColors.yellowColor,
              textColor: Colors.white,
              text: 'ORDERS',
              textMaxSize: txtMaxSize,
              textMinSize: txtMinSize,
            ),
            const SizedBox(width: 10),
            PrimaryBtn(
              width: btnSize,
              height: btnSize,
              onPressed: () {
                TablesController.to.updateSelectedOrder(null);
                PosController.to.onchangePage(1);
              },
              color: StaticColors.yellowColor,
              textColor: Colors.white,
              text: 'DINE-IN\nORDERS',
              textMaxSize: txtMaxSize,
              textMinSize: txtMinSize,
            ),
            const SizedBox(width: 10),
            PrimaryBtn(
              width: btnSize,
              height: btnSize,
              onPressed: () {
                PosController.to.onchangePage(2);
              },
              color: StaticColors.purpleColor,
              textColor: Colors.white,
              text: 'DINE-IN',
              textMaxSize: txtMaxSize,
              textMinSize: txtMinSize,
            ),
            const SizedBox(width: 10),
            // PrimaryBtn(
            //   width: btnSize,
            //   height: btnSize,
            //   onPressed: () {},
            //   color: StaticColors.blueColor,
            //   textColor: Colors.white,
            //   text: 'TAKEOUT',
            //   textMaxSize: txtMaxSize,
            //   textMinSize: txtMinSize,
            // ),
            // const SizedBox(width: 10),
            const Spacer(),
            PrimaryBtn(
              width: btnSize,
              height: btnSize,
              onPressed: () {},
              color: StaticColors.blueColor,
              textColor: Colors.white,
              text: 'Check\nSummery',
              textMaxSize: txtMaxSize,
              textMinSize: txtMinSize,
            ),
            const SizedBox(width: 10),
            PrimaryBtn(
              width: btnSize,
              height: btnSize,
              onPressed: () {
                // controller.getCategory(type: 'drinks');
              },
              color: StaticColors.greenColor,
              textColor: Colors.white,
              text: 'Cash\nOut',
              textMaxSize: txtMaxSize,
              textMinSize: txtMinSize,
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
