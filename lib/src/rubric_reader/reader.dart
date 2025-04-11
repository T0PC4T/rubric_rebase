import 'package:flutter/material.dart';
import 'package:rubric/src/models/canvas.dart';
import 'package:rubric/src/models/editor_models.dart';
import 'package:rubric/src/rubric_editor/models/preview.dart';
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
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: canvasModel.settings.canvasColor,
      constraints: BoxConstraints.expand(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          ViewModes curView = constraints.maxWidth < GridSizes.pageSize
              ? ViewModes.mobile
              : ViewModes.desktop;
          return SingleChildScrollView(
            child: Container(
              padding: curView == ViewModes.desktop
                  ? EdgeInsets.symmetric(vertical: GridSizes.padding)
                  : EdgeInsets.all(0),
              alignment:
                  curView == ViewModes.desktop ? Alignment.topCenter : null,
              child: FittedBox(
                fit: curView == ViewModes.desktop
                    ? BoxFit.none
                    : BoxFit.fitWidth,
                child: SizedBox(
                  width: curView.width,
                  child: RubricElementStack(
                    offset: Offset.zero,
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
              ),
            ),
          );
        },
      ),
    );
  }
}
