import 'package:flutter/material.dart';

class CListViewBuilder extends StatelessWidget {
  const CListViewBuilder(
      {super.key, required this.itemCount, required this.itemBuilder, required this.separatorBuilder, this.padding, this.scrollDirection = Axis
          .vertical, this.physics, this.controller,  this.reverse = false});

  final Widget? Function(BuildContext, int) itemBuilder;
  final int itemCount;
  final Widget Function(BuildContext, int) separatorBuilder;
  final EdgeInsetsGeometry? padding;
  final Axis scrollDirection;
  final ScrollPhysics? physics;
  final ScrollController? controller;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        controller: controller,
        reverse: reverse,
        scrollDirection: scrollDirection,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 10),
        shrinkWrap: true,
        physics: physics ?? const NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        separatorBuilder: separatorBuilder,
        itemBuilder: itemBuilder);
  }
}
