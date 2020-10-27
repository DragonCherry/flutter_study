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
  bottom_navigation_bar_sample,
  drawer_sample,
  tab_bar_sample,
}

enum WidgetButtonType {
  button_bar_sample,
  dropdown_button_sample,
  outline_button_sample,
  popup_menu_button_sample,
}

enum WidgetInputType {
  slider_sample,
  calendar_picker_sample,
}

enum WidgetModalType {
  alert_dialog_sample,
  bottom_sheet_sample,
}

enum WidgetDisplayType {
  grid_count_sample,
  grid_extent_sample,
  horizontal_list_sample,
}

enum WidgetLayoutType {
  stack_sample,
  align_sample,
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
