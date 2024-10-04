import 'package:chateo/modules/widgets/cached_image/cached_network_image/cached_network_image.dart';
import 'package:chateo/utils/constants/dimens/screen_height/screen_height.dart';
import 'package:flutter/material.dart';

class CustomCacheImage extends StatelessWidget {
  final double ?height;
  final double ?width;
  final double ?radius;
  final double ?imageRadius;
  final double ?paddingValue;
  final Widget ?child;
  final Color ? color;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final String image;
  final BoxFit? fit;
  final Color ? borderColor;
  final Function()? onTap;
  final void Function(TapDownDetails)? onTapDown;

  const CustomCacheImage({
    super.key,
    this.height,
    this.width,
    this.child,
    this.imageRadius,
    this.color,
    this.paddingValue,
    this.radius,
    this.margin,
    this.borderColor,
    this.fit,
    required this.image,
    this.padding, this.onTap, this.onTapDown
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onTapDown: onTapDown,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        padding: padding??EdgeInsets.all(paddingValue??0),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius??ScreenHeight.fourHundred),
            border: Border.all(color: borderColor?? Colors.transparent)
        ),  child: CustomCacheNetworkImage(img: image,
        imageRadius:imageRadius,
        fit:fit,),          ),
    );
  }
}