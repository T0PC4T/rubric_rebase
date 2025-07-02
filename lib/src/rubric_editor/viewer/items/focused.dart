import 'package:flutter/material.dart';

class CancelSelectionWidget extends LeafRenderObjectWidget {
  final bool cancels;
  final int tint;
  const CancelSelectionWidget({
    super.key,
    required this.cancels,
    this.tint = 20,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderCancelSelectionWidget(cancels: cancels, amount: tint);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderCancelSelectionWidget renderObject,
  ) {
    renderObject.cancels = cancels;
    renderObject.amount = tint;
    renderObject.markNeedsPaint();
  }
}

class RenderCancelSelectionWidget extends RenderBox {
  int amount;
  bool cancels;
  RenderCancelSelectionWidget({required this.cancels, required this.amount});

  @override
  void performLayout() {
    size = constraints.biggest;
  }

  @override
  bool hitTestSelf(Offset position) {
    return true;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    Paint paint = Paint();
    if (cancels) {
      paint = Paint()
        ..color = Color.fromARGB(amount, 0, 0, 0)
        ..blendMode = BlendMode.srcOver;
    } else {
      paint = Paint()
        ..color = Color.fromARGB(amount ~/ 2, 255, 255, 255)
        ..blendMode = BlendMode.plus;
    }

    context.canvas.drawRect(offset & size, paint);
  }
}
