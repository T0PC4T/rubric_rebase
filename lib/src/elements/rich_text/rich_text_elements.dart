// import 'package:flutter/material.dart';
// import 'package:flutter_quill/flutter_quill.dart';
// import 'package:rubric/rubric.dart';
// import 'package:rubric/src/elements/base/states.dart';
// import 'package:rubric/src/elements/rich_text/rich_text_model.dart';
// import 'package:rubric/src/elements/rich_text/rich_text_toolbar.dart';
// import 'package:rubric/src/models/elements.dart';

// class RichTextEditorElement extends StatefulWidget {
//   final ElementModel element;
//   const RichTextEditorElement({super.key, required this.element});

//   @override
//   State<RichTextEditorElement> createState() => RichTextEditorElementState();
// }

// class RichTextEditorElementState
//     extends SelectableAndFocusableState<RichTextEditorElement> {
//   late QuillController controller;
//   late ScrollController _scrollController;
//   late FocusNode focusNode;

//   @override
//   void initState() {
//     final textElement = widget.element.getProperties<RichTextElementModel>();
//     focusNode = FocusNode(debugLabel: "Text ${widget.element.id}");
//     _scrollController = ScrollController();
//     controller = QuillController(
//       document: textElement.document,
//       selection: TextSelection(baseOffset: 0, extentOffset: 0),
//       readOnly: false,
//       editorFocusNode: focusNode,
//       keepStyleOnNewLine: true,
//       configurations: QuillControllerConfigurations(),
//     );
//     super.initState();
//   }

//   @override
//   ElementModel get element => widget.element;

//   @override
//   void onFocus(bool focused) {
//     if (focused) {
//       editorState.showToolbar(
//         widget.element,
//         RichTextTooltipWidget(element: widget.element, controller: controller),
//       );
//       focusNode.requestFocus();
//     } else {
//       controller.updateSelection(
//         TextSelection.collapsed(offset: 0),
//         ChangeSource.local,
//       );

//       editorState.canvas.updateElement(
//         widget.element,
//         RichTextElementModel(document: controller.document).toJson(),
//       );
//     }
//   }

//   @override
//   void didUpdateWidget(covariant RichTextEditorElement oldWidget) {
//     final properties = widget.element.getProperties<RichTextElementModel>();
//     final oldProperties =
//         oldWidget.element.getProperties<RichTextElementModel>();
//     if (properties.document.toDelta() != oldProperties.document.toDelta()) {
//       controller.document = properties.document;
//     }

//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   onSelect(bool selected) {
//     if (selected) {
//       // ? this replaces the usual show toolbar because there is no tool bar on select.
//       editorState.clearOverlays();
//     }
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     controller.dispose();
//     focusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     editorState = RubricEditorState.of(context);
//     return QuillEditor(
//       scrollController: _scrollController,
//       controller: controller,
//       focusNode: focusNode,
//       configurations: QuillEditorConfigurations(
//         placeholder: "Add your text in here...",
//         customStyles: DefaultStyles(
//             paragraph: DefaultTextBlockStyle(
//                 TextStyle(
//                   color: Colors.black,
//                   fontSize: RubricEditorStyle.minimumFontSize.toDouble(),
//                 ),
//                 HorizontalSpacing(0, 16),
//                 VerticalSpacing(0, 16),
//                 VerticalSpacing(16, 0),
//                 null)),
//       ),
//     );
//   }
// }

// class RichTextLayerWidget extends StatelessWidget {
//   final ElementModel element;
//   const RichTextLayerWidget({super.key, required this.element});

//   @override
//   Widget build(BuildContext context) {
//     final style = RubricEditorStyle.of(context);
//     final textElement = element.getProperties<RichTextElementModel>();
//     return Text(
//       maxLines: 2,
//       textElement.document.toPlainText(),
//       style: TextStyle(color: style.dark, fontSize: 14),
//       overflow: TextOverflow.ellipsis,
//     );
//   }
// }

// class RichTextReaderWidget extends StatefulWidget {
//   final ElementModel element;
//   const RichTextReaderWidget({super.key, required this.element});

//   @override
//   State<RichTextReaderWidget> createState() => _RichTextReaderWidgetState();
// }

// class _RichTextReaderWidgetState extends State<RichTextReaderWidget> {
//   late QuillController controller;
//   late ScrollController _scrollController;
//   late FocusNode focusNode;

//   @override
//   void initState() {
//     final textElement = widget.element.getProperties<RichTextElementModel>();
//     focusNode = FocusNode(debugLabel: "Text ${widget.element.id}");
//     _scrollController = ScrollController();
//     controller = QuillController(
//       document: textElement.document,
//       selection: TextSelection(baseOffset: 0, extentOffset: 0),
//       readOnly: true,
//       editorFocusNode: focusNode,
//       configurations: QuillControllerConfigurations(),
//     );
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     controller.dispose();
//     focusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return IgnorePointer(
//       child: QuillEditor(
//         scrollController: _scrollController,
//         controller: controller,
//         focusNode: focusNode,
//         configurations: QuillEditorConfigurations(),
//       ),
//     );
//   }
// }
