import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PackageList extends StatelessWidget {
  final List<String> items = [
    'toolset',
    'text_size',
    'overlayer',
    'lru_image_cache',
    'mini_log'
  ];

  @override
  Widget build(BuildContext context) {
    final listView = ListView.separated(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(items[index]),
              onTap: () {
                Navigator.of(context).pushNamed('${items[index]}');
              });
        },
        separatorBuilder: (context, index) {
          return Divider();
        });

    Scaffold scaffold = Scaffold(
        appBar: AppBar(title: Text(runtimeType.toString())), body: listView);

    return scaffold;
  }
}
