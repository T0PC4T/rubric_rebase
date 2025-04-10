import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/models/preview.dart';
import 'package:rubric/src/rubric_editor/models/stack.dart';
import 'package:rubric/src/rubric_editor/viewer/items/element.dart';
import 'package:rubric/src/rubric_editor/viewer/items/focused.dart';
import 'package:rubric/src/rubric_editor/viewer/items/scalar.dart';
import 'package:rubric/src/rubric_editor/viewer/stack/models.dart';
import 'package:rubric/src/rubric_editor/viewer/stack/positioned.dart';

// this widget manages stacking elements allowing for hittesting to be done at the level of Renderobject. Similar to Stack widget but more simple
class RubricElementStack extends MultiChildRenderObjectWidget {
  final Offset offset;
  final PointerSignalEventListener? onPointerSignal;
  final PointerUpElement? onPointerUp;
  final PointerDownElement? onPointerDown;
  final PointerMoveElement? onPointerMove;
  final PointerHoverElement? onPointerHover;
  final void Function(
      ElementModel element,
      double x,
      double y,
      double width,
      double height,
      double mobileX,
      double mobileY,
      double mobileWidth,
      double mobileHeight)? secretSetter;

  const RubricElementStack({
    super.key,
    super.children,
    required this.offset,
    this.onPointerSignal,
    this.onPointerUp,
    this.onPointerDown,
    this.onPointerMove,
    this.onPointerHover,
    this.secretSetter,
  });

  @override
  RenderRubricElementStack createRenderObject(BuildContext context) {
    return RenderRubricElementStack(
      offset: offset,
      onPointerSignal: onPointerSignal,
      onPointerUp: onPointerUp,
      onPointerDown: onPointerDown,
      onPointerMove: onPointerMove,
      onPointerHover: onPointerHover,
      secretSetter: secretSetter,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderRubricElementStack renderObject,
  ) {
    renderObject.offset = offset;
    super.updateRenderObject(context, renderObject);
  }
}

// this manager events and hitTests.
class RenderRubricElementStack extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, RubricPositionParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, RubricPositionParentData> {
  Offset _offset;
  Offset get offset => _offset;
  set offset(Offset value) {
    if (_offset == value) return;
    _offset = value;
    markNeedsLayout();
  }

  PointerSignalEventListener? onPointerSignal;
  PointerUpElement? onPointerUp;
  PointerDownElement? onPointerDown;
  PointerMoveElement? onPointerMove;
  PointerHoverElement? onPointerHover;
  final void Function(
      ElementModel element,
      double x,
      double y,
      double width,
      double height,
      double mobileX,
      double mobileY,
      double mobileWidth,
      double mobileHeight)? secretSetter;

