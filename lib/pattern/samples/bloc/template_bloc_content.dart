import 'package:examples/pattern/samples/bloc/template_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lru_image_cache/lru_image_cache.dart';
//import 'package:overlayer/overlayer.dart';

import 'template_bloc.dart';
import 'template_state.dart';

class TemplateBlocContent extends StatefulWidget {
  @override
  _TemplateBlocContentState createState() => _TemplateBlocContentState();
}

class _TemplateBlocContentState extends State<TemplateBlocContent> {
  TemplateBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.bloc();
  }

  @override
  void dispose() {
    super.dispose();
    LRUImageCache.shared.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TemplateBloc, TemplateState>(builder: (context, state) {
      final background = Color.fromRGBO(255, 255, 255, 1);
      final url = 'https://homepages.cae.wisc.edu/~ece533/images/mountain.png';
      final children = <Widget>[Center(child: Text('${state.toString()}'))];
      final edge = MediaQuery.of(context).size.width * 0.6;
      final constraints = BoxConstraints(maxHeight: edge, maxWidth: edge);

      final placeholder = Container(
          width: edge,
          height: edge,
          color: background,
          child: Center(child: Text('Image Placeholder')));

      if (state is TemplateStateImage) {
        children
            .add(ConstrainedBox(constraints: constraints, child: state.image));
      } else if (state is TemplateStateFetching) {
        children.add(placeholder.dimmed(child: CircularProgressIndicator()));
      } else {
        children.add(placeholder);
      }

      children.add(RaisedButton(
          child: Text('Fetch Image'),
          onPressed: () {
            _bloc.add(TemplateEventStartFetch(url));
          }));

      return Column(
          children: children, mainAxisAlignment: MainAxisAlignment.spaceEvenly);
    });
  }
}

extension WidgetOverlayable on Widget {
  Widget dimmed(
      {final Color color = Colors.black,
      final double alpha = 0.5,
      final Widget child,
      final Alignment alignment = Alignment.center}) {
    return Stack(children: [
      this,
      Positioned.fill(
          child: Opacity(
              opacity: alpha,
              child: Container(
                  color: color,
                  child: Align(child: child, alignment: alignment))))
    ]);
  }

  Widget overlaid(
      {@required final Widget child,
      final Alignment alignment = Alignment.center}) {
    return Stack(children: [this, Align(child: child, alignment: alignment)]);
  }
}
