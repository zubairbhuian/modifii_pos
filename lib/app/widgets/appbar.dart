import 'package:flutter_base/app/modules/clockIn/controllers/clock_in_controller.dart';
import 'package:flutter_base/app/modules/pos/controllers/pos_controller.dart';
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
  final bool centerTitle;

  const CustomAppBar({
    super.key,
    this.centerTitle = false,
    this.isLeading = true,
    this.hasHomeButton = true,
    this.hasLogoutBtn = true,
    this.preferredHeight,
    this.hasButtonsRow = true,
  });
// Specify the desired height of the AppBar
  @override
  Size get preferredSize => Size.fromHeight(preferredHeight ?? 148.0);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 24,
      elevation: 0,
      centerTitle: centerTitle,
      leadingWidth: 80,
      backgroundColor: theme.canvasColor,
      // foregroundColor: kTextColor,
      // titleTextStyle: kTitleLarge.copyWith(color: const Color(0xff2F2F2F)),
      // appbar leading
      // appbar title
      flexibleSpace: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: theme.dividerColor))),
        width: double.infinity,
        child: Column(
          children: [
            // topbar
            _topBar(theme, context),
            Visibility(
              visible: hasButtonsRow,
              child: _buttons(theme),
            ),
          ],
        ),
      ),
    );
  }

  //** Buttons **
  Widget _topBar(ThemeData theme, BuildContext context) {
    ConfigController configController = ConfigController.to;
    ClockInController clockInController = ClockInController.to;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (isLeading)
                CustomInkWell(
                  onTap: () => Get.back(),
                  child: const Icon(
                    FontAwesomeIcons.arrowLeft,
                    size: 28,
                  ),
                ).marginOnly(right: 20),
              if (hasHomeButton)
                CustomInkWell(
                  onTap: () {},
                  child: const Icon(
                    FontAwesomeIcons.house,
                    size: 28,
                  ),
                ).marginOnly(right: 20),
              SvgPicture.asset(
                width: 200,
                configController.isLightTheme
                    ? 'assets/images/splash/logo_light.svg'
                    : 'assets/images/splash/logo_dark.svg',
              ),
            ],
          ),
          Row(
            children: [
              Visibility(
                visible: clockInController.timer?.isActive ?? false,
                child: Row(
                  children: [
                    Obx(
                      () => MyCustomText(
                        clockInController.showClockInTimer(
                            clockInController.secondsElapsed.value),
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    PrimaryBtn(
                      onPressed: () {
                        customAlertDialog(
                          context: context,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const MyCustomText(
                                'Do you want to clock out?',
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                              ),
                              const SizedBox(height: 28),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  PrimaryBtn(
                                    onPressed: clockInController.clockOut,
                                    text: 'Yes',
                                    textColor: Colors.white,
                                  ),
                                  const SizedBox(width: 24),
                                  PrimaryBtn(
                                    onPressed: Get.back,
                                    text: 'Cancel',
                                    color: StaticColors.blackLightColor,
                                    textColor: Colors.white,
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      text: 'Clockout',
                      textColor: Colors.white,
                      color: StaticColors.redColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 18),
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
                    Get.offAllNamed(AppPages.INITIAL);
                  },
                  text: 'Logout',
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
  Widget _buttons(ThemeData theme) => Expanded(
        child: ColoredBox(
          color: theme.scaffoldBackgroundColor,
          child: Row(
            children: [
              Obx(
                () => Visibility(
                  visible: PosController.to.isShowPos.value,
                  child: PrimaryBtn(
                    onPressed: () {
                      PosController.to.onchangePage(0);
                    },
                    color: StaticColors.greenColor,
                    textColor: Colors.white,
                    text: 'POS',
                  ),
                ),
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
                  PosController.to.onchangePage(1);
                },
                color: StaticColors.yellowColor,
                textColor: Colors.white,
                text: 'TABLE\nORDERS',
              ),
              const SizedBox(width: 10),
              PrimaryBtn(
                onPressed: () {
                  PosController.to.onchangePage(2);
                },
                color: StaticColors.purpleColor,
                textColor: Colors.white,
                text: 'DINE-IN',
              ),
              const SizedBox(width: 10),
              PrimaryBtn(
                onPressed: () {},
                color: StaticColors.purpleColor,
                textColor: Colors.white,
                text: 'BAR',
              ),
              const SizedBox(width: 10),
              PrimaryBtn(
                onPressed: () {},
                color: StaticColors.blueColor,
                textColor: Colors.white,
                text: 'TAKEOUT',
              ),
              const SizedBox(width: 10),
              PrimaryBtn(
                onPressed: () {},
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
        ),
      );
}
