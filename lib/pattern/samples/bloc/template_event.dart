import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class TemplateEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TemplateEventStartFetch extends TemplateEvent {
  final String url;
  TemplateEventStartFetch(this.url);
}

class TemplateEventFinishDownload extends TemplateEvent {
  final Image image;
  TemplateEventFinishDownload(this.image);
}
