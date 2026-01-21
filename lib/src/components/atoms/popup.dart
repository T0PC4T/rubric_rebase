import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';

class PopupWidget<T> extends StatefulWidget {
  static double popWidth = 380;
  static Future<T?> showPopup<T>(BuildContext context, Widget Function(Function(T value) closeWith) builder) {
    final completer = Completer<T?>();

    RubricEditorState.of(context).pushOverlay(PopupWidget(builder: builder, completer: completer));
    return completer.future;
  }

  final Widget Function(Function(T value) closeWith) builder;
  final Completer<T?> completer;
  const PopupWidget({super.key, required this.builder, required this.completer});

  @override
  State<PopupWidget<T>> createState() => _PopupWidgetState<T>();
}

class _PopupWidgetState<T> extends State<PopupWidget<T>> {
  void onCompleter(T value) {
    widget.completer.complete(value);
    RubricEditorState.of(context).popOverlay();
  }

  @override
  Widget build(BuildContext context) {
    final style = RubricEditorStyle.of(context);
    return GestureDetector(
      onTap: () {
        widget.completer.complete(null);
        RubricEditorState.of(context).popOverlay();
      },
      child: Container(
        color: style.fore.withAlpha(20),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () => {},
          child: Container(
            padding: RubricEditorStyle.padding,
            decoration: BoxDecoration(color: style.back, borderRadius: style.borderRadius),
            child: SingleChildScrollView(child: widget.builder(onCompleter)),
          ),
        ),
      ),
    );
  }
}
