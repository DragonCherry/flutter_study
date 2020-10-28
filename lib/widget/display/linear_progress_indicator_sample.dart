import 'package:flutter/material.dart';
import 'dart:async';

import 'package:mini_log/mini_log.dart';

class LinearProgressIndicatorSample extends StatefulWidget {
  @override
  _LinearProgressIndicatorSampleState createState() =>
      _LinearProgressIndicatorSampleState();
}

class _LinearProgressIndicatorSampleState
    extends State<LinearProgressIndicatorSample> {
  double _value = 0;
  Timer runningTimer;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('${widget.runtimeType}')),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          createSample(context),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text('Press to start.'),
            onPressed: () {
              if (runningTimer != null) {
                runningTimer.cancel();
                runningTimer = null;
                setState(() {
                  _value = 0;
                });
              }
              runningTimer =
                  Timer.periodic(Duration(milliseconds: 1000), (Timer timer) {
                logd('${timer.tick}');
                if (timer.tick >= 10) {
                  timer.cancel();
                }
                setState(() {
                  _value = timer.tick / 10;
                });
              });
            },
          )
        ])));
  }

  Widget createSample(final BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: Colors.grey.shade100,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
      value: _value,
    );
  }
}
