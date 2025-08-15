import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/models/preview.dart';
import 'package:rubric/src/rubric_editor/models/stack.dart';
import 'package:rubric/src/rubric_editor/sidebar/sidebar.dart';
import 'package:rubric/src/rubric_editor/viewer/items/element.dart';
import 'package:rubric/src/rubric_editor/viewer/items/focused.dart';
import 'package:rubric/src/rubric_editor/viewer/items/grid.dart';
import 'package:rubric/src/rubric_editor/viewer/items/handler.dart';
import 'package:rubric/src/rubric_editor/viewer/items/menus.dart';
import 'package:rubric/src/rubric_editor/viewer/items/position.dart';
import 'package:rubric/src/rubric_editor/viewer/stack/element_stack.dart';

class RubricEditorViewer extends StatefulWidget {
  const RubricEditorViewer({super.key});

  @override
  State<RubricEditorViewer> createState() => RubricEditorViewerState();
}

class RubricEditorViewerState extends State<RubricEditorViewer> {
  ElementModel? scaling;
  bool _dragged = false;
  ViewModes viewMode = ViewModes.desktop;
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
      editorState.registerScrollController(_scrollController);
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

  static const minimum = 0.0;
  double get maximum => viewMode.width;
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
    final elementWidth = element.getWidth(viewMode);
    final elementX = element.getX(viewMode);
    final elementY = element.getY(viewMode);
    final tile = editorState.canvas.value.settings.gridSize.pixelsPerLock;
    // stack offset - element offset goes to the top left corner of the element
    // so you can add half a tile to make the movement from the center of the tile.
    Offset newLocation = _getIntuitiveLocation(
      stackHitOffset,
      elementHitOffset,
      tile,
    );

    newLocation = Offset(
      newLocation.dx.clamp(minimum, maximum - elementWidth),
      max(newLocation.dy, minimum),
    );

    if (elementX != newLocation.dx || elementY != newLocation.dy) {
      setState(() {
        editorState.canvas.moveElement(viewMode, element, newLocation);
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
    final elementWidth = element.getWidth(viewMode);
    final elementHeight = element.getHeight(viewMode);
    final elementX = element.getX(viewMode);
    final elementY = element.getY(viewMode);

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
        1 => Offset(elementWidth, 0),
        2 => Offset(0, elementHeight),
        3 => Offset(elementWidth, elementHeight),
        _ => Offset(0, 0),
      },
      tile,
    );

    double width;
    double height;
    double newX;
    double newY;

    if (movesX) {
      width = elementWidth + (elementX - loc.dx);
      newX = loc.dx;
    } else {
      width = elementWidth + (loc.dx - elementX);
      newX = elementX;
    }
    if (movesY) {
      height = elementHeight + (elementY - loc.dy);
      newY = loc.dy;
    } else {
      height = elementHeight + (loc.dy - elementY);
      newY = elementY;
    }

    width = max(
      width,
      editorState.canvas.value.settings.gridSize.pixelsPerLine,
    );
    height = max(
      height,
      editorState.canvas.value.settings.gridSize.pixelsPerLine,
    );

    if (width != elementWidth || height != elementHeight) {
      setState(() {
        editorState.canvas.moveElement(viewMode, element, Offset(newX, newY));
        editorState.canvas
            .scaleElement(viewMode, element, Offset(width, height));
      });
    }
  }

  void _selectElementsInSelectionRect(Rect rect) {
    final elements = editorState.canvas.value.elements.where((element) {
      final elementRect = Rect.fromLTWH(
        element.getX(viewMode),
        element.getY(viewMode),
        element.getWidth(viewMode),
        element.getHeight(viewMode),
      );
      return elementRect.overlaps(rect);
    }).toList();

    editorState.edits.selectElements(elements);
  }

  // This is used to give fixed elements the same size and location by the renderstack class.
  void _secretSetElementTransform(
      ElementModel element,
      double x,
      double y,
      double width,
      double height,
      double mobileX,
      double mobileY,
      double mobileWidth,
      double mobileHeight) {
    editorState.canvas.moveElement(ViewModes.desktop, element, Offset(x, y));
    editorState.canvas
        .moveElement(ViewModes.mobile, element, Offset(mobileX, mobileY));
    editorState.canvas
        .scaleElement(ViewModes.desktop, element, Offset(width, height));
    editorState.canvas.scaleElement(
        ViewModes.mobile, element, Offset(mobileWidth, mobileHeight));
  }

  // ? BASIC OPERATIONS

  bool _wasRightClick = false;
  __handlePointerDown(PointerDownEvent event, StackEventResult result) async {
    // ? Right click check
    if (event.kind == PointerDeviceKind.mouse &&
        event.buttons == kSecondaryMouseButton) {
      _wasRightClick = true;
      return;
    } else {
      _wasRightClick = false;
    }

    switch (result) {
      case StackEventResult(cancel: true):
        {
          setState(() {
            editorState.edits.selectElements(null);
            _selectionOrigin = result.stackHitOffset;
          });
        }
    }
  }

