import 'package:examples/common/sliver_widget.dart';
import 'package:flutter/material.dart';

class SliverAppBarGridSample extends StatefulWidget {
  @override
  _SliverAppBarGridSampleState createState() => _SliverAppBarGridSampleState();
}

class _SliverAppBarGridSampleState extends State<SliverAppBarGridSample> {
  final _items = <String>[];
  final _controller = ScrollController();
  final double _expandedHeight = 300;

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 50; i++) {
      _items.add('item $i');
    }
  }

  @override
  Widget build(BuildContext context) {
    final sliverAppBar = SliverAppBar(
        //backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: SliverWidget(
            child: Text('SliverAppBarGridSample'),
            isFadeByPositionRatio: false,
            visibility: SliverWidgetVisibility.visibleWhenCollapsed),
        expandedHeight: _expandedHeight,
        stretch: true,
        floating: true,
        pinned: true,
        snap: false,
        flexibleSpace: FlexibleSpaceBar(
            centerTitle: false,
            title: SliverWidget(
                child: Text('SliverAppBarGridSample'),
                isFadeByPositionRatio: true,
                visibility: SliverWidgetVisibility.visibleWhenExpanded),
            background: Image.network(
                'https://www.gstatic.com/webp/gallery/1.jpg',
                fit: BoxFit.cover)));

    final scrollView = CustomScrollView(controller: _controller, slivers: [
      sliverAppBar,
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
