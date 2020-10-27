import 'package:examples/common/output_text.dart';
import 'package:flutter/material.dart';

class ButtonBarSample extends StatefulWidget {
  @override
  _ButtonBarSampleState createState() => _ButtonBarSampleState();
}

class _ButtonBarSampleState extends State<ButtonBarSample> {
  String _value;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final body = Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      OutputText(
          _value == null ? 'Touch button on card.' : 'Touched \'$_value\''),
      FractionallySizedBox(
          widthFactor: 0.8,
          child: Card(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.album),
                title: Text('Title on card.'),
                subtitle: Text('Subtitle on card.'),
              ),
              createWidget(context)
            ],
          )))
    ]));
    return Scaffold(
        appBar: AppBar(title: Text('${widget.runtimeType}')), body: body);
  }

  Widget createWidget(final BuildContext context) {
    return ButtonBar(children: [
      TextButton(
        child: Text('Option 1'),
        onPressed: () {
          setState(() {
            _value = 'Option 1';
          });
        },
      ),
      TextButton(
        child: Text('Option 2'),
        onPressed: () {
          setState(() {
            _value = 'Option 2';
          });
        },
      ),
      TextButton(
        child: Text('Option 3'),
        onPressed: () {
          setState(() {
            _value = 'Option 3';
          });
        },
      ),
    ]);
  }
}
