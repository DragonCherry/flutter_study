import 'package:flutter/material.dart';

class TemplateForSample extends StatefulWidget {
  @override
  _TemplateForSampleState createState() => _TemplateForSampleState();
}

class _TemplateForSampleState extends State<TemplateForSample> {
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
          createWidget(context)
        ])));
  }

  Widget createWidget(final BuildContext context) {
    return ElevatedButton(
        child: Text('Show simple dialog'),
        onPressed: () {
          action('Did something.');
        });
  }

  void action(final String value) {
    setState(() {
      _value = value;
    });
  }
}
