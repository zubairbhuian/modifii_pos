import 'package:flutter/material.dart';
import 'package:flutter_base/app/widgets/my_custom_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../services/controller/config_controller.dart';
import '../../entryPoint/widgets/my_time.dart';

class StartupView extends StatelessWidget {
  const StartupView({
    super.key,
    required this.onTap,
    required this.isOnTop,
  });

  final VoidCallback onTap;
  final bool isOnTop;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    width: 300,
                    ConfigController.to.isLightTheme
                        ? 'assets/images/splash/logo_light.svg'
                        : 'assets/images/splash/logo_dark.svg',
                  ),
                  Switch(
                    value: ConfigController.to.isLightTheme,
                    onChanged: (value) => ConfigController.to.toggleTheme(),
                    activeColor: Theme.of(context).colorScheme.background,
                    trackColor: MaterialStateProperty.all(Colors.transparent),
                    trackOutlineColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.background,
                    ),
                  ),
                ],
              ),
              Center(
                child: AnimatedOpacity(
                  opacity: isOnTop ? 1.0 : 0.25,
                  duration: const Duration(milliseconds: 300),
                  child: SvgPicture.asset(
                    width: MediaQuery.sizeOf(context).height * 0.7,
                    "assets/images/splash/login_logo.svg",
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MyCustomText(
                    'Version: 0.23.1',
                    fontSize: 36,
                    fontWeight: FontWeight.w400,
                  ),
                  MyTime(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
