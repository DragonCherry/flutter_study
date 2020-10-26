import 'package:flutter/material.dart';

class DrawerSample extends StatefulWidget {
  @override
  _DrawerSampleState createState() => _DrawerSampleState();
}

class _DrawerSampleState extends State<DrawerSample> {
  String _value;
  @override
  void initState() {
    super.initState();
  }

  Drawer _createFloatingHeaderDrawer() {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
      DrawerHeader(
          decoration: BoxDecoration(color: Colors.blue),
          child: Text('FloatingHeaderDrawer',
              style: TextStyle(color: Colors.white, fontSize: 24))),
      ListTile(leading: Icon(Icons.message), title: Text('Message')),
      ListTile(leading: Icon(Icons.account_circle), title: Text('Profile')),
      ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
    ]));
  }

  Drawer _createPinnedHeaderDrawer() {
    return Drawer(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
          Container(
              height: 200,
              child: DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Text('PinnedHeaderDrawer',
                      style: TextStyle(color: Colors.white, fontSize: 24)))),
          Expanded(
              child: ListView(padding: EdgeInsets.zero, children: [
            ListTile(leading: Icon(Icons.message), title: Text('Message')),
            ListTile(
                leading: Icon(Icons.account_circle), title: Text('Profile')),
            ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
          ]))
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('${widget.runtimeType}')),
        drawer: _createFloatingHeaderDrawer(),
        endDrawer: _createPinnedHeaderDrawer(),
        body: null);
  }

  void action() {
    setState(() {
      _value = 'Did something.';
    });
  }
}
