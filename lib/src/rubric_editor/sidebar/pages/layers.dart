import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/models/elements.dart';

class LayersPageWidget extends StatelessWidget {
  const LayersPageWidget({super.key});

  // int reverseIndex(int originalIndex, int listLength) {
  //   return (listLength - 1) - originalIndex;
  // }

  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);
    return ValueListenableBuilder(
      valueListenable: editorState.canvas,
      builder: (context, canvas, child) {
        final orderedElements = canvas.orderedElements.toList();
        return Padding(
          padding: EdgeInsets.all(RubricEditorStyle.paddingUnit),
          child: ReorderableListView(
            proxyDecorator: (child, index, animation) => ClipPath(
              clipper: EdgeClipper(editorState.style.radius),
              child: Material(
                color: editorState.style.light,
                child: child,
              ),
            ),
            onReorder: (oldIndex, newIndex) {
              editorState.canvas.reorderElements(
                orderedElements,
                oldIndex,
                newIndex,
              );
            },
            padding: EdgeInsets.symmetric(
              vertical: RubricEditorStyle.paddingUnit * 0.5,
            ),
            itemExtent: LayerWidget.layerHeight,
            children: [
              for (var element in orderedElements)
                LayerWidget(key: ValueKey(element.id), element: element),
            ],
          ),
        );
      },
    );
  }
}

class LayerWidget extends StatelessWidget {
  const LayerWidget({super.key, required this.element});
  static const double layerBoundary = 40;
  static const double layerHeight = 80;
  final ElementModel element;

  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);
    return GestureDetector(
      onTap: () {
        editorState.edits.selectElement(element);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: RubricEditorStyle.paddingUnit * 0.5,
        ),
        padding: EdgeInsets.only(
          left: 10,
          right: layerBoundary,
          top: 10,
          bottom: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: editorState.style.borderRadius,
          border: Border.all(color: editorState.style.light4, width: 1),
          color: editorState.style.light,
        ),
        height: layerHeight,
        width: double.infinity,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: RubricEditorStyle.paddingNum),
              child: GestureDetector(
                onTap: () {
                  editorState.canvas.fixElement(element, !element.fixed);
                },
                child: Icon(
                  Icons.lock_outline,
                  size: 20,
                  color: element.fixed
                      ? editorState.style.theme
                      : editorState.style.dark,
                ),
              ),
            ),
            Expanded(child: element.type.layerBuilder(element: element)),
          ],
        ),
      ),
    );
  }
}

class EdgeClipper extends CustomClipper<Path> {
  final double radius;
  EdgeClipper(this.radius);
  @override
  Path getClip(Size size) {
    final path = Path();
    final a = RubricEditorStyle.paddingUnit * 0.5;
    path.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, a, size.width, size.height - (a + 3)),
        Radius.circular(radius)));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
