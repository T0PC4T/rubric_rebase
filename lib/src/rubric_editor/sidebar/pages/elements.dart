import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/atoms/button.dart';
import 'package:rubric/src/elements/elements.dart';
import 'package:rubric/src/models/editor_models.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/sidebar/sidebar.dart';
import 'package:rubric/src/utilities/uuid.dart';

class ElementPageWidget extends StatelessWidget {
  const ElementPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);
    final buttonSize =
        RubricSideBar.sideBarSize * 0.5 - RubricEditorStyle.paddingUnit * 1.5;

    return Padding(
      padding: EdgeInsets.all(RubricEditorStyle.paddingUnit * 0.5),
      child: Wrap(
        children: [
          for (var element in ElementTypes.values)
            RubricButton(
              borderColor: editorState.style.light7,
              borderWidth: 1,
              margin: EdgeInsets.all(RubricEditorStyle.paddingUnit * 0.5),
              padding: editorState.style.padding,
              backgroundColor: editorState.style.light,
              width: buttonSize,
              height: buttonSize,
              radius: editorState.style.radius,
              hoverColor: editorState.style.light9,
              onTap: () {
                final editorState = RubricEditorState.of(context);
                if (editorState.edits.value.holding == element) {
                  final width = GridSizes.pageSize * 0.5;
                  final height = GridSizes.pageSize * 0.35;
                  final tile =
                      editorState.canvas.value.settings.gridSize.pixelsPerLock;

                  editorState.canvas.addElement(
                    ElementModel(
                      id: newID(),
                      type: element,
                      x: tile,
                      y:
                          editorState.edits.scrollOffset -
                          (editorState.edits.scrollOffset % tile),
                      width: width - (width % tile),
                      height: height - (height % tile),
                      properties: generateDefaultProperties(context, element),
                    ),
                  );
                  editorState.setHolding(null);
                } else {
                  editorState.setHolding(element);
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                spacing: RubricEditorStyle.paddingUnit * 0.5,
                children: [
                  Icon(element.icon, size: buttonSize * 0.4),
                  Text(element.title),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
