import 'package:flutter/material.dart';

class StikcyTabBarDelegate extends SliverPersistentHeaderDelegate{

  final TabBar child;

  final double minHeight;
  final double maxHeight;

  /// 构造方法
  StikcyTabBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
//    return new SizedBox.expand(child: child);
    return new Container(
      color: Colors.white,
      child: child,
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(StikcyTabBarDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}