import 'package:flutter/material.dart';
import 'package:mini_log/mini_log.dart';

class TextFieldSample extends StatefulWidget {
  @override
  _TextFieldSampleState createState() => _TextFieldSampleState();
}

class _TextFieldSampleState extends State<TextFieldSample> {
  final _sample1Controller = TextEditingController();
  final _sample2Controller = TextEditingController();
  final _sample3Controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _sample1Controller.dispose();
    _sample2Controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.runtimeType}')),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          child: Center(
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    createSample1(context),
                    SizedBox(height: 20),
                    createSample2(context),
                    SizedBox(height: 20),
                    createSample3(context),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget createSample1(final BuildContext context) {
    return TextField(
        controller: _sample1Controller,
        onTap: () {
          logd('onTap');
        },
        onEditingComplete: () {
          logd('onEditingComplete: ${_sample1Controller.text}');
          setState(() {
            _sample1Controller.clear();
            FocusScope.of(context).unfocus();
          });
        },
        onChanged: (value) {
          logd('onChanged: $value');
        },
        decoration: InputDecoration(hintText: 'Plain sample.'));
  }

  Widget createSample2(final BuildContext context) {
    return TextField(
      controller: _sample2Controller,
      onTap: () {
        logd('onTap');
      },
      onEditingComplete: () {
        logd('onEditingComplete: ${_sample2Controller.text}');
        setState(() {
          _sample2Controller.clear();
          FocusScope.of(context).unfocus();
        });
      },
      onChanged: (value) {
        logd('onChanged: $value');
      },
      decoration: InputDecoration(hintText: 'Obscure text here.'),
      obscureText: true,
    );
  }

  Widget createSample3(final BuildContext context) {
    return TextField(
      controller: _sample3Controller,
      onTap: () {
        logd('onTap');
      },
      onEditingComplete: () {
        logd('onEditingComplete: ${_sample3Controller.text}');
        setState(() {
          _sample3Controller.clear();
          FocusScope.of(context).unfocus();
        });
      },
      onChanged: (value) {
        logd('onChanged: $value');
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(),
          errorBorder: OutlineInputBorder(),
          disabledBorder: OutlineInputBorder(),
          hintText: 'OutlineInputBorder'),
      obscureText: true,
    );
  }
}
