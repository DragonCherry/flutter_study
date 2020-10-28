import 'package:flutter/material.dart';

class StepperSample extends StatefulWidget {
  @override
  _StepperSampleState createState() => _StepperSampleState();
}

class _StepperSampleState extends State<StepperSample> {
  final _steps = <Step>[];
  int _current = 0;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      _steps.add(
          Step(title: Text('Step $i'), content: Text('Content for Step $i')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('${widget.runtimeType}')),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          createSample(context),
        ])));
  }

  Widget createSample(final BuildContext context) {
    if (_current >= _steps.length) {
      return Center(child: Text('Finished Process.'));
    } else if (_current < 0) {
      return Center(
          child: ElevatedButton(
        child: Text('Press to start process.'),
        onPressed: () {
          setState(() {
            _current += 1;
          });
        },
      ));
    } else {
      return Stepper(
        steps: _steps,
        //controlsBuilder: (context, {onStepCancel, onStepContinue}) {},
        currentStep: _current,
        onStepTapped: (value) {},
        onStepContinue: () {
          setState(() {
            _current += 1;
          });
        },
        onStepCancel: () {
          setState(() {
            _current -= 1;
          });
        },
      );
    }
  }
}
