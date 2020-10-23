import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../sample_types.dart';

class UnderDevelopmentWidget extends StatelessWidget {
  final List<String> items =
      WidgetDisplayType.values.map((e) => stringify(e)).toList();

  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
        appBar: AppBar(title: Text(runtimeType.toString())),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.construction),
          SizedBox(height: 10),
          Text('This sample is under development.'),
        ])));
    return scaffold;
  }
}
