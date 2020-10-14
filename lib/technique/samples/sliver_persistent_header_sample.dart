import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mini_log/mini_log.dart';

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

    for (int i = 0; i < 50; i++) {
      _items.add('item $i');
    }
  }

  @override
  Widget build(BuildContext context) {
    final sliverPersistentHeader = SliverPersistentHeader(
        floating: true,
        pinned: true,
        delegate: CustomSliverPersistentHeaderDelegate());

    final scrollView = CustomScrollView(controller: _controller, slivers: [
      sliverPersistentHeader,
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Container(
            height: 100,
            color: Colors.primaries[index % Colors.primaries.length],
            child: Center(child: Text(_items[index])));
      }, childCount: _items.length))
    ]);

    return Scaffold(backgroundColor: Colors.black, body: scrollView);
  }
}

class CustomSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  final double _expandedHeight = 300;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    logd('shrinkOffset: $shrinkOffset, overlapsContent: $overlapsContent');
    return Container(
        height: _expandedHeight,
        child: Image.network('https://www.gstatic.com/webp/gallery/1.jpg',
            fit: BoxFit.cover));
  }

  @override
  double get maxExtent => _expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
