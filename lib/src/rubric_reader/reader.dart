import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rubric/src/models/canvas.dart';
import 'package:rubric/src/models/editor_models.dart';
import 'package:rubric/src/rubric_editor/models/preview.dart';
import 'package:rubric/src/rubric_editor/sidebar/sidebar.dart';
import 'package:rubric/src/rubric_editor/viewer/items/element.dart';
import 'package:rubric/src/rubric_editor/viewer/stack/element_stack.dart';

class RubricReader extends StatelessWidget {
  final CanvasModel canvasModel;
  const RubricReader({
    super.key,
    required this.canvasModel,
  });

  @override
  Widget build(BuildContext context) {
    final double pageHeight = canvasModel.readerPageHeight();
    return LayoutBuilder(
      builder: (context, constraints) {
        Offset stackOffset;
        if (constraints.maxWidth < GridSizes.pageSize) {
          stackOffset = Offset.zero;
        } else {
          final w = (constraints.maxWidth - GridSizes.pageSize) / 2;
          stackOffset = Offset(w, min(w, sidebarButtonHeight));
        }
        ViewModes curView = constraints.maxWidth < GridSizes.pageSize
            ? ViewModes.mobile
            : ViewModes.desktop;
        return SingleChildScrollView(
          child: Container(
            height: pageHeight,
            width: double.infinity,
            padding: curView == ViewModes.desktop
                ? EdgeInsets.symmetric(vertical: GridSizes.padding)
                : null,
            color: canvasModel.settings.canvasColor,
            alignment: Alignment.center,
            child: RubricElementStack(
              offset: stackOffset,
              children: [
                ColoredBox(
                  color: canvasModel.settings.canvasColor,
                ),
                for (var element in canvasModel.elements)
                  ReaderElementWidget(
                    viewMode: curView,
                    key: ValueKey(element.id),
                    element: element,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
