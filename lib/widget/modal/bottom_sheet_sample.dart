import 'package:flutter/material.dart';

class BottomSheetSample extends StatefulWidget {
  @override
  _BottomSheetSampleState createState() => _BottomSheetSampleState();
}

class _BottomSheetSampleState extends State<BottomSheetSample> {
  String _pressed;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(_) {
    return Scaffold(
        appBar: AppBar(title: Text('${widget.runtimeType}')),
        body: Builder(builder: (context) {
          return Center(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(height: 20),
            _pressed == null
                ? Text('Do action.')
                : Text('Action result: $_pressed'),
            SizedBox(height: 10),
            ElevatedButton(
                child: Text('Show bottom sheet'),
                onPressed: () {
                  showNormalSampleBottomSheet(context);
                }),
            SizedBox(height: 10),
            ElevatedButton(
                child: Text('Show modal bottom sheet'),
                onPressed: () {
                  showModalSampleBottomSheet(context);
                })
          ]));
        }));
  }

  void showNormalSampleBottomSheet(final BuildContext context) {
    showBottomSheet(
        context: context,
        builder: (context) {
          return createSheetContent(context);
        });
  }

  void showModalSampleBottomSheet(final BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return createSheetContent(context);
        });
  }

  Widget createSheetContent(final BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.width * 0.7,
      color: Colors.amber,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  setState(() {
                    _pressed = 'OK';
                    Navigator.pop(context);
                  });
                }),
            ElevatedButton(
                child: const Text('Cancel'),
                onPressed: () {
                  setState(() {
                    _pressed = 'Cancel';
                    Navigator.pop(context);
                  });
                })
          ],
        ),
      ),
    );
  }
}
