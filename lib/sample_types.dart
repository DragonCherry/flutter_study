enum SampleCategoryType { widget, application, pattern }

/* Widget Types */
enum WidgetCategoryType {
  structure,
  button,
  input,
  modal,
  display,
  layout,
}

enum WidgetStructureType {
  tbd,
}

enum WidgetButtonType {
  tbd,
}

enum WidgetInputType {
  slider_sample,
}

enum WidgetModalType {
  calendar_picker_sample,
}

enum WidgetDisplayType {
  grid_count_sample,
  grid_extent_sample,
  horizontal_list_sample,
}

enum WidgetLayoutType {
  stack_sample,
}

/* Practice Types */

enum ApplicationSampleType {
  sliver_basic_sample,
  sliver_grid_sample,
  sliver_grid_delegate_sample,
  sliver_persistent_header_sample,
  flexible_space_bar_sample,
  sliver_overlap_sample,
  sliver_tab_bar_sample
}

enum PatternSampleType { bloc }

String stringify(final dynamic object) {
  return object.toString().split('.').last;
}
