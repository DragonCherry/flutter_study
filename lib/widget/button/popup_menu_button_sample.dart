import 'package:flutter/material.dart';

class PopupMenuButtonSample extends StatefulWidget {
  @override
  _PopupMenuButtonSampleState createState() => _PopupMenuButtonSampleState();
}

class _PopupMenuButtonSampleState extends State<PopupMenuButtonSample> {
  final _menus = <String>[];
  String _value;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      _menus.add('Menu $i');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.runtimeType}'),
          actions: [createWidget(context)],
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          _value == null ? Text('Do action.') : Text('Action result: $_value'),
        ])));
  }

  Widget createWidget(final BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String result) {
        setState(() {
          _value = result;
        });
      },
      itemBuilder: (BuildContext context) =>
          _menus.map((e) => PopupMenuItem(value: e, child: Text(e))).toList(),
    );
  }
}
