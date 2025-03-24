import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/models/stack.dart';
import 'package:rubric/src/rubric_editor/viewer/items/element.dart';
import 'package:rubric/src/rubric_editor/viewer/items/focused.dart';
import 'package:rubric/src/rubric_editor/viewer/items/scalar.dart';
import 'package:rubric/src/rubric_editor/viewer/stack/parent_data.dart';

typedef PointerUpElement = void Function(
    PointerUpEvent event, StackEventResult result);

typedef PointerDownElement = void Function(
    PointerDownEvent event, StackEventResult result);

typedef PointerMoveElement = void Function(
    PointerMoveEvent event, StackEventResult result);

typedef PointerHoverElement = void Function(
    PointerHoverEvent event, StackEventResult result);

// this widget manages stacking elements allowing for hittesting to be done at the level of Renderobject. Similar to Stack widget but more simple
class RubricElementStack extends MultiChildRenderObjectWidget {
  final Offset offset;
  final PointerSignalEventListener onPointerSignal;
  final PointerUpElement onPointerUp;
  final PointerDownElement onPointerDown;
  final PointerMoveElement onPointerMove;
  final PointerHoverElement onPointerHover;

  const RubricElementStack({
    super.key,
    super.children,
    required this.offset,
    required this.onPointerSignal,
    required this.onPointerUp,
    required this.onPointerDown,
    required this.onPointerMove,
    required this.onPointerHover,
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
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant RenderObject renderObject,
  ) {
    super.updateRenderObject(context, renderObject);
  }
}

// this manager events and hitTests.
class RenderRubricElementStack extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, RuPositionParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, RuPositionParentData> {
  final Offset offset;
  final PointerSignalEventListener onPointerSignal;
  final PointerUpElement onPointerUp;
  final PointerDownElement onPointerDown;
  final PointerMoveElement onPointerMove;
  final PointerHoverElement onPointerHover;

  RenderRubricElementStack({
    List<RenderBox>? children,
    required this.offset,
    required this.onPointerSignal,
    required this.onPointerUp,
    required this.onPointerDown,
    required this.onPointerMove,
    required this.onPointerHover,
  }) {
    addAll(children);
  }

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! RuPositionParentData) {
      child.parentData = RuPositionParentData(
        0,
        0,
        double.infinity,
        double.infinity,
      );
    }
  }

  @override
  void performLayout() {
    assert(
      constraints.hasBoundedHeight || constraints.hasBoundedWidth,
      "Rubric stack requires max width & max height",
    );
    size = constraints.biggest;
    RenderBox? child = firstChild;
    while (child != null) {
      if (child.parentData case RuPositionParentData childParentData) {
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
        child = childParentData.nextSibling;
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
    if (event is PointerDownEvent) {
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
      PointerSignalEvent() => onPointerSignal.call(event),
      PointerUpEvent() => onPointerUp.call(event, result),
      PointerDownEvent() => onPointerDown.call(event, result),
      PointerMoveEvent() => onPointerMove.call(event, result),
      PointerHoverEvent() => onPointerHover.call(event, result),
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

    // todo you can optimize this to not paint all the children.
    defaultPaint(context, offset);
  }
}
