import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/elements/elements.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/viewer/items/right_click_menu.dart';

const borderWidth = 5.0;

class ElementDraggingWidth extends StatelessWidget {
  final ElementType elementType;
  final RubricEditorStyle style;

  const ElementDraggingWidth({super.key, required this.elementType, required this.style});

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
  late RubricEditorState editorState;

  @override
  void initState() {
    super.initState();
  }

  Widget renderWidget() {
    return Padding(
      padding: EdgeInsets.all(widget.element.padding + editorState.canvas.value.settings.spacing / 2),
      child: widget.element.type.editorBuilder(element: widget.element),
    );
  }

  @override
  Widget build(BuildContext context) {
    editorState = RubricEditorState.of(context);

    return Draggable(
      dragAnchorStrategy: pointerDragAnchorStrategy,
      data: widget.element,
      feedback: ElementDraggingWidth(elementType: widget.element.type, style: editorState.style),
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
                if (widget.parent != null && details.data.type.category == ElementCategories.flex) {
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
                  parent: widget.parent,
                );
                // Select new element after a few frames have passed
                Future.delayed(Duration(milliseconds: 10)).then((value) {
                  editorState.edits.focusElement(details.data);
                });
              },
              builder: (context, candidateData, rejectedData) {
                if (candidateData.isNotEmpty) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(width: borderWidth, color: Colors.transparent),
                        right: BorderSide(width: borderWidth, color: Colors.transparent),
                        top: above
                            ? BorderSide(width: borderWidth, color: editorState.style.theme)
                            : BorderSide(width: borderWidth, color: Colors.transparent),
                        bottom: above
                            ? BorderSide(width: borderWidth, color: Colors.transparent)
                            : BorderSide(width: borderWidth, color: editorState.style.theme),
                      ),
                    ),
                    child: renderWidget(),
                  );
                }
                return GestureDetector(
                  onTap: () {
                    editorState.edits.focusElement(widget.element);
                  },
                  // on Right click
                  onSecondaryTapUp: (details) {
                    editorState.pushOverlay(
                      RightClickMenu(offset: details.globalPosition, editorState: editorState, element: widget.element),
                      removeToLength: 1,
                    );
                  },

                  child: Container(
                    decoration: BoxDecoration(
                      color: switch ((focused, _hovered, widget.element.type.category)) {
                        (_, true, ElementCategories.flex) => editorState.style.themealt4.withAlpha(25),
                        (_, false, ElementCategories.flex) => Colors.transparent,
                        (_, true, _) => editorState.style.theme4.withAlpha(25),
                        (_, false, _) => Colors.transparent,
                      },
                      border: Border.all(
                        color: switch ((focused, _hovered, widget.element.type.category)) {
                          (true, true, ElementCategories.flex) => editorState.style.themealt,
                          (true, false, ElementCategories.flex) => editorState.style.themealt2,
                          (false, true, ElementCategories.flex) => editorState.style.themealt7,
                          (false, false, ElementCategories.flex) => Colors.transparent,
                          (true, true, _) => editorState.style.theme,
                          (true, false, _) => editorState.style.theme2,
                          (false, true, _) => editorState.style.theme7,
                          (false, false, _) => Colors.transparent,
                        },
                        width: borderWidth,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: renderWidget(),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class EditorEmptyInserterWidget extends StatefulWidget {
  static const emptyID = "0";
  final ElementModel? parent;
  final String id;

  const EditorEmptyInserterWidget({super.key, this.parent, this.id = emptyID});

  @override
  State<EditorEmptyInserterWidget> createState() => _EditorEmptyInserterWidgetState();
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
              if (widget.parent != null && details.data.type.category == ElementCategories.flex) {
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
                parent: widget.parent,
              );
            },
            builder: (context, candidateData, rejectedData) {
              if (candidateData.isNotEmpty) {
                return Container(
                  height: 250,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(width: borderWidth, color: editorState.style.theme),
                  ),
                  child: Icon(Icons.add, size: 50, color: editorState.style.theme),
                );
              }
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(width: borderWidth, color: editorState.style.fore7),
                ),
                height: 250,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text("Drag Element Here", style: TextStyle(fontSize: 32, color: editorState.style.fore7)),
              );
            },
          ),
        );
      },
    );
  }
}

class ReaderElementWidget extends StatelessWidget {
  final ElementModel element;
  final CanvasModel canvas;

  const ReaderElementWidget({super.key, required this.element, required this.canvas});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(element.padding + canvas.settings.spacing / 2),
      child: element.type.readerBuilder(element: element, canvas: canvas),
    );
  }
}
