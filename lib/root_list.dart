import 'package:flutter/material.dart';
import 'package:toolset/toolset.dart';

class RootList extends StatelessWidget {
  final List<String> categories = ['package', 'pattern', 'widget', 'technique'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Master Example',
              style: Theme.of(context).textTheme.headline5),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: categories
                .enumerated((i, e) => Expanded(
                    child: Container(
                        color: Colors.blueGrey,
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(categories[i]);
                            },
                            child: Center(
                                child: Text(e,
                                    style:
                                        Theme.of(context).textTheme.button))))))
                .toList()));
  }
}
