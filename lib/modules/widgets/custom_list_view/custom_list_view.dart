import 'package:flutter/material.dart';

class CListViewBuilder extends StatelessWidget {
  const CListViewBuilder(
      {super.key, required this.itemCount, required this.itemBuilder,  required this.separatorBuilder, this.padding,  this.scrollDirection = Axis.vertical, this.physics});

  final Widget? Function(BuildContext, int) itemBuilder;
  final int itemCount;
  final Widget Function(BuildContext, int) separatorBuilder;
  final EdgeInsetsGeometry? padding;
  final Axis scrollDirection;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: scrollDirection,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 10),
        shrinkWrap: true,
        physics: physics ?? const NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        separatorBuilder: separatorBuilder,
        itemBuilder: itemBuilder);
  }
}
