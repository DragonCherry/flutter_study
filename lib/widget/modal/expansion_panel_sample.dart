import 'package:flutter/material.dart';
import 'package:toolset/toolset.dart';

class ExpansionPanelSample extends StatefulWidget {
  @override
  _ExpansionPanelSampleState createState() => _ExpansionPanelSampleState();
}

class ExpansionItemModel {
  final String value;
  bool isExpanded = false;

  ExpansionItemModel(this.value);
}

class _ExpansionPanelSampleState extends State<ExpansionPanelSample> {
  final _items = <ExpansionItemModel>[];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 30; i++) {
      _items.add(ExpansionItemModel('item $i'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('${widget.runtimeType}')),
        body: Container(child: createWidget(context)));
  }

  Widget createWidget(final BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: ExpansionPanelList(
          expansionCallback: (panelIndex, isExpanded) {
            setState(() {
              _items[panelIndex].isExpanded = !isExpanded;
            });
          },
          children: _items
              .enumerated((i, e) => ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                          title: Text('Header ${e.value} (${e.isExpanded})'));
                    },
                    body: ListTile(
                      title: Text('Content for ${e.value}'),
                      subtitle: Text('Touch trash can to delete.'),
                      trailing: Icon(Icons.delete),
                      onTap: () {
                        setState(() {
                          _items.removeAt(i);
                        });
                      },
                    ),
                    isExpanded: e.isExpanded,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
