import 'package:flutter/material.dart';

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
    final body = GridView.count(
        crossAxisCount: 3,
        children: List.generate(
            _items.length,
            (index) => Padding(
                padding: EdgeInsets.all(0.5),
                child: Container(
                    color: Colors.primaries[index % Colors.primaries.length],
                    child: Center(child: Text(_items[index]))))));
    return Scaffold(appBar: AppBar(title: Text('GridCountSample')), body: body);
  }
}
