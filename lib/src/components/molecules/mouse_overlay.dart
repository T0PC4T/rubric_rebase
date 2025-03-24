import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/elements/elements.dart';

class RubricHoldingOverlay extends StatefulWidget {
  final ElementTypes elementType;
  const RubricHoldingOverlay({super.key, required this.elementType});

  @override
  State<RubricHoldingOverlay> createState() => RubricHoldingOverlayState();
}

class RubricHoldingOverlayState extends State<RubricHoldingOverlay> {
  Offset pointer = Offset.zero;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    final style = RubricEditorStyle.of(context);

    return MouseRegion(
      hitTestBehavior: HitTestBehavior.translucent,
      cursor: SystemMouseCursors.none,
      onEnter: (event) {
        setState(() {
          pointer = event.position;
        });
      },
      onHover: (event) {
        setState(() {
          pointer = event.position;
        });
      },
      child: IgnorePointer(
        child: Align(
          alignment: Alignment(
            (pointer.dx / size.width) * 2 - 1,
            (pointer.dy / size.height) * 2 - 1,
          ),

          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: style.light95,
              border: Border.all(width: 1, color: style.light7),
              borderRadius: style.borderRadius,
            ),
            child: Icon(widget.elementType.icon, size: 25),
          ),
        ),
      ),
    );
  }
}
