import 'package:flutter/material.dart';
import 'package:toolset/toolset.dart';

class GridCountSample extends StatefulWidget {
  @override
  _GridCountSampleState createState() => _GridCountSampleState();
}

class _GridCountSampleState extends State<GridCountSample> {
  final _items = <String>[];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 50; i++) {
      _items.add('item $i');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('${widget.runtimeType}')),
        body: createWidget(context));
  }

  Widget createWidget(final BuildContext context) {
    return GridView.count(
        crossAxisCount: 3,
        children: _items
            .enumerated((i, e) => Container(
                color: Colors.primaries[i % Colors.primaries.length],
                child: Center(child: Text(_items[i]))))
            .toList());
  }
}
