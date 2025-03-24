import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/elements/elements.dart';
import 'package:rubric/src/models/editor_models.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/models/stack.dart';
import 'package:rubric/src/rubric_editor/sidebar/sidebar.dart';
import 'package:rubric/src/rubric_editor/viewer/items/element.dart';
import 'package:rubric/src/rubric_editor/viewer/items/focused.dart';
import 'package:rubric/src/rubric_editor/viewer/items/grid.dart';
import 'package:rubric/src/rubric_editor/viewer/items/handler.dart';
import 'package:rubric/src/rubric_editor/viewer/items/menus.dart';
import 'package:rubric/src/rubric_editor/viewer/items/position.dart';
import 'package:rubric/src/rubric_editor/viewer/stack/element_stack.dart';
import 'package:rubric/src/utilities/uuid.dart';

class RubricEditorViewer extends StatefulWidget {
  const RubricEditorViewer({super.key});

  @override
  State<RubricEditorViewer> createState() => RubricEditorViewerState();
}

class RubricEditorViewerState extends State<RubricEditorViewer> {
  ElementModel? scaling;
  bool _dragged = false;
  late ScrollController _scrollController;
  late RubricEditorState editorState;
  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        editorState.edits.setScrollOffset(_scrollController.offset);
      });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final editorState = RubricEditorState.of(context);
      editorState.canvas.addListener(_refreshHandler);
      editorState.edits.addListener(_refreshHandler);
    });
    super.initState();
  }

  @override
  void dispose() {
    editorState.canvas.removeListener(_refreshHandler);
    editorState.edits.removeListener(_refreshHandler);

    _scrollController.dispose();
    super.dispose();
  }

  static const blueprintWidth = maximum * 0.5;
  static const blueprintHeight = maximum * 0.25;
  (Offset offset, Size size) _getNewElementDimensions(Offset position) {
    final maxY = editorState.canvas.value.editorPageHeight();
    final tile = editorState.canvas.value.settings.gridSize.pixelsPerLine;
    Offset offset = _getIntuitiveLocation(
        position, Offset(blueprintWidth * 0.5, blueprintHeight * 0.5), tile);
    offset = Offset(
      offset.dx.clamp(minimum, maximum - blueprintWidth * 0.5),
      max(offset.dy, minimum),
    );
    final width = min(maximum - offset.dx, blueprintWidth);
    final height = min(maxY - offset.dy, blueprintHeight);
    return (Offset(offset.dx, offset.dy), Size(width, height));
  }

  static const minimum = 0.0;
  static const maximum = GridSizes.pageSize;
  Offset _getIntuitiveLocation(
    Offset stackHitOffset,
    Offset elementHitOffset,
    double tile,
  ) {
    // limit registrations
    stackHitOffset = Offset(
      min(max(stackHitOffset.dx, minimum), maximum),
      max(stackHitOffset.dy, minimum),
    );

    Offset offset =
        (stackHitOffset - elementHitOffset) + Offset(tile * 0.5, tile * 0.5);
    double x = offset.dx - offset.dx % tile;
    double y = offset.dy - offset.dy % tile;

    return Offset(x, y);
  }

  void _handleMove(
    RubricEditorState editorState,
    ElementModel element,
    Offset stackHitOffset,
    Offset elementHitOffset,
  ) {
    final tile = editorState.canvas.value.settings.gridSize.pixelsPerLock;
    // stack offset - element offset goes to the top left corner of the element
    // so you can add half a tile to make the movement from the center of the tile.
    Offset newLocation = _getIntuitiveLocation(
      stackHitOffset,
      elementHitOffset,
      tile,
    );

    newLocation = Offset(
      newLocation.dx.clamp(minimum, maximum - element.width),
      max(newLocation.dy, minimum),
    );

    if (element.x != newLocation.dx || element.y != newLocation.dy) {
      setState(() {
        editorState.canvas.moveElement(element, newLocation);
      });
    }
  }

  void _handleScale(
    RubricEditorState editorState,
    ElementModel element,
    Offset stackHitOffset,
    int scalarIndex,
  ) {
    final tile = editorState.canvas.value.settings.gridSize.pixelsPerLock;
    bool movesX = false;
    bool movesY = false;
    switch (scalarIndex) {
      case 0:
        movesX = true;
        movesY = true;
      case 1:
        movesY = true;
      case 2:
        movesX = true;
    }
    Offset loc = _getIntuitiveLocation(
      stackHitOffset,
      switch (scalarIndex) {
        1 => Offset(element.width, 0),
        2 => Offset(0, element.height),
        3 => Offset(element.width, element.height),
        _ => Offset(0, 0),
      },
      tile,
    );

    double width;
    double height;
    double newX;
    double newY;

    if (movesX) {
      width = element.width + (element.x - loc.dx);
      newX = loc.dx;
    } else {
      width = element.width + (loc.dx - element.x);
      newX = element.x;
    }
    if (movesY) {
      height = element.height + (element.y - loc.dy);
      newY = loc.dy;
    } else {
      height = element.height + (loc.dy - element.y);
      newY = element.y;
    }

    width = max(
      width,
      editorState.canvas.value.settings.gridSize.pixelsPerLine,
    );
    height = max(
      height,
      editorState.canvas.value.settings.gridSize.pixelsPerLine,
    );

    if (width != element.width || height != element.height) {
      setState(() {
        editorState.canvas.moveElement(element, Offset(newX, newY));
        editorState.canvas.scaleElement(element, Offset(width, height));
      });
    }
  }

  bool _wasRightClick = false;
  _handlePointerDown(PointerDownEvent event, StackEventResult result) async {
    // ? Right click check
    _wasRightClick = false;
    if (event.kind == PointerDeviceKind.mouse &&
        event.buttons == kSecondaryMouseButton) {
      _wasRightClick = true;

      return;
    }

    if (editorState.edits.value.holding case ElementTypes element) {
      final position = result.stackHitOffset;

      final (offset, size) = _getNewElementDimensions(position);
      editorState.canvas.addElement(
        ElementModel(
          id: newID(),
          type: element,
          x: offset.dx,
          y: offset.dy,
          width: size.width,
          height: size.height,
          properties: generateDefaultProperties(context, element),
        ),
      );
      editorState.setHolding(null);
    }
    switch (result) {
      case StackEventResult(cancel: true):
        {
          editorState.edits.selectElement(null);
        }
    }
  }

  _handlePointerUp(PointerUpEvent event, StackEventResult result) async {
    if (_wasRightClick) {
      await Future.delayed(Duration(milliseconds: 200));
      if (result.element case ElementModel element) {
        editorState.pushOverlay(
          Positioned(
              top: event.position.dy + 5,
              left: event.position.dx + 5,
              child: DeleteMenu(editorState: editorState, element: element)),
          removeToLength: 1,
        );
      }
      return;
    }
    switch (result) {
      case StackEventResult(cancel: true):
        {
          if (editorState.edits.value.focused != null) {
            if (result.cancel) {
              editorState.edits.selectElement(null);
            }
          }
        }
      case StackEventResult(element: ElementModel el):
        {
          if (editorState.edits.isSelected(el) && _dragged == false) {
            editorState.edits.focusElement(el);
          } else {
            editorState.edits.selectElement(el);
          }
        }
    }
    _dragged = false;
    editorState.canvas.commitIfChange(editorState.edits.lastStep);
  }

  _handlePointerMove(PointerMoveEvent event, StackEventResult result) {
    _dragged = true;
    switch (result) {
      case StackEventResult(cancel: true):
        {
          return;
        }
      case StackEventResult(
          element: ElementModel element,
          stackHitOffset: Offset stackHitOffset,
          scalarIndex: int scalarIndex,
        ):
        {
          _handleScale(editorState, element, stackHitOffset, scalarIndex);
        }
      case StackEventResult(
          element: ElementModel element,
          elementHitOffset: Offset elementHitOffset,
          stackHitOffset: Offset stackHitOffset,
        ):
        {
          _handleMove(editorState, element, stackHitOffset, elementHitOffset);
        }
    }
  }

  (Offset, Size)? bluePrintDimensions;
  _handlePointerHover(PointerHoverEvent event, StackEventResult result) {
    if (editorState.edits.value.holding case ElementTypes type) {
      setState(() {
        bluePrintDimensions = _getNewElementDimensions(result.stackHitOffset);
      });
    } else {
      setState(() {
        bluePrintDimensions = null;
      });
    }
  }

  _refreshHandler() {
    setState(() {});
  }

  Offset stackOffset = Offset.zero;
  @override
  Widget build(BuildContext context) {
    editorState = RubricEditorState.of(context);
    // todo calculate the actual size
    final double pageHeight = editorState.canvas.value.editorPageHeight();
    return LayoutBuilder(builder: (context, constraints) {
      stackOffset = Offset((constraints.maxWidth - GridSizes.pageSize) * 0.5,
          sidebarButtonHeight);
      return ValueListenableBuilder(
          valueListenable: editorState.canvas,
          builder: (context, canvas, _) {
            return SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              controller: _scrollController,
              child: SizedBox(
                height: pageHeight,
                child: RubricElementStack(
                  offset: stackOffset,
                  // Todo implement again.
                  onPointerSignal: (event) {
                    if (event is PointerScrollEvent) {
                      // get scroll controller max extent:
                      final maxScroll =
                          _scrollController.position.maxScrollExtent;
                      final minScroll =
                          _scrollController.position.minScrollExtent;

                      _scrollController.jumpTo(
                          (_scrollController.offset + event.scrollDelta.dy)
                              .clamp(minScroll, maxScroll));
                    }
                  },
                  onPointerDown: _handlePointerDown,
                  onPointerMove: _handlePointerMove,
                  onPointerUp: _handlePointerUp,
                  onPointerHover: _handlePointerHover,
                  key: ValueKey("ViewerStack"),
                  children: [
                    CustomPaint(
                      key: ValueKey("grid"),
                      painter: GridPainter(
                        offset: stackOffset,
                        canvasColor: canvas.settings.canvasColor,
                        gridColor: canvas.settings.gridColor,
                        pixelsPerLine: editorState
                            .canvas.value.settings.gridSize.pixelsPerLine,
                      ),
                    ),
                    if (editorState.edits.value.focused == null)
                      CancelSelectionWidget(
                        key: ValueKey("canceller"),
                        cancels: true,
                        amount: 0,
                      ),
                    for (var element in canvas.elements)
                      if (!editorState.edits.isFocused(element)) ...[
                        ElementWidget(
                          key: ValueKey(element.id),
                          element: element,
                        ),
                        ElementHandlerWidget(
                          key: ValueKey("${element.id} handler"),
                          element: element,
                        ),
                      ],
                    if (editorState.edits.value.holding case ElementTypes _)
                      if (bluePrintDimensions
                          case (
                            Offset offset,
                            Size size,
                          ))
                        RubricPositioned(
                          x: offset.dx,
                          y: offset.dy,
                          width: size.width,
                          height: size.height,
                          child: IgnorePointer(
                            child: ColoredBox(
                              color: editorState.style.theme.withAlpha(
                                50,
                              ),
                            ),
                          ),
                        ),
                    if (editorState.edits.value.focused
                        case ElementModel element) ...[
                      CancelSelectionWidget(
                        key: ValueKey("canceller"),
                        cancels: true,
                      ),
                      RubricPositioned(
                        x: element.x,
                        y: element.y,
                        width: element.width,
                        height: element.height,
                        child: CancelSelectionWidget(cancels: false),
                      ),
                      ElementWidget(
                        key: ValueKey(element.id),
                        element: element,
                      ),
                    ],
                  ],
                ),
              ),
            );
          });
    });
  }
}
