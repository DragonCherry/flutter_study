import 'package:examples/package/package_list.dart';
import 'package:examples/pattern/pattern_list.dart';
import 'package:examples/root_list.dart';
import 'package:examples/widget/widget_list.dart';
import 'package:flutter/material.dart';

import 'package/samples/lru_image_cache.dart';
import 'package/samples/mini_log.dart';
import 'package/samples/overlayer.dart';
import 'package/samples/text_size.dart';
import 'package/samples/toolset.dart';
import 'technique/technique_list.dart';

void main() {
  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: 'root', routes: {
      'root': (_) => RootList(),

      /* Widget List & Samples */
      'widget': (_) => WidgetList(),

      /* Package List & Samples */
      'package': (_) => PackageList(),
      'lru_image_cache': (_) => LRUImageCachePackageSample(),
      'overlayer': (_) => OverlayerPackageSample(),
      'text_size': (_) => TextSizePackageSample(),
      'mini_log': (_) => MiniLogPackageSample(),
      'toolset': (_) => ToolsetPackageSample(),

      /* Pattern List & Samples */
      'pattern': (_) => PatternList(),

      /* Technique List & Samples */
      'technique': (_) => TechniqueList(),
    });
  }
}