  RenderRubricElementStack({
    List<RenderBox>? children,
    required Offset offset,
    required this.onPointerSignal,
    required this.onPointerUp,
    required this.onPointerDown,
    required this.onPointerMove,
    required this.onPointerHover,
    required this.secretSetter,
  }) : _offset = offset {
    addAll(children);
  }

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! RubricPositionParentData) {
      child.parentData = RubricPositionParentData(
        y: 0,
        x: 0,
        width: double.infinity,
        height: double.infinity,
        fixed: false,
        fixedWidth: 0,
        orderIndex: -1,
      );
    }
  }

  double x = 0;
  double y = 0;
  double mobileX = 0;
  double mobileY = 0;

  double maxHeightForLine = 0;
  ({double x, double y, double width, double height}) getNextFixedPosition(
      RenderBox child,
      RubricPositionParentData childParentData,
      ElementModel el) {
    final canvasWidth = size.width - offset.dx * 2;
    final viewMode = ViewModes.fromWidth(canvasWidth);
    // final canvasWidth = size.width - offset.dx * 2;

    // ? handlers don't affect the layout offsets
    if (childParentData.handler) {
      return (
        y: el.getY(viewMode),
        x: el.getX(viewMode),
        width: el.getWidth(viewMode),
        height: el.getHeight(viewMode),
      );
    }

    // BASICALLY YOU HAVE TO SET THE
    double w = ViewModes.desktop.width * el.fixedWidth;
    double mw = math.min(ViewModes.mobile.width, canvasWidth);
    double h = child.getMaxIntrinsicHeight(w);
    double mh = child.getMaxIntrinsicHeight(mw);
    // ? if it would overflow, then go to the next line.
    if (x + w > viewMode.width) {
      y += maxHeightForLine;
      x = 0;
      maxHeightForLine = 0;
    }
    maxHeightForLine = math.max(maxHeightForLine, h);

    secretSetter?.call(el, x, y, w, h, mobileX, mobileY, mw, mh);

    mobileY += mh;
    x += w;
    return (
      x: el.getX(viewMode),
      y: el.getY(viewMode),
      width: el.getWidth(viewMode),
      height: el.getHeight(viewMode)
    );
    //return RubricPositionParentData(y, x, lastWidth, lastHeight, true);
  }

  @override
  void performLayout() {
    x = 0;
    y = 0;
    maxHeightForLine = 0;
    mobileX = 0;
    mobileY = 0;

    assert(
      constraints.hasBoundedHeight || constraints.hasBoundedWidth,
      "Rubric stack requires max width & max height",
    );
    size = constraints.biggest;
    final allChildren = <RenderBox>[];
    RenderBox? child = firstChild;

    while (child != null) {
      allChildren.add(child);
      if (child.parentData case RubricPositionParentData childParentData) {
        child = childParentData.nextSibling;
      }
    }
    allChildren.sort((a, b) {
      final aParentData = a.parentData as RubricPositionParentData;
      final bParentData = b.parentData as RubricPositionParentData;
      return aParentData.orderIndex.compareTo(bParentData.orderIndex);
    });
    for (var child in allChildren) {
      final childParentData = child.parentData as RubricPositionParentData;
      if (childParentData
          case RubricPositionParentData(
            fixed: true,
            element: ElementModel el
          )) {
        final newData = getNextFixedPosition(child, childParentData, el);
        childParentData.x = newData.x;
        childParentData.y = newData.y;
        childParentData.width = newData.width;
        childParentData.height = newData.height;
      }
      final BoxConstraints childConstraints =
          childParentData.positionedChildConstraints(size);
      child.layout(childConstraints, parentUsesSize: false);

      // If you are given infinite set offset at true zero so it covers the screen.
      if (childParentData.width.isInfinite) {
        childParentData.offset = Offset.zero;
      } else {
        // otherwise offset it correctly
        childParentData.offset = Offset(
          (childParentData.x + offset.dx),
          (childParentData.y + offset.dy),
        );
      }
    }
  }

  ElementModel? _mouseDownHit;
  Offset? _elementHitOffset;
  Offset _stackHitOffset = Offset.zero;
  int? _scalarIndex;

  StackEventResult getEventResult(PointerEvent event, HitTestEntry entry) {
    final localPosition = globalToLocal(event.position);
    _stackHitOffset = localPosition - offset;
    // ! was => if (event is PointerDownEvent) {
    if (event is PointerHoverEvent) {
      final BoxHitTestResult result = BoxHitTestResult();
      final hit = hitTest(result, position: localPosition);
      if (hit) {
        for (var item in result.path) {
          switch (item.target) {
            case ElementHandlerRender target:
              {
                return StackEventResult(
                  element: target.element,
                  elementHitOffset: target.globalToLocal(event.position),
                  stackHitOffset: _stackHitOffset,
                );
              }
          }
        }
      }
    } else if (event is PointerDownEvent) {
      final BoxHitTestResult result = BoxHitTestResult();
      final hit = hitTest(result, position: localPosition);
      if (hit) {
        for (var item in result.path) {
          switch (item.target) {
            case RenderCancelSelectionWidget target:
              {
                return StackEventResult(
                  stackHitOffset: _stackHitOffset,
                  cancel: target.cancels,
                );
              }
            case ElementHandlerRender target:
              {
                _elementHitOffset = target.globalToLocal(event.position);
                _mouseDownHit = target.element;

                return StackEventResult(
                  element: _mouseDownHit,
                  elementHitOffset: _elementHitOffset,
                  stackHitOffset: _stackHitOffset,
                );
              }
            case ScalarRenderProxyBox target:
              {
                _elementHitOffset = target.globalToLocal(event.position);
                _mouseDownHit = target.element;
                _scalarIndex = target.scalarIndex;
                return StackEventResult(
                  element: _mouseDownHit,
                  elementHitOffset: _elementHitOffset,
                  stackHitOffset: _stackHitOffset,
                  scalarIndex: target.scalarIndex,
                );
              }
          }
        }
      }
      return StackEventResult(stackHitOffset: _stackHitOffset);
    }
    // its not a pointer down,
    final result = StackEventResult(
      stackHitOffset: _stackHitOffset,
      element: _mouseDownHit,
      elementHitOffset: _elementHitOffset,
      scalarIndex: _scalarIndex,
    );
    if (event is PointerUpEvent) {
      _mouseDownHit = null;
      _elementHitOffset = null;
      _scalarIndex = null;
    }
    return result;
  }

  @override
  void handleEvent(PointerEvent event, HitTestEntry entry) {
    assert(debugHandleEvent(event, entry));
    final result = getEventResult(event, entry);

    return switch (event) {
      PointerSignalEvent() => onPointerSignal?.call(event),
      PointerUpEvent() => onPointerUp?.call(event, result),
      PointerDownEvent() => onPointerDown?.call(event, result),
      PointerMoveEvent() => onPointerMove?.call(event, result),
      PointerHoverEvent() => onPointerHover?.call(event, result),
      // PointerCancelEvent() => onPointerCancel?.call(event), // ? this might be useful.
      _ => null,
    };
  }

  // @override
  // bool hitTest(BoxHitTestResult result, {required Offset position}) {
  //   final response = super.hitTest(result, position: position);
  //   return response;
  // }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    // ? always hit the canvas even if it is empty
    // result.add(BoxHitTestEntry(this, position));
    return defaultHitTestChildren(result, position: position);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // context.canvas.save();
    // context.canvas.translate(offset.dx, offset.dy);
    // paintGrid(context.canvas);
    // context.canvas.restore();

    // todo you can optimize this to not paint all the children
    defaultPaint(context, offset);
  }
}
