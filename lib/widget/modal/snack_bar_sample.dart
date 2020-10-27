import 'package:flutter/material.dart';
import 'package:mini_log/mini_log.dart';

class SnackBarSample extends StatefulWidget {
  @override
  _SnackBarSampleState createState() => _SnackBarSampleState();
}

class _SnackBarSampleState extends State<SnackBarSample> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('${widget.runtimeType}')),
        body: Builder(builder: (context) {
          return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                ElevatedButton(
                    onPressed: () {
                      Scaffold.of(context).showSnackBar(createWidget(context));
                    },
                    child: Text('Show SnackBar')),
                SizedBox(height: 10)
              ]));
        }));
  }

  Widget createWidget(final BuildContext context) {
    return SnackBar(
        content: Container(
            color: Colors.grey,
            height: 100,
            child: Center(child: Text('Content Area'))),
        action: SnackBarAction(
          label: 'SnackBarAction 1',
          onPressed: () {
            logd('onPressed SnackBarAction!');
          },
        ));
  }
}
