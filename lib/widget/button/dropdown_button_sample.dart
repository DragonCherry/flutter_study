import 'package:flutter/material.dart';

class DropdownButtonSample extends StatefulWidget {
  @override
  _DropdownButtonSampleState createState() => _DropdownButtonSampleState();
}

class _DropdownButtonSampleState extends State<DropdownButtonSample> {
  String _value;
  final _options = <String>[];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 5; i++) {
      _options.add('Option $i');
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(title: Text('${widget.runtimeType}')),
        body: Center(
            child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: width * 0.5),
                child: createWidget(context))));
  }

  Widget createWidget(final BuildContext context) {
    return DropdownButton(
      value: _value,
      hint: Text('Select this option.'),
      isDense: false,
      autofocus: true,
      icon: Icon(Icons.arrow_circle_down),
      iconSize: 24,
      elevation: 8,
      onChanged: (value) {
        setState(() {
          _value = value;
        });
      },
      items: _options
          .map((e) => DropdownMenuItem(child: Text(e), value: e))
          .toList(),
      dropdownColor: Colors.amber.shade100,
      isExpanded: true,
    );
  }
}
