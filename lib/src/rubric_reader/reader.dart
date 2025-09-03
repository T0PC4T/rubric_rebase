import 'package:flutter/material.dart';
import 'package:rubric/src/models/canvas.dart';
import 'package:rubric/src/rubric_editor/models/preview.dart';
import 'package:rubric/src/rubric_editor/sidebar/sidebar.dart';
import 'package:rubric/src/rubric_editor/viewer/items/handler.dart';

class RubricReader extends StatefulWidget {
  final CanvasModel canvasModel;
  const RubricReader({
    super.key,
    required this.canvasModel,
  });

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
      child: LayoutBuilder(builder: (context, constraints) {
        final viewMode = constraints.maxWidth <= ViewModes.mobile.width
            ? ViewModes.mobile
            : ViewModes.desktop;

        return ListView.builder(
          itemCount: widget.canvasModel.elements.length,
          shrinkWrap: true,
          addAutomaticKeepAlives: false,
          addRepaintBoundaries: false,
          addSemanticIndexes: false,
          padding: EdgeInsets.symmetric(
              vertical: sidebarButtonHeight,
              horizontal: (constraints.maxWidth - viewMode.width) / 2),
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsetsGeometry.symmetric(
                    horizontal: widget.canvasModel.settings.spacing,
                    vertical: widget.canvasModel.settings.spacing),
                child: ReaderElementWidget(
                  canvas: widget.canvasModel,
                  element: widget.canvasModel.elements[index],
                ),
              );
            }

            return Padding(
              padding: EdgeInsets.only(
                  left: widget.canvasModel.settings.spacing,
                  right: widget.canvasModel.settings.spacing,
                  bottom: widget.canvasModel.settings.spacing),
              child: ReaderElementWidget(
                canvas: widget.canvasModel,
                element: widget.canvasModel.elements[index],
              ),
            );
          },
        );
      }),
    );
  }
}
