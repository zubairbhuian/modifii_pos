import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/app/widgets/my_custom_text.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import 'startup_view.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Obx(
        () => Stack(
          alignment: Alignment.center,
          children: [
            StartupView(
              onTap: () => controller.toggleStartup(false),
              isOnTop: controller.isStartup.value,
            ),
            AnimatedOpacity(
              opacity: controller.isStartup.value ? 0 : 1,
              duration: const Duration(milliseconds: 300),
              child: IgnorePointer(
                ignoring: controller.isStartup.value,
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.20,
                  height: MediaQuery.sizeOf(context).height * 0.85,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // password display
                      _passwordDisplay(theme),
                      const SizedBox(height: 14),
                      // keybord area
                      _customKeybord(theme),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _passwordDisplay(ThemeData theme) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 26),
      decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: theme.colorScheme.background,
            width: 1.75,
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
                    radius: 10,
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
                      controller.toggleStartup(false);
                      AudioPlayer().play(AssetSource('audio/tap_sound_1.mp3'));
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
                          fontSize: 36),
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
                        width: 1.75,
                      ),
                    ),
                    child: controller.numberList[index] == "*"
                        ? controller.numberList.length - 1 == index
                            ? const Icon(FontAwesomeIcons.check,
                                color: Colors.white, size: 36)
                            : const Icon(FontAwesomeIcons.deleteLeft,
                                color: Colors.white, size: 36)
                        : MyCustomText(
                            controller.numberList[index],
                            fontSize: 42,
                            fontWeight: FontWeight.w700,
                          ),
                  ),
                ),
              )),
    );
  }
}
