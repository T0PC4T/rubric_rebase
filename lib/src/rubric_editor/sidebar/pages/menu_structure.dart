import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/elements/button/button_model.dart';
import 'package:rubric/src/elements/link/link_model.dart';
import 'package:rubric/src/elements/row/row_model.dart';
import 'package:rubric/src/elements/text/text_model.dart';
import 'package:rubric/src/elements/text_list/text_list_model.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/viewer/items/right_click_menu.dart';

class LayersPageWidget extends StatelessWidget {
  const LayersPageWidget({super.key});

  // int reverseIndex(int originalIndex, int listLength) {
  //   return (listLength - 1) - originalIndex;
  // }

  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);
    return ValueListenableBuilder(
      valueListenable: editorState.edits,
      builder: (context, edits, child) => ValueListenableBuilder(
        valueListenable: editorState.canvas,
        builder: (context, canvas, child) {
          return ListView.builder(
            padding: EdgeInsets.all(RubricEditorStyle.paddingNum),
            itemCount: canvas.elements.length,
            itemBuilder: (context, index) {
              final element = canvas.elements[index];
              return LayerWidget(
                element: element,
              );
            },
          );
        },
      ),
    );
  }
}

class LayerWidget extends StatefulWidget {
  const LayerWidget({super.key, required this.element});

  static const double layerHeight = 35;
  final ElementModel element;

  @override
  State<LayerWidget> createState() => LayerWidgetState();
}

class LayerWidgetState extends State<LayerWidget> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);
    final focused = editorState.edits.value.focused == widget.element;

    String title = switch (widget.element.getProperties()) {
      TextElementModel e => e.text,
      LinkElementModel e => e.text,
      ButtonElementModel e => e.text,
      RowElementModel e => "Row (${e.elements.fold(
          0,
          (previousValue, element) => previousValue + element.length,
        )} items)",
      TextListElementModel e => e.textList.join(" "),
      _ => widget.element.type.title,
    }
        .replaceAll("\n", "");

    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _hovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          _hovered = false;
        });
      },
      child: GestureDetector(
        onTap: () {
          editorState.edits.focusElement(widget.element);
        },
        child: Container(
            decoration: BoxDecoration(
              borderRadius: editorState.style.borderRadius,
              color: switch ((focused, _hovered)) {
                (true, true) => editorState.style.theme7,
                (true, false) => editorState.style.theme8,
                (false, true) => editorState.style.back,
                (false, false) => editorState.style.fore95,
              },
            ),
            height: LayerWidget.layerHeight,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: RubricEditorStyle.paddingNum),
              child: Row(
                spacing: RubricEditorStyle.paddingNum,
                children: [
                  Icon(
                    widget.element.type.icon,
                    size: 12,
                    color: editorState.style.fore4,
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(color: editorState.style.fore4),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (focused || _hovered)
                    GestureDetector(
                      onTapUp: (details) {
                        editorState.pushOverlay(RightClickMenu(
                          offset: details.globalPosition,
                          editorState: editorState,
                          element: widget.element,
                        ));
                      },
                      child:
                          Icon(Icons.more_vert, color: editorState.style.fore4),
                    )
                ],
              ),
            )),
      ),
    );
  }
}
