import 'package:flutter/material.dart';

class HorizontalListSample extends StatefulWidget {
  @override
  _HorizontalListSampleState createState() => _HorizontalListSampleState();
}

class _HorizontalListSampleState extends State<HorizontalListSample> {
  final _items = <String>[];
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      //logd('${_controller.position.pixels}');
    });

    for (int i = 0; i < 10; i++) {
      _items.add('item $i');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('HorizontalListSample')),
        body: Container(height: 200, child: createWidget(context)));
  }

  Widget createWidget(final BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final edge = (width * 0.1).toInt().toDouble();
    return ListView.builder(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.fromLTRB(edge, 0, edge, 0),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Container(
              width: width * 0.8,
              color: Colors.primaries[index % Colors.primaries.length],
              child: Center(child: Text(_items[index])));
        });
  }
}
