import 'package:examples/common/under_development.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'sample_types.dart';
import 'root_list.dart';

import 'pattern/pattern_list.dart';
import 'pattern/samples/bloc/template_bloc_widget.dart';

import 'application/application_list.dart';
import 'application/samples/flexible_space_bar_sample.dart';
import 'application/samples/sliver_grid_delegate_sample.dart';
import 'application/samples/sliver_overlap_sample.dart';
import 'application/samples/sliver_tabbar_sample.dart';
import 'application/samples/sliver_grid_sample.dart';
import 'application/samples/sliver_basic_sample.dart';
import 'application/samples/sliver_persistent_header_sample.dart';

import 'widget/button_list.dart';
import 'widget/display_list.dart';
import 'widget/input_list.dart';
import 'widget/layout/align_sample.dart';
import 'widget/layout_list.dart';
import 'widget/modal/alert_dialog_sample.dart';
import 'widget/modal/bottom_sheet_sample.dart';
import 'widget/modal_list.dart';
import 'widget/structure/drawer_sample.dart';
import 'widget/structure_list.dart';
import 'widget/widget_category_list.dart';
import 'widget/display/grid_count_sample.dart';
import 'widget/display/grid_extent_sample.dart';
import 'widget/display/horizontal_list_sample.dart';
import 'widget/layout/stack_sample.dart';
import 'widget/input/slider_sample.dart';
import 'widget/input/calendar_picker_sample.dart';

void main() {
  //debugPaintSizeEnabled = true;
  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget {
  UnderDevelopmentWidget get developmentWidget {
    return UnderDevelopmentWidget();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: 'root', routes: {
      'root': (_) => RootList(),

      /* Widget List */
      stringify(SampleCategoryType.widget): (_) => WidgetCategoryList(),

      /* Widget Category List */
      stringify(WidgetCategoryType.structure): (_) => WidgetStructureList(),
      stringify(WidgetCategoryType.button): (_) => WidgetButtonList(),
      stringify(WidgetCategoryType.input): (_) => WidgetInputList(),
      stringify(WidgetCategoryType.modal): (_) => WidgetModalList(),
      stringify(WidgetCategoryType.display): (_) => WidgetDisplayList(),
      stringify(WidgetCategoryType.layout): (_) => WidgetLayoutList(),

      /* Widget Samples */
      // Structure
      stringify(WidgetStructureType.drawer_sample): (_) => DrawerSample(),
      // Button
      stringify(WidgetButtonType.tbd): (_) => developmentWidget,
      // Input
      stringify(WidgetInputType.slider_sample): (_) => SliderSample(),
      stringify(WidgetInputType.calendar_picker_sample): (_) =>
          CalendarPickerSample(),
      // Modal
      stringify(WidgetModalType.alert_dialog_sample): (_) =>
          AlertDialogSample(),
      stringify(WidgetModalType.bottom_sheet_sample): (_) =>
          BottomSheetSample(),
      // Display
      stringify(WidgetDisplayType.grid_count_sample): (_) => GridCountSample(),
      stringify(WidgetDisplayType.grid_extent_sample): (_) =>
          GridExtentSample(),
      stringify(WidgetDisplayType.horizontal_list_sample): (_) =>
          HorizontalListSample(),
      // Layout
      stringify(WidgetLayoutType.stack_sample): (_) => StackSample(),
      stringify(WidgetLayoutType.align_sample): (_) => AlignSample(),

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
