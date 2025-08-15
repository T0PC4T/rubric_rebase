import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/shared.dart';
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
          for (var element in ElementType.values)
            SidebarButton(
              element: element,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                spacing: RubricEditorStyle.paddingUnit * 0.5,
                children: [
                  Icon(
                    element.icon,
                    size: buttonSize * 0.4,
                    color: editorState.style.light1,
                  ),
                  RubricText(element.title),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class SidebarButton extends StatefulWidget {
  final Widget child;
  final ElementType element;

  const SidebarButton({super.key, required this.child, required this.element});

  @override
  State<SidebarButton> createState() => _SidebarButtonState();
}

class _SidebarButtonState extends State<SidebarButton> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);
    final buttonSize =
        RubricSideBar.sideBarSize * 0.5 - RubricEditorStyle.paddingUnit * 1.5;
    final styles = RubricEditorStyle.of(context);

    return GestureDetector(
      onTap: () {
        final editorState = RubricEditorState.of(context);
        editorState.canvas.addElement(
          ElementModel(
            id: newID(),
            type: widget.element,
            properties: generateDefaultProperties(context, widget.element),
            fixedWidth: 1,
            padding: ElementPadding.medium.value,
            orderIndex: 0,
          ),
        );
        int index = -1;
        if (editorState.edits.value.selected
            case ElementModel selectedElement) {
          index = editorState.canvas.value.elements.indexOf(selectedElement);
        } else {
          Future.delayed(Duration(milliseconds: 20)).then(
            (value) {
              editorState.scrollController?.animateTo(
                  editorState.scrollController!.position.maxScrollExtent -
                      sidebarButtonHeight,
                  duration: Duration(milliseconds: 450),
                  curve: Curves.easeInOut);
            },
          );
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) {
          setState(() {
            hovered = true;
          });
        },
        onExit: (event) {
          setState(() {
            hovered = false;
          });
        },
        child: Container(
          margin: RubricEditorStyle.halfPadding,
          alignment: Alignment.center,
          padding: RubricEditorStyle.padding,
          width: buttonSize,
          height: buttonSize,
          decoration: BoxDecoration(
            color:
                hovered ? editorState.style.light95 : editorState.style.light,
            borderRadius: editorState.style.borderRadius,
            border: Border.all(
              color: styles.light4,
              width: 1,
            ),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
