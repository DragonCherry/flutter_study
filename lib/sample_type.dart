enum SampleCategoryType { widget, package, pattern, technique }

enum WidgetSampleType {
  grid_count_sample,
  grid_extent_sample,
  horizontal_list_sample,
}

enum TechniqueSampleType {
  sliver_basic_sample,
  sliver_grid_sample,
  sliver_grid_delegate_sample,
  sliver_persistent_header_sample,
  flexible_space_bar_sample,
  sliver_tab_bar_sample
}

enum PackageSampleType {
  lru_image_cache,
  overlayer,
  text_size,
  mini_log,
  toolset
}

enum PatternSampleType { bloc }

String stringify(final dynamic object) {
  return object.toString().split('.').last;
}
