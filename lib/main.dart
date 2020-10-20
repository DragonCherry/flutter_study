import 'package:examples/package/package_list.dart';
import 'package:examples/pattern/pattern_list.dart';
import 'package:examples/root_list.dart';
import 'package:examples/sample_type.dart';
import 'package:examples/widget/samples/grid_count_sample.dart';
import 'package:examples/widget/widget_list.dart';
import 'package:flutter/material.dart';
import 'package:mini_log/mini_log.dart';

import 'package/samples/lru_image_cache.dart';
import 'package/samples/mini_log.dart';
import 'package/samples/overlayer.dart';
import 'package/samples/text_size.dart';
import 'package/samples/toolset.dart';
import 'technique/samples/flexible_space_bar_sample.dart';
import 'technique/samples/sliver_grid_delegate_sample.dart';
import 'technique/technique_list.dart';
import 'widget/samples/grid_extent_sample.dart';
import 'widget/samples/horizontal_list_sample.dart';
import 'technique/samples/sliver_grid_sample.dart';
import 'technique/samples/sliver_basic_sample.dart';
import 'technique/samples/sliver_persistent_header_sample.dart';

void main() {
  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    logd(SampleCategoryType.package.toString());
    return MaterialApp(initialRoute: 'root', routes: {
      'root': (_) => RootList(),

      /* Widget List & Samples */
      stringify(SampleCategoryType.widget): (_) => WidgetList(),
      stringify(WidgetSampleType.grid_count_sample): (_) => GridCountSample(),
      stringify(WidgetSampleType.grid_extent_sample): (_) => GridExtentSample(),
      stringify(WidgetSampleType.horizontal_list_sample): (_) =>
          HorizontalListSample(),

      /* Technique List & Samples */
      stringify(SampleCategoryType.technique): (_) => TechniqueList(),
      stringify(TechniqueSampleType.sliver_basic_sample): (_) =>
          SliverBasicSample(),
      stringify(TechniqueSampleType.sliver_grid_sample): (_) =>
          SliverGridSample(),
      stringify(TechniqueSampleType.sliver_grid_delegate_sample): (_) =>
          SliverGridDelegateSample(),
      stringify(TechniqueSampleType.sliver_persistent_header_sample): (_) =>
          SliverPersistentHeaderSample(),
      stringify(TechniqueSampleType.flexible_space_bar_sample): (_) =>
          FlexibleSpaceBarSample(),

      /* Package List & Samples */
      stringify(SampleCategoryType.package): (_) => PackageList(),
      stringify(PackageSampleType.lru_image_cache): (_) =>
          LRUImageCachePackageSample(),
      stringify(PackageSampleType.overlayer): (_) => OverlayerPackageSample(),
      stringify(PackageSampleType.text_size): (_) => TextSizePackageSample(),
      stringify(PackageSampleType.mini_log): (_) => MiniLogPackageSample(),
      stringify(PackageSampleType.toolset): (_) => ToolsetPackageSample(),

      /* Pattern List & Samples */
      stringify(SampleCategoryType.pattern): (_) => PatternList(),
    });
  }
}
