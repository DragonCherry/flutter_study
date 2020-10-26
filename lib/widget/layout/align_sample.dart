import 'package:flutter/material.dart';

class AlignSample extends StatefulWidget {
  @override
  _AlignSampleState createState() => _AlignSampleState();
}

class _AlignSampleState extends State<AlignSample> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('${widget.runtimeType}')),
        body: SafeArea(
            child: Stack(children: [
          Positioned.fill(child: Container(color: Colors.green.shade100)),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue.shade200,
                  child: Center(child: Text('topCenter')))),
          Align(
              alignment: Alignment.topLeft,
              child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue.shade200,
                  child: Center(child: Text('topLeft')))),
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue.shade200,
                child: Center(child: Text('centerLeft')),
              )),
          Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue.shade200,
                child: Center(child: Text('bottomLeft')),
              )),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue.shade200,
                child: Center(child: Text('bottomCenter')),
              )),
          Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue.shade200,
                child: Center(child: Text('topRight')),
              )),
          Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue.shade200,
                child: Center(child: Text('bottomRight')),
              )),
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue.shade200,
                child: Center(child: Text('centerRight')),
              )),
          Align(
              alignment: Alignment.center,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue.shade200,
                child: Center(child: Text('center')),
              )),
        ])));
  }
}
