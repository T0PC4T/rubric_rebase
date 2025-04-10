import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/atoms/container.dart';
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
  static const double layerHeight = 70;
  final ElementModel element;

  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);
    return GestureDetector(
      onTap: () {
        editorState.edits.selectElement(element);
      },
      child: RubricContainer(
        margin: EdgeInsets.symmetric(
          vertical: RubricEditorStyle.paddingUnit * 0.5,
        ),
        padding: EdgeInsets.only(
          left: 10,
          right: layerBoundary,
          top: 10,
          bottom: 10,
        ),
        color: editorState.style.light,
        height: layerHeight,
        width: double.infinity,
        child: element.type.layerBuilder(element: element),
      ),
    );
  }
}
