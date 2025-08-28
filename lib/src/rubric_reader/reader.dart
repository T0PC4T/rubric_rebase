import 'package:flutter/material.dart';
import 'package:rubric/src/models/canvas.dart';
import 'package:rubric/src/rubric_editor/models/preview.dart';
import 'package:rubric/src/rubric_editor/sidebar/sidebar.dart';
import 'package:rubric/src/rubric_editor/viewer/items/handler.dart';

class RubricReader extends StatefulWidget {
  final CanvasModel canvas;
  const RubricReader({
    super.key,
    required this.canvas,
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
      color: widget.canvas.settings.canvasColor,
      child: LayoutBuilder(builder: (context, constraints) {
        print(constraints.maxWidth);
        final viewMode = constraints.maxWidth <= ViewModes.mobile.width
            ? ViewModes.mobile
            : ViewModes.desktop;

        return ListView.builder(
          itemCount: widget.canvas.elements.length,
          shrinkWrap: true,
          addAutomaticKeepAlives: false,
          addRepaintBoundaries: false,
          addSemanticIndexes: false,
          padding: EdgeInsets.symmetric(
              vertical: sidebarButtonHeight,
              horizontal: (constraints.maxWidth - viewMode.width) / 2),
          itemBuilder: (context, index) {
            return ReaderElementWidget(
              element: widget.canvas.elements[index],
            );
          },
        );
      }),
    );
  }
}
