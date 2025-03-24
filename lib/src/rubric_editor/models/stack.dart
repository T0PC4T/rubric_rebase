// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rubric/src/models/elements.dart';

class StackEventResult {
  ElementModel? element;
  Offset? elementHitOffset;
  Offset stackHitOffset;
  int? scalarIndex;
  bool cancel;
  StackEventResult({
    this.element,
    this.elementHitOffset,
    this.scalarIndex,
    required this.stackHitOffset,
    this.cancel = false,
  });

  get isScaler => scalarIndex != null;

  StackEventResult copyWith({
    ElementModel? mouseDownHit,
    Offset? relativeHitOffset,
    Offset? stackClickOffset,
  }) {
    return StackEventResult(
      element: mouseDownHit ?? element,
      elementHitOffset: relativeHitOffset ?? elementHitOffset,
      stackHitOffset: stackClickOffset ?? stackHitOffset,
    );
  }

  @override
  String toString() =>
      'StackEventResult(mouseDownHit: $element, relativeHitOffset: $elementHitOffset, stackClickOffset: $stackHitOffset)';

  @override
  bool operator ==(covariant StackEventResult other) {
    if (identical(this, other)) return true;

    return other.element == element &&
        other.elementHitOffset == elementHitOffset &&
        other.stackHitOffset == stackHitOffset;
  }

  @override
  int get hashCode =>
      element.hashCode ^ elementHitOffset.hashCode ^ stackHitOffset.hashCode;
}
