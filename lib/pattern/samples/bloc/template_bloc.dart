import 'package:flutter/widgets.dart';
import 'package:lru_image_cache/lru_image_cache.dart';

import 'template_event.dart';
import 'template_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TemplateBloc extends Bloc<TemplateEvent, TemplateState> {
  final imageCache = LRUImageCache.shared;
  TemplateBloc(TemplateState initialState) : super(initialState);

  @override
  Stream<TemplateState> mapEventToState(TemplateEvent event) async* {
    if (event is TemplateEventStartFetch) {
      yield TemplateStateFetching();
      final future = imageCache.fetchImage(url: event.url, fit: BoxFit.cover);
      future.then((image) {
        add(TemplateEventFinishDownload(image));
      });
      return;
    }

    if (event is TemplateEventFinishDownload) {
      yield TemplateStateImage(event.image);
      return;
    }
  }
}
