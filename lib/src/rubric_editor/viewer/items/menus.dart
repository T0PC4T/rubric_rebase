import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/shared.dart';
import 'package:rubric/src/models/elements.dart';

const double rightMenuButtonHeight = 40;

class DeleteMenu extends StatelessWidget {
  const DeleteMenu({
    super.key,
    required this.editorState,
    required this.element,
  });

  final RubricEditorState editorState;
  final ElementModel element;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 150,
        height: rightMenuButtonHeight * 3 + 2,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: editorState.style.borderRadius,
            border: Border.all(
              color: editorState.style.light7,
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: editorState.style.borderRadius,
            child: Column(
              children: [
                RubricButton(
                  backgroundColor: Colors.transparent,
                  hoverColor: editorState.style.light95,
                  height: rightMenuButtonHeight,
                  padding: editorState.style.padding,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: editorState.style.paddingNum,
                    children: [
                      Icon(
                        Icons.arrow_upward_rounded,
                        size: rightMenuButtonHeight * 0.45,
                      ),
                      RubricText(
                        "Move to front",
                      ),
                    ],
                  ),
                  onTap: () {
                    editorState.edits.selectElement(null);
                    editorState.canvas.moveItem(
                      editorState.canvas.value.elements.indexOf(element),
                      editorState.canvas.value.elements.length - 1,
                    );
                  },
                ),
                Divider(
                  color: editorState.style.light4,
                  thickness: 1,
                  height: 1,
                ),
                RubricButton(
                  backgroundColor: Colors.transparent,
                  hoverColor: editorState.style.light95,
                  height: rightMenuButtonHeight,
                  padding: editorState.style.padding,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: editorState.style.paddingNum,
                    children: [
                      Icon(
                        Icons.arrow_downward_rounded,
                        size: rightMenuButtonHeight * 0.45,
                      ),
                      RubricText(
                        "Move to back",
                      ),
                    ],
                  ),
                  onTap: () {
                    editorState.edits.selectElement(null);
                    editorState.canvas.moveItem(
                      editorState.canvas.value.elements.indexOf(element),
                      0,
                    );
                  },
                ),
                Divider(
                  color: editorState.style.light4,
                  thickness: 1,
                  height: 1,
                ),
                RubricButton(
                  backgroundColor: Colors.transparent,
                  hoverColor: editorState.style.light95,
                  height: rightMenuButtonHeight,
                  padding: editorState.style.padding,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: editorState.style.paddingNum,
                    children: [
                      Icon(
                        Icons.delete,
                        size: rightMenuButtonHeight * 0.45,
                      ),
                      RubricText(
                        "Delete",
                      ),
                    ],
                  ),
                  onTap: () {
                    editorState.edits.selectElement(null);
                    editorState.canvas.deleteElement(element);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
