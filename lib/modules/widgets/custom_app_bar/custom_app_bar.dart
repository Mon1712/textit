import 'package:chateo/utils/constants/dimens/screen_pixels/screen_pixels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CAppBar(
      {super.key, this.title, this.centerTitle = false, this.backgroundColor, this.leading, this.backArrowVisible = true, this.actions, this.leadingWidth, this.titleWidget, this.iconColor, this.toolbarHeight});

  final String? title;
  final bool? centerTitle;
  final Color? backgroundColor;
  final Widget? leading;
  final Widget? titleWidget;
  final bool backArrowVisible;
  final List<Widget>? actions;
  final double? leadingWidth;
  final Color? iconColor;
  final double? toolbarHeight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      surfaceTintColor: Colors.transparent,
      backgroundColor: backgroundColor ?? Colors.transparent,
      title: titleWidget??Text(title ?? "", style:  TextStyle(
          color: Colors.white, fontSize: ScreenPixels.twenty, fontWeight: FontWeight.w500),),
      centerTitle: centerTitle,
      leading: leading ?? (backArrowVisible ? IconButton(onPressed: () {
        Get.back();
      }, icon:  Icon(Icons.arrow_back,color:iconColor ,)) : null),
      actions: actions,
      leadingWidth: leadingWidth,
toolbarHeight: toolbarHeight,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
