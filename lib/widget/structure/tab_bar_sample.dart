import 'package:flutter/material.dart';

class TabBarSample extends StatefulWidget {
  @override
  _TabBarSampleState createState() => _TabBarSampleState();
}

class _TabBarSampleState extends State<TabBarSample>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  final _tabs = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      _tabs.add('Tab $i');
    }
    _controller = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final tabBar = TabBar(
        tabs: _tabs.map((e) => Text(e)).toList(),
        controller: _controller,
        indicatorColor: Colors.pink);
    final contentViews = _tabs.map((e) => Center(child: Text(e))).toList();

    return Scaffold(
        appBar: AppBar(title: Text('${widget.runtimeType}')),
        bottomNavigationBar: Container(
            color: Colors.blue,
            child: SafeArea(
                child:
                    Container(height: 60, color: Colors.blue, child: tabBar))),
        body: TabBarView(controller: _controller, children: contentViews));
  }
}
