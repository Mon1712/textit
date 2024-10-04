import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCacheNetworkImage extends StatelessWidget {
  final String img;
  final double? size;
  final double? height;
  final double? width;
  final double? imageRadius;
  final BoxFit? fit;

  const CustomCacheNetworkImage({
    super.key,
    required this.img,
    this.size,
    this.height,
    this.width,
    this.fit,
    this.imageRadius,
  });

  @override
  Widget build(BuildContext context) {
    if (img.contains("assets/")) {
      return SizedBox(
        height: height,
        width: width,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(img),
        ),
      );
    }

    return ((img == '') || (img == '-') || (img.isEmpty))
        ? SizedBox(
      height: height,
      width: width,
      child: const CircleAvatar(
        backgroundColor: Color.fromRGBO(0, 0, 0, 0),
      ),
    )
        : Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      child: img.contains(".svg")
          ? SvgPicture.network(
        img,
        placeholderBuilder: (context) => const Icon(
          CupertinoIcons.person,
          color: Colors.white,
          size: 50,
        ),
      )
          : CachedNetworkImage(
        imageUrl: img,
        imageBuilder: (context, imageProvider) => Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: imageRadius != null
                ? BorderRadius.circular(imageRadius ?? 0)
                : null,
            image: DecorationImage(
              image: imageProvider,
              fit: fit??BoxFit.cover,
            ),
          ),
        ),
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return SizedBox(
            height: height,
            width: width,
            child: Center(
              child: CircularProgressIndicator(
                value: downloadProgress.progress,
              ),
            ),
          );
        },
        errorWidget: (context, url, error) => ClipRRect(
          borderRadius: BorderRadius.circular(imageRadius ?? 10),
          child: const Icon(
            CupertinoIcons.person,
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
    );
  }
}
