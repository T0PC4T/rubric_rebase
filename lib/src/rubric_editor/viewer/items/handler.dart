import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/molecules/icon_button.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/models/preview.dart';
import 'package:rubric/src/rubric_editor/viewer/items/element.dart';
import 'package:rubric/src/rubric_editor/viewer/items/position.dart';
import 'package:rubric/src/rubric_editor/viewer/items/scalar.dart';

const handlerBoxSize = 32.0;
const handlerIconSize = 28.0;

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
                      color: selected ? style.theme : style.theme8,
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
              ],
              if (element.fixed &&
                  !selected &&
                  editorState.edits.value.viewMode == ViewModes.desktop)
                Positioned(
                  left: 2,
                  top: 2,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Transform.rotate(
                        angle: 3.1415 / 2,
                        child: RubricIconButton(
                            iconData: Icons.vertical_align_center_rounded,
                            size: handlerBoxSize,
                            disabled: element.fixedWidth == 0.25,
                            iconSize: handlerIconSize - 4,
                            style: RBStyles.theme,
                            onTap: () {
                              editorState.canvas.updateElement(element
                                ..fixedWidth = switch (element.fixedWidth) {
                                  1.0 => 0.75,
                                  0.75 => 0.5,
                                  0.5 => 0.25,
                                  0.25 => 0.25,
                                  _ => 1.0,
                                });
                              editorState.edits.selectElement(null);
                            }),
                      ),
                      Transform.rotate(
                        angle: 3.1415 / 2,
                        child: RubricIconButton(
                            iconData: Icons.expand,
                            size: handlerBoxSize,
                            disabled: element.fixedWidth == 1.0,
                            iconSize: handlerIconSize - 4,
                            style: RBStyles.theme,
                            onTap: () {
                              editorState.canvas.updateElement(element
                                ..fixedWidth = switch (element.fixedWidth) {
                                  0.25 => 0.5,
                                  0.5 => 0.75,
                                  0.75 => 1.0,
                                  1.0 => 1.0,
                                  _ => 1.0,
                                });
                              editorState.edits.selectElement(null);
                            }),
                      ),
                    ],
                  ),
                ),
              if (element.fixed && !selected)
                Positioned(
                  right: 2,
                  top: 2,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (element.orderIndex > 0)
                        RubricIconButton(
                            iconData: Icons.keyboard_arrow_up_rounded,
                            size: handlerBoxSize,
                            iconSize: handlerIconSize,
                            style: RBStyles.theme,
                            onTap: () {
                              final index = editorState
                                  .canvas.value.orderedElements
                                  .toList()
                                  .indexOf(element);
                              editorState.canvas
                                  .reorderElements(null, index, index - 1);
                              editorState.edits.selectElement(null);
                            }),
                      if (element.orderIndex <
                          editorState.canvas.value.elements.length - 1)
                        RubricIconButton(
                            iconData: Icons.keyboard_arrow_down_rounded,
                            size: handlerBoxSize,
                            iconSize: handlerIconSize,
                            style: RBStyles.theme,
                            onTap: () {
                              final index = editorState
                                  .canvas.value.orderedElements
                                  .toList()
                                  .indexOf(element);
                              editorState.canvas
                                  .reorderElements(null, index, index + 2);
                              editorState.edits.selectElement(null);
                            }),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
