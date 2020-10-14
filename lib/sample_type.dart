enum SampleCategoryType { widget, package, pattern, technique }
enum WidgetSampleType {
  grid_count_sample,
  horizontal_list_sample,
  sliver_app_bar_sample,
  sliver_persistent_header_sample
}
enum PackageSampleType {
  lru_image_cache,
  overlayer,
  text_size,
  mini_log,
  toolset
}
enum TechniqueSampleType { tbd }
enum PatternSampleType { bloc }

String stringify(final dynamic object) {
  return object.toString().split('.').last;
}
