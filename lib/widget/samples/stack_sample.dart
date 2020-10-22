import 'package:flutter/material.dart';

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
    final body = GridView.count(crossAxisCount: 2, children: [
      Stack(children: [
        Container(color: Colors.white),
        Opacity(
            opacity: 0.5,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(const Radius.circular(30))),
              child: Center(child: CircularProgressIndicator()),
            ))
      ]),
      Stack(children: [
        Container(color: Colors.white),
        Opacity(
            opacity: 0.5,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(const Radius.circular(30))),
              child: Center(child: CircularProgressIndicator()),
            ))
      ])
    ]);
    return Scaffold(
        appBar: AppBar(title: Text('${widget.runtimeType}')), body: body);
  }
}
