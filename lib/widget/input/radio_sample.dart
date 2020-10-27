import 'package:examples/common/output_text.dart';
import 'package:flutter/material.dart';

class RadioSample extends StatefulWidget {
  @override
  _RadioSampleState createState() => _RadioSampleState();
}

class _RadioSampleState extends State<RadioSample> {
  final _options = <String>[];
  String _value;
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      _options.add('Option $i');
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
        return RadioListTile(
            title: Text(_options[index]),
            subtitle: Text('Subtitle for ${_options[index]}'),
            value: _options[index],
            groupValue: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            });
      },
      separatorBuilder: (context, index) {
        return Container(height: 0.5, color: Colors.grey.shade300);
      },
    );
  }
}
