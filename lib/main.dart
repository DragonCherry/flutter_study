import 'package:examples/pattern/pattern_list.dart';
import 'package:examples/root_list.dart';
import 'package:examples/sample_type.dart';
import 'package:examples/widget/samples/grid_count_sample.dart';
import 'package:examples/widget/widget_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mini_log/mini_log.dart';

import 'pattern/samples/bloc/template_bloc_widget.dart';

import 'application/samples/flexible_space_bar_sample.dart';
import 'application/samples/sliver_grid_delegate_sample.dart';
import 'application/samples/sliver_overlap_sample.dart';
import 'application/samples/sliver_tabbar_sample.dart';
import 'application/application_list.dart';
import 'application/samples/sliver_grid_sample.dart';
import 'application/samples/sliver_basic_sample.dart';
import 'application/samples/sliver_persistent_header_sample.dart';

import 'widget/samples/grid_extent_sample.dart';
import 'widget/samples/horizontal_list_sample.dart';
import 'widget/samples/stack_sample.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: 'root', routes: {
      'root': (_) => RootList(),

      /* Widget List */
      stringify(SampleCategoryType.widget): (_) => WidgetList(),
      /* Widget Samples */
      stringify(WidgetSampleType.grid_count_sample): (_) => GridCountSample(),
      stringify(WidgetSampleType.grid_extent_sample): (_) => GridExtentSample(),
      stringify(WidgetSampleType.horizontal_list_sample): (_) =>
          HorizontalListSample(),
      stringify(WidgetSampleType.stack_sample): (_) => StackSample(),

      /* Technique List */
      stringify(SampleCategoryType.application): (_) => ApplicationList(),
      /* Technique Samples */
      stringify(ApplicationSampleType.sliver_basic_sample): (_) =>
          SliverBasicSample(),
      stringify(ApplicationSampleType.sliver_grid_sample): (_) =>
          SliverGridSample(),
      stringify(ApplicationSampleType.sliver_grid_delegate_sample): (_) =>
          SliverGridDelegateSample(),
      stringify(ApplicationSampleType.sliver_persistent_header_sample): (_) =>
          SliverPersistentHeaderSample(),
      stringify(ApplicationSampleType.flexible_space_bar_sample): (_) =>
          FlexibleSpaceBarSample(),
      stringify(ApplicationSampleType.sliver_overlap_sample): (_) =>
          SliverOverlapSample(),
      stringify(ApplicationSampleType.sliver_tab_bar_sample): (_) =>
          SliverTabBarSample(),

      /* Pattern List & Samples */
      stringify(SampleCategoryType.pattern): (_) => PatternList(),
      /* Pattern Samples */
      stringify(PatternSampleType.bloc): (_) => TemplateBlocWidget(),
    });
  }
}
