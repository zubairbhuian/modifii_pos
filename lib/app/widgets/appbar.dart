import 'package:flutter_base/app/modules/pos/controllers/pos_controller.dart';
import 'package:flutter_base/app/services/controller/config_controller.dart';
import 'package:flutter_base/app/utils/static_colors.dart';
import 'package:flutter_base/app/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../routes/app_pages.dart';
import 'popup_dialogs.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isLeading;
  final bool hasButtonsRow;
  final double? preferredHeight;
  final bool isShadow;
  final bool centerTitle;
  final String actionBtnText;

  const CustomAppBar({
    super.key,
    this.isShadow = false,
    this.centerTitle = false,
    this.isLeading = true,
    this.preferredHeight,
    this.hasButtonsRow = true,
    this.actionBtnText = 'Text',
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
      backgroundColor: theme.scaffoldBackgroundColor,
      // foregroundColor: kTextColor,
      // titleTextStyle: kTitleLarge.copyWith(color: const Color(0xff2F2F2F)),
      // appbar leading
      // appbar title
      flexibleSpace: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: theme.dividerColor))),
        width: double.infinity,
        child: Column(
          children: [
            // topbar
            _topBar(theme),
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
  Widget _topBar(ThemeData theme) => Padding(
        padding: const EdgeInsets.only(bottom: 20, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (isLeading)
                  InkWell(
                    onTap: () => Get.back(),
                    child: const Icon(
                      IconlyBroken.arrow_left,
                      size: 40,
                    ),
                  ).marginOnly(right: 20),
                SvgPicture.asset(
                    width: 200, 'assets/images/splash/logo_light.svg'),
              ],
            ),
            Row(
              children: [
                Switch(
                  value: ConfigController.to.isLightTheme,
                  onChanged: (value) => ConfigController.to.toggleTheme(),
                  activeColor: theme.primaryColor,
                ),
                const SizedBox(width: 14),
                InkWell(
                  onTap: () =>
                      PopupDialog.showSuccessDialog('Tap again to Logout!'),
                  onDoubleTap: () => Get.offAllNamed(AppPages.INITIAL),
                  onLongPress: () => Get.offAllNamed(AppPages.INITIAL),
                  borderRadius: BorderRadius.circular(12.0),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      FontAwesomeIcons.rightFromBracket,
                      color: Colors.redAccent,
                      size: 26,
                    ),
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

  //** buttons **
  Widget _buttons(ThemeData theme) => Row(
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
            onPressed: () {},
            color: StaticColors.yellowColor,
            textColor: Colors.white,
            text: 'TABLE\nORDERS',
          ),
          const SizedBox(width: 10),
          PrimaryBtn(
            onPressed: () {
              PosController.to.onchangePage(1);
            },
            color: StaticColors.purpleColor,
            textColor: Colors.white,
            text: 'TABLES',
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
      );
}
