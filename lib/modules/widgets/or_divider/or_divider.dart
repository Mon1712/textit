import 'package:chateo/utils/constants/dimens/screen_pixels/screen_pixels.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key, this.dividerColor, this.titleColor,
  });
  final Color? dividerColor;
  final Color? titleColor;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(child: Divider(
        color: dividerColor,
        indent: ScreenPixels.ten,
        endIndent: ScreenPixels.twenty,
      )),
      Text("OR", style: TextStyle(fontSize: ScreenPixels.fourteen, color: titleColor, fontWeight: FontWeight.w900),),
      Expanded(child: Divider(
        color: dividerColor,
        indent: ScreenPixels.twenty,
        endIndent: ScreenPixels.ten,)),
    ],);
  }
}