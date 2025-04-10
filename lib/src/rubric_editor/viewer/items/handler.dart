import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/models/preview.dart';
import 'package:rubric/src/rubric_editor/viewer/items/element.dart';
import 'package:rubric/src/rubric_editor/viewer/items/position.dart';
import 'package:rubric/src/rubric_editor/viewer/items/scalar.dart';

class ElementHandlerWidget extends StatelessWidget {
  final ViewModes viewMode;
  final ElementModel element;
  final bool hovered;
  const ElementHandlerWidget(
      {super.key,
      required this.element,
      required this.hovered,
      required this.viewMode});

  @override
  Widget build(BuildContext context) {
    final style = RubricEditorStyle.of(context);
    final editorState = RubricEditorState.of(context);
    final selected = editorState.edits.isSelected(element);
    return RubricPositioned.fromElement(
      viewMode: viewMode,
      element: element,
      handler: true,
      child: ElementHandlerRenderObjectWidget(
        element: element,
        child: Visibility(
          visible: selected || hovered,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 0,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: hovered
                        ? style.theme.withAlpha(10)
                        : Colors.transparent,
                    border: Border.all(
                      width: 2,
                      color: selected ? style.theme : Colors.transparent,
                    ),
                  ),
                ),
              ),
              if (!element.fixed) ...[
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
              ]
            ],
          ),
        ),
      ),
    );
  }
}
