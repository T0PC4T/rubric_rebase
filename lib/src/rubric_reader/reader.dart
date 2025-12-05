import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rubric/src/models/canvas.dart';
import 'package:rubric/src/rubric_editor/models/preview.dart';
import 'package:rubric/src/rubric_editor/viewer/items/handler.dart';

class RubricReader extends StatefulWidget {
  final CanvasModel canvasModel;
  final Widget? onFinished;
  const RubricReader({super.key, required this.canvasModel, this.onFinished});

  @override
  State<RubricReader> createState() => _RubricReaderState();
}

class _RubricReaderState extends State<RubricReader> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.canvasModel.settings.canvasColor,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final viewMode = constraints.maxWidth <= ViewModes.mobile.width ? ViewModes.mobile : ViewModes.desktop;

          return ListView.builder(
            itemCount: widget.onFinished != null
                ? widget.canvasModel.elements.length + 1
                : widget.canvasModel.elements.length,
            shrinkWrap: true,
            addAutomaticKeepAlives: false,
            addRepaintBoundaries: false,
            addSemanticIndexes: false,
            padding: EdgeInsets.symmetric(
              vertical: max(widget.canvasModel.settings.spacing / 2, 50),
              horizontal:
                  max(25, (constraints.maxWidth - viewMode.width) / 2) + widget.canvasModel.settings.spacing / 2,
            ),
            itemBuilder: (context, index) {
              if (index == widget.canvasModel.elements.length) {
                return widget.onFinished!;
              }
              return ReaderElementWidget(canvas: widget.canvasModel, element: widget.canvasModel.elements[index]);
            },
          );
        },
      ),
    );
  }
}
