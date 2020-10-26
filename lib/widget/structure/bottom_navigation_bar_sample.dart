import 'package:flutter/material.dart';
import 'package:toolset/toolset.dart';

class BottomNavigationBarSample extends StatefulWidget {
  @override
  _BottomNavigationBarSampleState createState() =>
      _BottomNavigationBarSampleState();
}

class _BottomNavigationBarSampleState extends State<BottomNavigationBarSample>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  final int _tabCount = 5;
  final _tabs = [];
  int _index = 0;
  final _values = <double>[];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _tabCount; i++) {
      _tabs.add('Tab $i');
      _values.add(0);
    }
    _controller = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final contentViews = _tabs
        .enumerated((i, e) => Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                  Center(child: Text('Content View for $e')),
                  Container(
                      height: 50,
                      child: Slider(
                        value: _values[i],
                        min: 0,
                        max: 1000,
                        divisions: 1000,
                        label: _values[i].round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _values[i] = value;
                          });
                        },
                      ))
                ])))
        .toList();

    return Scaffold(
        appBar: AppBar(title: Text('${widget.runtimeType}')),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            backgroundColor: Colors.white,
            currentIndex: _index,
            onTap: (index) {
              setState(() {
                this._index = index;
              });
            },
            items: _tabs
                .map((e) => BottomNavigationBarItem(
                    backgroundColor: Colors.green.shade100,
                    icon: Icon(
                      Icons.airplanemode_inactive,
                      color: Colors.green,
                    ),
                    activeIcon: Icon(
                      Icons.airplanemode_active,
                      color: Colors.red,
                    ),
                    label: e))
                .toList()),
        body: SafeArea(child: contentViews[_index]));
  }
}
