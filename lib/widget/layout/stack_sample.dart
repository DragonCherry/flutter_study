import 'package:flutter/material.dart';
import 'package:toolset/toolset.dart';

class StackSample extends StatefulWidget {
  @override
  _StackSampleState createState() => _StackSampleState();
}

class _StackSampleState extends State<StackSample> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final body = GridView.count(
        crossAxisCount: 1,
        children: [firstStackSample(), secondStackSample(width)]);
    return Scaffold(
        appBar: AppBar(title: Text('${widget.runtimeType}')), body: body);
  }

  Stack firstStackSample() {
    return Stack(children: [
      Container(color: Colors.white),
      Opacity(
          opacity: 0.5,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(const Radius.circular(30))),
            child: Center(child: CircularProgressIndicator()),
          ))
    ]);
  }

  Stack secondStackSample(final double width) {
    final diff = width / Colors.primaries.length;
    final children = Colors.primaries
        .enumerated((i, e) => Center(
            child: Container(
                width: width - diff * i, height: width - diff * i, color: e)))
        .toList();
    return Stack(children: children);
  }
}
