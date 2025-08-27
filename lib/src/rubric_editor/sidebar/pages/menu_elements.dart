import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/elements/elements.dart';
import 'package:rubric/src/rubric_editor/sidebar/sidebar.dart';
import 'package:rubric/src/rubric_editor/viewer/items/handler.dart';

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
                    color: editorState.style.fore1,
                  ),
                  Text(
                    element.title,
                    style: TextStyle(
                      fontSize: 12,
                      color: editorState.style.fore1,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

const sizeBarButtonSize =
    RubricSideBar.sideBarSize * 0.5 - RubricEditorStyle.paddingUnit * 1.5;

class SidebarButton extends StatefulWidget {
  final Widget child;
  final ElementType element;

  const SidebarButton({super.key, required this.child, required this.element});

  @override
  State<SidebarButton> createState() => _SidebarButtonState();
}

class _SidebarButtonState extends State<SidebarButton> {
  bool hovered = false;

  Widget getButton(Color color) {
    final editorState = RubricEditorState.of(context);

    final styles = RubricEditorStyle.of(context);

    return Container(
      margin: RubricEditorStyle.halfPadding,
      alignment: Alignment.center,
      padding: RubricEditorStyle.padding,
      width: sizeBarButtonSize,
      height: sizeBarButtonSize,
      decoration: BoxDecoration(
        color: color,
        borderRadius: editorState.style.borderRadius,
        border: Border.all(
          color: styles.fore4,
          width: 1,
        ),
      ),
      child: widget.child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);
    final style = RubricEditorStyle.of(context);
    return Draggable(
        dragAnchorStrategy: pointerDragAnchorStrategy,
        data: widget.element.generateNewModel(),
        feedback:
            ElementDraggingWidth(elementType: widget.element, style: style),
        childWhenDragging: Material(child: getButton(style.back)),
        onDragStarted: () {},
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
          child: hovered
              ? getButton(style.fore95)
              : getButton(
                  style.back,
                ),
        ));
  }
}
