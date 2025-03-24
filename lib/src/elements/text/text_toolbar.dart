import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/toolbar/element_toolbar.dart';

class TextTooltipWidget extends StatelessWidget {
  final ElementModel element;
  final QuillController controller;
  const TextTooltipWidget({
    super.key,
    required this.element,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);

    return QuillSimpleToolbar(
      controller: controller,
      configurations: QuillSimpleToolbarConfigurations(
        color: editorState.style.theme4,
        toolbarSize: ElementToolbarWidget.elementToolbarHeight - 20,
        fontSizesValues: {
          'Small': RubricEditorStyle.minimumFontSize.toString(),
          'Medium': (RubricEditorStyle.minimumFontSize * 1.4).toString(),
          'Large': (RubricEditorStyle.minimumFontSize * 1.8).toString(),
          'Title': (RubricEditorStyle.minimumFontSize * 2.5).toString(),
        },
        showFontFamily: false,
        showCodeBlock: false,
        showSearchButton: false,
        showStrikeThrough: false,
        showClipboardCut: false,
        showClipboardCopy: false,
        showClipboardPaste: false,
        showSubscript: false,
        showSuperscript: false,
        showListCheck: false,
        showInlineCode: false,
      ),
    );
  }
}
