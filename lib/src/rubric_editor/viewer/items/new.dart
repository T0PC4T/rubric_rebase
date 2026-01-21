import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/models/elements.dart';

class NewElementDragTarget extends StatelessWidget {
  const NewElementDragTarget({super.key});

  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);
    return DragTarget<ElementModel>(
      onAcceptWithDetails: (details) {
        editorState.canvas.addElement(details.data);
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(borderRadius: editorState.style.borderRadius, color: editorState.style.fore95),
          child: Center(child: Icon(Icons.add, color: editorState.style.fore4, size: 50)),
        );
      },
    );
  }
}
