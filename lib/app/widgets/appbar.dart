import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final VoidCallback? onLeading;
  final double? preferredHeight;
  final List<Widget>? actions;
  final bool isShadow;
  final bool centerTitle;

  final bool hasActionBtn;
  final void Function()? actionBtnOnTap;
  final String actionBtnText;

  const CustomAppBar(
      {super.key,
      this.isShadow = false,
      this.centerTitle = false,
      this.title,
      this.onLeading,
      this.preferredHeight,
      this.actions,
      this.hasActionBtn = false,
      this.actionBtnOnTap,
      this.actionBtnText = 'Text'});
// Specify the desired height of the AppBar
  @override
  Size get preferredSize => Size.fromHeight(preferredHeight ?? 66.0);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return AppBar(
      automaticallyImplyLeading: true,
      titleSpacing:24,
      elevation: 0,
      centerTitle: centerTitle,
      leadingWidth: 80,
      backgroundColor: const Color(0xffF2F8FD),
      // foregroundColor: kTextColor,
      // titleTextStyle: kTitleLarge.copyWith(color: const Color(0xff2F2F2F)),
      // appbar leading
    
      // appbar title
      title: title?? SvgPicture.asset(width: 200, 'assets/images/splash/logo_light.svg'),
      // appbar actions),
      actions: [
             InkWell(
      onTap: () {},
      splashFactory: NoSplash.splashFactory,
      child: const Icon(
        Icons.menu,
        size: 40,
      ),
    ),
    const SizedBox(width: 24),
      ],
    );
  }
}
