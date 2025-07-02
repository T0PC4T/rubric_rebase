import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/atoms/button.dart';
import 'package:rubric/src/elements/base/enums.dart';
import 'package:rubric/src/elements/elements.dart';
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
              padding: RubricEditorStyle.padding,
              backgroundColor: editorState.style.light,
              width: buttonSize,
              height: buttonSize,
              radius: editorState.style.radius,
              hoverColor: editorState.style.light9,
              onTap: () {
                final editorState = RubricEditorState.of(context);
                Future.delayed(Duration(milliseconds: 20)).then(
                  (value) {
                    editorState.scrollController?.animateTo(
                        editorState.scrollController!.position.maxScrollExtent -
                            sidebarButtonHeight,
                        duration: Duration(milliseconds: 450),
                        curve: Curves.easeInOut);
                  },
                );

                editorState.canvas.addElement(
                  ElementModel(
                    id: newID(),
                    type: element,
                    properties: generateDefaultProperties(context, element),
                    fixedWidth: 1,
                    padding: ElementPadding.medium.value,
                    orderIndex: editorState.canvas.value.elements.length,
                  ),
                );
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
