import 'package:flutter/material.dart';

class AlertDialogSample extends StatefulWidget {
  @override
  _AlertDialogSampleState createState() => _AlertDialogSampleState();
}

class _AlertDialogSampleState extends State<AlertDialogSample> {
  String _pressed;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('${widget.runtimeType}')),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _pressed == null
                ? Text('Show dialog and press button.')
                : Text('Pressed button index: $_pressed'),
            SizedBox(height: 10),
            ElevatedButton(
                child: Text('Show simple dialog'),
                onPressed: () {
                  showSimpleDialog();
                }),
            SizedBox(height: 10),
            ElevatedButton(
                child: Text('Show long message dialog'),
                onPressed: () {
                  showLongDialog();
                }),
            SizedBox(height: 10),
            ElevatedButton(
                child: Text('Show dialog with 3 buttons'),
                onPressed: () {
                  show3ButtonDialog();
                }),
            SizedBox(height: 10),
            ElevatedButton(
                child: Text('Show dialog with 4 buttons'),
                onPressed: () {
                  show4ButtonDialog();
                }),
          ],
        )));
  }

  void showSimpleDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                setState(() {
                  _pressed = 'OK';
                  Navigator.of(context).pop();
                });
              },
            )
          ],
        );
      },
    );
  }

  void showLongDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Repeatitive long dialog message content.'),
                Text('Repeatitive long dialog message content.'),
                Text('Repeatitive long dialog message content.'),
                Text('Repeatitive long dialog message content.'),
                Text('Repeatitive long dialog message content.'),
                Text('Repeatitive long dialog message content.'),
                Text('Repeatitive long dialog message content.'),
                Text('Repeatitive long dialog message content.'),
                Text('Repeatitive long dialog message content.'),
                Text('Repeatitive long dialog message content.'),
                Text('Repeatitive long dialog message content.'),
                Text('Repeatitive long dialog message content.'),
                Text('Repeatitive long dialog message content.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                setState(() {
                  _pressed = 'Approve';
                  Navigator.of(context).pop();
                });
              },
            ),
            TextButton(
              child: Text('Decline'),
              onPressed: () {
                setState(() {
                  _pressed = 'Decline';
                  Navigator.of(context).pop();
                });
              },
            )
          ],
        );
      },
    );
  }

  void show3ButtonDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Button 1'),
              onPressed: () {
                setState(() {
                  _pressed = 'Button 1';
                  Navigator.of(context).pop();
                });
              },
            ),
            TextButton(
              child: Text('Button 2'),
              onPressed: () {
                setState(() {
                  _pressed = 'Button 2';
                  Navigator.of(context).pop();
                });
              },
            ),
            TextButton(
              child: Text('Button 3'),
              onPressed: () {
                setState(() {
                  _pressed = 'Button 3';
                  Navigator.of(context).pop();
                });
              },
            )
          ],
        );
      },
    );
  }

  void show4ButtonDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Button 1'),
              onPressed: () {
                setState(() {
                  _pressed = 'Button 1';
                  Navigator.of(context).pop();
                });
              },
            ),
            TextButton(
              child: Text('Button 2'),
              onPressed: () {
                setState(() {
                  _pressed = 'Button 2';
                  Navigator.of(context).pop();
                });
              },
            ),
            TextButton(
              child: Text('Button 3'),
              onPressed: () {
                setState(() {
                  _pressed = 'Button 3';
                  Navigator.of(context).pop();
                });
              },
            ),
            TextButton(
              child: Text('Button 4'),
              onPressed: () {
                setState(() {
                  _pressed = 'Button 4';
                  Navigator.of(context).pop();
                });
              },
            )
          ],
        );
      },
    );
  }
}