  __handlePointerUp(PointerUpEvent event, StackEventResult result) async {
    if (_wasRightClick) {
      // means that you can right click something even if it was not selected
      if (!editorState.edits.value.selected.contains(result.element)) {
        editorState.edits.selectElements(result.element);
      }
      await Future.delayed(Duration(milliseconds: 10));
      if (editorState.edits.selectionNotifier.selection.isNotEmpty) {
        editorState.pushOverlay(
          RightClickMenu(
            editorState: editorState,
            elements: editorState.edits.selectionNotifier.selection,
            offset: Offset(event.position.dx + 5, event.position.dy + 5),
          ),
          removeToLength: 1,
        );
      }
      return;
    }
    if (_selectionRect != null) {
      setState(() {
        _selectElementsInSelectionRect(_selectionRect!);
        _selectionOrigin = null;
        _selectionRect = null;
      });
      return;
    }
    switch (result) {
      case StackEventResult(cancel: true):
        {
          if (editorState.edits.value.focused != null) {
            editorState.edits.selectElements(null);
          }
        }
      case StackEventResult(element: ElementModel el):
        {
          if (editorState.edits.isSelected(el) && _dragged == false) {
            editorState.edits.focusElement(el);
          } else {
            editorState.edits.selectElements(el);
          }
        }
    }
    _dragged = false;
    editorState.canvas.commitIfChange(editorState.edits.lastStep);
  }

  Offset? _selectionOrigin;
  Rect? _selectionRect;

  __handlePointerMove(PointerMoveEvent event, StackEventResult result) {
    _dragged = true;
    if (_selectionOrigin != null) {
      _selectionRect =
          Rect.fromPoints(_selectionOrigin!, result.stackHitOffset);

      setState(() {});
      return;
    }
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

  ElementModel? hoveringOver;
  __handlePointerHover(PointerHoverEvent event, StackEventResult result) {
    if (result.element != hoveringOver) {
      setState(() {
        hoveringOver = result.element;
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
    return LayoutBuilder(builder: (context, constraints) {
      stackOffset = Offset(
          (constraints.maxWidth - editorState.edits.value.viewMode.width) * 0.5,
          sidebarButtonHeight);
      viewMode = editorState.edits.value.viewMode;
      return ValueListenableBuilder(
          valueListenable: editorState.canvas,
          builder: (context, canvas, _) {
            return SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              controller: _scrollController,
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
                secretSetter: _secretSetElementTransform,
                onPointerDown: __handlePointerDown,
                onPointerMove: __handlePointerMove,
                onPointerUp: __handlePointerUp,
                onPointerHover: __handlePointerHover,
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
                      tint: 0,
                    ),
                  for (var element in canvas.elements)
                    if (!editorState.edits.isFocused(element)) ...[
                      EditorElementWidget(
                        viewMode: viewMode,
                        key: ValueKey(element.id),
                        element: element,
                      ),
                      if (editorState.edits.value.selected != element)
                        ElementHandlerWidget(
                          viewMode: viewMode,
                          key: ValueKey("${element.id} handler"),
                          element: element,
                          hovered: hoveringOver == element,
                        ),
                    ],
                  if (editorState.edits.value.selected
                      case ElementModel element) ...[
                    // ! Just the hanlder is moved to top
                    ElementHandlerWidget(
                      viewMode: viewMode,
                      key: ValueKey("${element.id} handler"),
                      element: element,
                      hovered: hoveringOver == element,
                    ),
                  ],
                  if (editorState.edits.value.focused
                      case ElementModel element) ...[
                    CancelSelectionWidget(
                      key: ValueKey("canceller"),
                      cancels: true,
                    ),
                    RubricPositioned(
                      // ! figure something out for this.
                      orderIndex: PaintIndexes.front,
                      x: element.getX(viewMode),
                      y: element.getY(viewMode),
                      width: element.getWidth(viewMode),
                      height: element.getHeight(viewMode),
                      fixed: false,
                      fixedWidth: 0,

                      child: CancelSelectionWidget(cancels: false),
                    ),
                    EditorElementWidget(
                      viewMode: viewMode,
                      key: ValueKey(element.id),
                      element: element,
                    ),
                  ],
                  // Selection Rect
                  if (_selectionRect != null)
                    RubricPositioned(
                      x: _selectionRect!.left,
                      y: _selectionRect!.top,
                      width: _selectionRect!.width,
                      height: _selectionRect!.height,
                      orderIndex: PaintIndexes.front,
                      fixed: false,
                      fixedWidth: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: editorState.style.theme.withAlpha(25),
                          border: Border.all(
                            color: editorState.style.theme,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          });
    });
  }
}

abstract class PaintIndexes {
  static const int back = -1;
  static const int front = 1000;
  static const int behindFront = 999;
}
