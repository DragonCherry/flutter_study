import 'package:flutter/material.dart';
import 'package:mini_log/mini_log.dart';
import 'package:toolset/toolset.dart';

class SliverPersistentHeaderSample extends StatefulWidget {
  @override
  _SliverPersistentHeaderSampleState createState() =>
      _SliverPersistentHeaderSampleState();
}

class _SliverPersistentHeaderSampleState
    extends State<SliverPersistentHeaderSample> {
  final _items = <String>[];
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 18; i++) {
      _items.add('item $i');
    }
  }

  SliverPersistentHeader createHeader(final String title) {
    return SliverPersistentHeader(
        pinned: true,
        delegate: CustomSliverPersistentHeaderDelegate(
            child: Container(
                color: Colors.blueAccent, child: Center(child: Text(title))),
            minHeight: kToolbarHeight,
            maxHeight: 150));
  }

  @override
  Widget build(BuildContext context) {
    final topView = SliverGrid.count(
        crossAxisCount: 3,
        children: _items
            .enumerated((i, e) => Container(
                color: Colors.primaries[i % Colors.primaries.length],
                child: Center(child: Text(_items[i]))))
            .toList());

    final middleView = SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      return Container(
          height: 50,
          color: Colors.primaries[index % Colors.primaries.length],
          child: Center(child: Text(_items[index])));
    }, childCount: _items.length));

    final bottomView = SliverGrid.count(
        crossAxisCount: 3,
        children: _items
            .enumerated((i, e) => Container(
                color: Colors.primaries[i % Colors.primaries.length],
                child: Center(child: Text(_items[i]))))
            .toList());

    final scrollView = CustomScrollView(controller: _controller, slivers: [
      createHeader('Top Header'),
      topView,
      createHeader('Middle Header'),
      middleView,
      createHeader('Bottom Header'),
      bottomView,
    ]);

    return Scaffold(backgroundColor: Colors.black, body: scrollView);
  }
}

class CustomSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  CustomSliverPersistentHeaderDelegate(
      {this.minHeight, this.maxHeight, this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    logd('shrinkOffset: $shrinkOffset, overlapsContent: $overlapsContent');
    return child;
  }

  @override
  double get maxExtent => minHeight < maxHeight ? maxHeight : minHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(
      covariant CustomSliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
