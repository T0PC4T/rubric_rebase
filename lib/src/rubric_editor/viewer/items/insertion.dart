import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';

class RowInsertionWidget extends StatelessWidget {
  final int itemsLength;
  const RowInsertionWidget({super.key, required this.itemsLength});

  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);
    final style = editorState.style;
    return ClipRRect(
      borderRadius: style.borderRadius,
      child: Row(
        spacing: RubricEditorStyle.paddingNum * 0.5,
        children: [
          for (var i = 0; i < itemsLength; i++)
            Expanded(
                child: Container(
              height: double.infinity,
              color: style.fore8,
              child: Icon(
                Icons.add,
                color: style.back,
              ),
            )),
        ],
      ),
    );
  }
}
