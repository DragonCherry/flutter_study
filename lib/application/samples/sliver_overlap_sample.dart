import 'package:flutter/material.dart';

class SliverOverlapSample extends StatefulWidget {
  @override
  _SliverOverlapSampleState createState() => _SliverOverlapSampleState();
}

class _SliverOverlapSampleState extends State<SliverOverlapSample> {
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
        centerTitle: false,
        expandedHeight: _expandedHeight,
        stretch: true,
        floating: true,
        pinned: true,
        snap: false,
        flexibleSpace: FlexibleSpaceBar(
            centerTitle: false,
            title: Text('${widget.runtimeType}'),
            background: Image.network(
                'https://www.gstatic.com/webp/gallery/1.jpg',
                fit: BoxFit.cover)));

    final scrollView = NestedScrollView(
      controller: _controller,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: sliverAppBar,
          ),
        ];
      },
      body: SafeArea(
        top: false,
        bottom: false,
        child: Builder(
          builder: (BuildContext context) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverOverlapInjector(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  return Container(
                      height: 100,
                      color: Colors.primaries[index % Colors.primaries.length],
                      child: Center(child: Text(_items[index])));
                }, childCount: _items.length))
              ],
            );
          },
        ),
      ),
    );

    return Scaffold(backgroundColor: Colors.black, body: scrollView);
  }
}
