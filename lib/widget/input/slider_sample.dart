import 'package:flutter/material.dart';

class SliderSample extends StatefulWidget {
  @override
  _SliderSampleState createState() => _SliderSampleState();
}

class _SliderSampleState extends State<SliderSample> {
  double _currentSliderValue = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(title: Text('${widget.runtimeType}')),
        body: Center(
            child: Container(
                width: width, height: 50, child: createWidget(context))));
  }

  Widget createWidget(final BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      min: 0,
      max: 1000,
      divisions: 1000,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}
