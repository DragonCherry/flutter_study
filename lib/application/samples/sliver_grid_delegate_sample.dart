import 'package:sliver_widget/sliver_widget.dart';
import 'package:flutter/material.dart';
import 'package:toolset/toolset.dart';

class SliverGridDelegateSample extends StatefulWidget {
  @override
  _SliverGridDelegateSampleState createState() =>
      _SliverGridDelegateSampleState();
}

class _SliverGridDelegateSampleState extends State<SliverGridDelegateSample> {
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
        elevation: 0,
        centerTitle: false,
        title: SliverWidget(
            child: Text('${widget.runtimeType}'),
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
                child: Text('${widget.runtimeType}'),
                isFadeByPositionRatio: true,
                visibility: SliverWidgetVisibility.visibleWhenExpanded),
            background: Image.network(
                'https://www.gstatic.com/webp/gallery/1.jpg',
                fit: BoxFit.cover)));

    final gridView = SliverGrid(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        delegate: SliverChildBuilderDelegate((context, i) {
          return Container(
              color: Colors.primaries[i % Colors.primaries.length],
              child: Center(child: Text(_items[i])));
        }, childCount: _items.length));

    final scrollView = CustomScrollView(
        controller: _controller, slivers: [sliverAppBar, gridView]);

    return Scaffold(backgroundColor: Colors.black, body: scrollView);
  }
}
