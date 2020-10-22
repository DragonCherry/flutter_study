import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class TemplateState extends Equatable {
  @override
  List<Object> get props => [];
}

class TemplateStateInitial extends TemplateState {}

class TemplateStateFetching extends TemplateState {}

class TemplateStateImage extends TemplateState {
  final Image image;
  TemplateStateImage(this.image);
}

class TemplateStateError extends TemplateState {
  final Error error;
  TemplateStateError(this.error);
}
