import 'package:flutter/material.dart';
import 'package:flutter_base/app/widgets/my_custom_text.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../services/controller/config_controller.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  width: 200,
                  ConfigController.to.isLightTheme
                      ? 'assets/images/splash/logo_light.svg'
                      : 'assets/images/splash/logo_dark.svg',
                ),
                Switch(
                  value: ConfigController.to.isLightTheme,
                  onChanged: (value) => ConfigController.to.toggleTheme(),
                  activeColor: theme.primaryColor,
                ),
              ],
            ),
          ),
          Center(
            child: SizedBox(
              width: 240,
              height: 580,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // brand icon
                    SvgPicture.asset(
                      width: 175,
                      "assets/images/splash/login_logo.svg",
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 12),
                    // password display
                    _passwordDisplay(theme),
                    const SizedBox(height: 12),
                    // keybord area
                    _customKeybord(theme),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _passwordDisplay(ThemeData theme) {
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 26),
      decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: theme.colorScheme.background,
            width: 0.75,
          )),
      child: Obx(
        () => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              controller.passwordLength.value,
              (index) => CircleAvatar(
                    backgroundColor:
                        index + 1 > controller.password.value.length
                            ? Colors.transparent
                            : theme.colorScheme.background,
                    radius: 7,
                  )),
        ),
      ),
    );
  }

  Widget _customKeybord(ThemeData theme) {
    return StaggeredGrid.count(
      crossAxisCount: 3,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: List.generate(
          controller.numberList.length,
          (index) => StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (controller.numberList.length - 1 == index) {
                        // log in
                        controller.login();
                      } else if (controller.numberList[index] == "*") {
                        // remove number
                        controller.removePassword();
                      } else {
                        // add number
                        controller.addPassword(controller.numberList[index]);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      // ****** style ******
                      textStyle: theme.textTheme.titleLarge?.copyWith(
                          color: Colors.red,
                          fontWeight: FontWeight.w700,
                          fontSize: 24),
                      backgroundColor: controller.numberList[index] == "*"
                          ? controller.numberList.length - 1 == index
                              ? const Color(0xff118A00)
                              : const Color(0xffFD571A)
                          : theme.cardColor,
                      foregroundColor: theme.dividerColor,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      // ****** Border color *******
                      side: BorderSide(
                        color: theme.colorScheme.background,
                        width: 0.75,
                      ),
                    ),
                    child: controller.numberList[index] == "*"
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              controller.numberList.length - 1 == index
                                  ? const Icon(FontAwesomeIcons.check,
                                      color: Colors.white)
                                  : const Icon(FontAwesomeIcons.deleteLeft,
                                      color: Colors.white),
                            ],
                          )
                        : MyCustomText(
                            controller.numberList[index],
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                  ),
                ),
              )),
    );
  }
}
