import 'package:flutter/material.dart';

class OutlineButtonSample extends StatefulWidget {
  @override
  _OutlineButtonSampleState createState() => _OutlineButtonSampleState();
}

class _OutlineButtonSampleState extends State<OutlineButtonSample> {
  String _value;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('${widget.runtimeType}')),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          _value == null ? Text('Do action.') : Text('Action result: $_value'),
          SizedBox(height: 10),
          createWidget(context),
        ])));
  }

  Widget createWidget(final BuildContext context) {
    return OutlineButton(
        child: Text('Show simple dialog'),
        onLongPress: () {
          setState(() {
            _value = 'Long pressed!';
          });
        },
        onPressed: () {
          setState(() {
            _value = 'Pressed!';
          });
        });
  }
}
