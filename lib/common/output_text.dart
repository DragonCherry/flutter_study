import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class OutputText extends StatelessWidget {
  final String text;

  const OutputText(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: 17, color: Colors.indigo));
  }
}
