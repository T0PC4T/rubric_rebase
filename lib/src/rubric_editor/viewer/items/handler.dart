import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/elements/elements.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/viewer/items/right_click_menu.dart';

const borderWidth = 5.0;

class ElementDraggingWidth extends StatelessWidget {
  final ElementType elementType;
  final RubricEditorStyle style;

  const ElementDraggingWidth(
      {super.key, required this.elementType, required this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: style.theme8,
        borderRadius: style.borderRadius,
        border: Border.all(width: 2, color: style.theme4),
      ),
      child: Icon(elementType.icon, size: 28, color: style.theme),
    );
  }
}

// todo this needs to be optimized in a way that the children aren't constantly being disposed.
class EditorElementWidget extends StatefulWidget {
  final ElementModel element;
  final ElementModel? parent;

  const EditorElementWidget({super.key, required this.element, this.parent});

  @override
  State<EditorElementWidget> createState() => _EditorElementWidgetState();
}

class _EditorElementWidgetState extends State<EditorElementWidget> {
  bool _hovered = false;
  bool above = false;

  @override
  void initState() {
    super.initState();
  }

  Widget renderWidget() {
    return Padding(
        padding: EdgeInsets.all(widget.element.padding),
        child: widget.element.type.editorBuilder(element: widget.element));
  }

  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);

    return Draggable(
      dragAnchorStrategy: pointerDragAnchorStrategy,
      data: widget.element,
      feedback: ElementDraggingWidth(
          elementType: widget.element.type, style: editorState.style),
      onDragStarted: () {},
      child: ValueListenableBuilder(
          valueListenable: editorState.edits,
          builder: (context, value, child) {
            bool focused = editorState.edits.value.focused == widget.element;
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
              child: DragTarget<ElementModel>(
                onMove: (details) {
                  final box = context.findRenderObject() as RenderBox;
                  final offset = box.localToGlobal(Offset.zero);
                  if (details.offset.dy < (offset.dy + box.size.height / 2)) {
                    if (above == false) {
                      setState(() {
                        above = true;
                      });
                    }
                  } else {
                    if (above == true) {
                      setState(() {
                        above = false;
                      });
                    }
                  }
                },
                onWillAcceptWithDetails: (details) {
                  // You cannot nest rows
                  if (widget.parent != null &&
                      details.data.type == ElementType.row) {
                    return false;
                  }
                  if (widget.element.id == details.data.id) {
                    return false;
                  }
                  return true;
                },
                onAcceptWithDetails: (details) {
                  editorState.canvas.deleteElement(details.data);
                  editorState.canvas.dragInElement(
                      insert: details.data,
                      exiting: widget.element,
                      above: above,
                      parent: widget.parent);
                },
                builder: (context, candidateData, rejectedData) {
                  if (candidateData.isNotEmpty) {
                    return Container(
                        decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  width: borderWidth,
                                  color: Colors.transparent),
                              right: BorderSide(
                                  width: borderWidth,
                                  color: Colors.transparent),
                              top: above
                                  ? BorderSide(
                                      width: borderWidth,
                                      color: editorState.style.theme)
                                  : BorderSide(
                                      width: borderWidth,
                                      color: Colors.transparent),
                              bottom: above
                                  ? BorderSide(
                                      width: borderWidth,
                                      color: Colors.transparent)
                                  : BorderSide(
                                      width: borderWidth,
                                      color: editorState.style.theme)),
                        ),
                        child: renderWidget());
                  }
                  return GestureDetector(
                    onTap: () {
                      editorState.edits.focusElement(widget.element);
                    },
                    // on Right click
                    onSecondaryTapUp: (details) {
                      editorState.pushOverlay(
                        RightClickMenu(
                            offset: details.globalPosition,
                            editorState: editorState,
                            element: widget.element),
                        removeToLength: 1,
                      );
                    },

                    child: Container(
                      decoration: BoxDecoration(
                        color: switch ((focused, _hovered)) {
                          (_, true) => editorState.style.theme4.withAlpha(25),
                          (_, false) => Colors.transparent,
                        },
                        border: Border.all(
                            color: switch ((focused, _hovered)) {
                              (true, true) => editorState.style.theme,
                              (true, false) => editorState.style.theme2,
                              (false, true) => editorState.style.theme7,
                              (false, false) =>
                                Colors.transparent, // editorState.style.light9,
                            },
                            width: borderWidth,
                            style: BorderStyle.solid),
                      ),
                      child: renderWidget(),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}

class EditorEmptyInserterWidget extends StatefulWidget {
  final ElementModel? parent;
  final String id;

  const EditorEmptyInserterWidget({super.key, this.parent, this.id = "0"});

  @override
  State<EditorEmptyInserterWidget> createState() =>
      _EditorEmptyInserterWidgetState();
}

class _EditorEmptyInserterWidgetState extends State<EditorEmptyInserterWidget> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);

    return ValueListenableBuilder(
        valueListenable: editorState.edits,
        builder: (context, value, child) {
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
            child: DragTarget<ElementModel>(
              onWillAcceptWithDetails: (details) {
                // You cannot nest rows
                if (widget.parent != null &&
                    details.data.type == ElementType.row) {
                  return false;
                }

                return true;
              },
              onAcceptWithDetails: (details) {
                editorState.canvas.deleteElement(details.data);
                editorState.canvas.dragInElement(
                    insert: details.data,
                    exiting: ElementType.box.generateNewModel(widget.id),
                    above: true,
                    parent: widget.parent);
              },
              builder: (context, candidateData, rejectedData) {
                if (candidateData.isNotEmpty) {
                  return Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: _hovered
                              ? BorderSide(
                                  width: 5, color: editorState.style.theme)
                              : BorderSide(width: 0, color: Colors.transparent),
                        ),
                      ),
                      child: SizedBox(
                        height: 200,
                        width: double.infinity,
                      ));
                }
                return SizedBox(
                  height: 200,
                  width: double.infinity,
                );
              },
            ),
          );
        });
  }
}

class ReaderElementWidget extends StatelessWidget {
  final ElementModel element;

  const ReaderElementWidget({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(element.padding),
      child: element.type.readerBuilder(element: element),
    );
  }
}
