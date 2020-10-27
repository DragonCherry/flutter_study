import 'package:flutter/material.dart';
import 'package:toolset/toolset.dart';

class GridExtentSample extends StatefulWidget {
  @override
  _GridExtentSampleState createState() => _GridExtentSampleState();
}

class _GridExtentSampleState extends State<GridExtentSample> {
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
        appBar: AppBar(title: Text('GridExtentSample')),
        body: createWidget(context));
  }

  Widget createWidget(final BuildContext context) {
    final constrainedWidth = MediaQuery.of(context).size.width;
    return GridView.extent(
        maxCrossAxisExtent: constrainedWidth / 3,
        childAspectRatio: 1,
        children: _items
            .enumerated((i, e) => Container(
                color: Colors.primaries[i % Colors.primaries.length],
                child: Center(child: Text(_items[i]))))
            .toList());
  }
}
