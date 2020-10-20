import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sliver_widget/sliver_widget.dart';

class SliverTabBarSample extends StatefulWidget {
  @override
  _SliverTabBarSampleState createState() => _SliverTabBarSampleState();
}

class _SliverTabBarSampleState extends State<SliverTabBarSample>
    with SingleTickerProviderStateMixin {
  final _items = <String>[];
  final _tabs = <String>['Tab 1', 'Tab 2', 'Tab 3'];
  TabController controller;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 18; i++) {
      _items.add('item $i');
    }
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: _tabs.length,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  title: Text('${widget.runtimeType}'),
                  centerTitle: false,
                  pinned: true,
                  floating: true,
                  expandedHeight: 250,
                  forceElevated: innerBoxIsScrolled,
                  flexibleSpace: FlexibleSpaceBar(
                      background: Image.network(
                          'https://www.gstatic.com/webp/gallery/1.jpg',
                          fit: BoxFit.cover)),
                  bottom: TabBar(
                    tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: _tabs.map((String name) {
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      key: PageStorageKey<String>(name),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                        ),
                        SliverList(
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                          return Container(
                              height: 100,
                              color: Colors
                                  .primaries[index % Colors.primaries.length],
                              child: Center(child: Text(_items[index])));
                        }, childCount: _items.length))
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
