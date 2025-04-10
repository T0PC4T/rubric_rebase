import 'package:flutter/gestures.dart';
import 'package:rubric/src/rubric_editor/models/stack.dart';

typedef PointerUpElement = void Function(
    PointerUpEvent event, StackEventResult result);

typedef PointerDownElement = void Function(
    PointerDownEvent event, StackEventResult result);

typedef PointerMoveElement = void Function(
    PointerMoveEvent event, StackEventResult result);

typedef PointerHoverElement = void Function(
    PointerHoverEvent event, StackEventResult result);
