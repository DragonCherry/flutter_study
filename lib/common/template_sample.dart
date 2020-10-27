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
          createSample(context)
        ])));
  }

  Widget createSample(final BuildContext context) {
    return ElevatedButton(
        child: Text('Show simple dialog'),
        onPressed: () {
          setState(() {
            _value = 'Changed!';
          });
        });
  }
}
