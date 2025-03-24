import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/viewer/items/element.dart';
import 'package:rubric/src/rubric_editor/viewer/items/position.dart';
import 'package:rubric/src/rubric_editor/viewer/items/scalar.dart';

class ElementHandlerWidget extends StatelessWidget {
  final ElementModel element;
  const ElementHandlerWidget({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    final style = RubricEditorStyle.of(context);
    final editorState = RubricEditorState.of(context);
    return RubricPositioned.fromElement(
      element: element,
      // height: element.height + ScalarWidget.scalarSize,
      // width: element.width + ScalarWidget.scalarSize,
      // x: element.x - ScalarWidget.scalarSize * 0.5,
      // y: element.y - ScalarWidget.scalarSize * 0.5,

      child: ElementHandlerRenderObjectWidget(
        element: element,
        child: Visibility(
          visible: editorState.edits.isSelected(element),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Positioned.fill(child: Container(color: Colors.amber)),
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 0,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: style.theme),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: ScalarWidget(element: element, scalarIndex: 0),
              ),
              Align(
                alignment: Alignment.topRight,
                child: ScalarWidget(element: element, scalarIndex: 1),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: ScalarWidget(element: element, scalarIndex: 2),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ScalarWidget(element: element, scalarIndex: 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
