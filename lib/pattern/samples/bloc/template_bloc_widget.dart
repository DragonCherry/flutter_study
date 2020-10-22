import 'package:examples/pattern/samples/bloc/template_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'template_bloc.dart';
import 'template_bloc_content.dart';

class TemplateBlocWidget extends StatefulWidget {
  @override
  _TemplateBlocWidgetState createState() => _TemplateBlocWidgetState();
}

class _TemplateBlocWidgetState extends State<TemplateBlocWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.runtimeType}')),
      body: BlocProvider(
          create: (_) => TemplateBloc(TemplateStateInitial()),
          child: TemplateBlocContent()),
    );
  }
}
