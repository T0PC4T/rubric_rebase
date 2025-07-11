import 'package:flutter/material.dart';
import 'package:rubric/src/elements/base/states.dart';
import 'package:rubric/src/elements/divider/divider_model.dart';
import 'package:rubric/src/elements/divider/divider_toolbar.dart';
import 'package:rubric/src/models/elements.dart';

class DividerEditorElement extends StatefulWidget {
  final ElementModel element;
  const DividerEditorElement({super.key, required this.element});

  @override
  State<DividerEditorElement> createState() => DividerEditorElementState();
}

class DividerEditorElementState extends SelectableState<DividerEditorElement> {
  @override
  onSelect(bool selected) {
    if (selected) {
      editorState.showToolbar(
        widget.element,
        DividerTooltipWidget(element: widget.element),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final dividerElement = widget.element.getProperties<DividerElementModel>();
    return Container(
      height: dividerElement.weight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: dividerElement.color,
      ),
    );
  }

  @override
  ElementModel get element => widget.element;
}

class DividerReaderElement extends StatelessWidget {
  final ElementModel element;
  const DividerReaderElement({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    final dividerElement = element.getProperties<DividerElementModel>();
    return Container(
      height: dividerElement.weight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: dividerElement.color,
      ),
    );
  }
}
