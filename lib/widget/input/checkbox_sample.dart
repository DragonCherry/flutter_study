import 'package:examples/common/output_text.dart';
import 'package:flutter/material.dart';

class CheckboxSample extends StatefulWidget {
  @override
  _CheckboxSampleState createState() => _CheckboxSampleState();
}

class _CheckboxSampleState extends State<CheckboxSample> {
  final _options = <String>[];
  final _isChecked = <bool>[];
  String _value;
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      _options.add('Option $i');
      _isChecked.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('${widget.runtimeType}')),
        body: SafeArea(
            child: Column(mainAxisSize: MainAxisSize.max, children: [
          Expanded(child: createWidget(context)),
          SizedBox(height: 20),
          Container(child: OutputText(_value ?? ''))
        ])));
  }

  Widget createWidget(final BuildContext context) {
    return ListView.separated(
      itemCount: _options.length,
      itemBuilder: (context, index) {
        return CheckboxListTile(
            title: Text(_options[index]),
            subtitle: Text('Subtitle for ${_options[index]}'),
            value: _isChecked[index],
            onChanged: (value) {
              setState(() {
                _isChecked[index] = value;
                _value = _isChecked.toString();
              });
            });
      },
      separatorBuilder: (context, index) {
        return Container(height: 0.5, color: Colors.grey.shade300);
      },
    );
  }
}
