import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/elements/base/states.dart';
import 'package:rubric/src/elements/text_list/text_list_model.dart';
import 'package:rubric/src/elements/text_list/text_list_toolbar.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_icon/icon_widget.dart';

const textListColumnSpacing = 14.0;
const textListRowSpacing = 4.0;
final GlobalKey textListKey = GlobalKey();

class TextListEditorElement extends StatefulWidget {
  final ElementModel element;
  const TextListEditorElement({super.key, required this.element});

  @override
  State<TextListEditorElement> createState() => TextListEditorElementState();
}

class TextListEditorElementState extends FocusableState<TextListEditorElement> {
  late TextEditingController controller;
  List<String> textList = [];
  late ScrollController _scrollController;
  late FocusNode focusNode;
  late FocusNode focusNodeTextField;

  late UndoHistoryController undoController;

  int editingPoint = -1;

  requestFocus() {
    focusNode.requestFocus();
  }

  @override
  void initState() {
    final textProperties = widget.element.getProperties<TextListElementModel>();
    textList.addAll(textProperties.textList);
    controller = TextEditingController();

    focusNode = FocusNode(debugLabel: "Text Input Focus Node with Text List");
    focusNodeTextField = FocusNode(debugLabel: "TextList ${widget.element.id}");
    _scrollController = ScrollController();
    undoController = UndoHistoryController();

    super.initState();
  }

  @override
  ElementModel get element => widget.element;

  @override
  void onFocus(bool focused) {
    if (focused) {
      editorState.showToolbar(
        widget.element,
        (element) => TextListToolbarWidget(
            element: element,
            controller: controller,
            undoController: undoController),
      );
      // focusNode.requestFocus();
      editingPoint = 0;
      controller.text = textList[editingPoint];

      focusNode.requestFocus();
    } else {
      editingPoint = -1;
    }
    if (_changed) {
      editorState.canvas.commit();
    }
  }

  final bool _changed = false;
  onChange(String value) {
    setState(() {
      textList[editingPoint] = value;
    });
    final newTextList = List<String>.from(textList);
    editorState.canvas.updateProperties<TextListElementModel>(
      widget.element,
      (properties) => properties.copyWith(textList: newTextList).toJson(),
      saveStep: false,
    );
  }

  @override
  void didUpdateWidget(covariant TextListEditorElement oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    controller.dispose();
    focusNode.dispose();
    focusNodeTextField.dispose();

    super.dispose();
  }

  String _getTextAfterSelection() {
    // Get the full text from the controller
    final String text = controller.text;

    // Get the index at the end of the selection/cursor
    final int selectionEnd = controller.selection.end;

    if (selectionEnd == 0) {
      return "";
    }

    // Ensure the index is valid before getting the substring
    if (selectionEnd >= 0 && selectionEnd < text.length) {
      return text.substring(selectionEnd);
    } else {
      return "";
    }
  }

  Widget renderText(TextStyle textStyle, String text) {
    return Text(
      overflow: TextOverflow.visible,
      text.isEmpty ? "Write something here..." : text,
      style: textStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    final properties = widget.element.getProperties<TextListElementModel>();
    final textStyle = properties.textStyle();

    return Container(
      constraints: BoxConstraints(minHeight: 50, minWidth: double.infinity),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: textListColumnSpacing,
        children: [
          for (var i = 0; i < textList.length; i++)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: textListRowSpacing,
              children: [
                BulletNumberList(
                  properties: properties,
                  index: i,
                ),
                if (!isFocused)
                  Expanded(child: renderText(textStyle, textList[i]))
                else
                  editingPoint != i
                      ? getClickableText(i, textStyle)
                      : getInputWidget(i, textStyle),
              ],
            ),
        ],
      ),
    );
  }

  Widget getClickableText(int i, TextStyle textStyle) {
    return Expanded(
      child: GestureDetector(
          onTap: () {
            if (editingPoint == -1) {
              return;
            }
            setState(() {
              if (textList[editingPoint] != controller.text) {
                final newText = List<String>.from(textList);
                newText[editingPoint] = controller.text;
                textList = newText;
              }
              editingPoint = i;
              controller.text = textList[i];
            });
          },
          child: renderText(textStyle, textList[i])),
    );
  }

  Widget getInputWidget(int i, TextStyle textStyle) {
    return Expanded(
      child: KeyboardListener(
        key: ValueKey("KeyboardListener"),
        focusNode: focusNode,
        onKeyEvent: (value) {
          // if is key down return
          if (value.runtimeType == KeyUpEvent) {
            return;
          }

          // if delete key is pressed
          if (value.logicalKey == LogicalKeyboardKey.backspace &&
              controller.text == "" &&
              textList.length > 1) {
            setState(() {
              final newIndex = editingPoint != 0 ? editingPoint - 1 : 0;
              controller.text = textList[newIndex];
              final newTextList = List<String>.from(textList);
              newTextList.removeAt(i);
              textList = newTextList;

              // controller.text = properties.textList[newIndex];
              editingPoint = newIndex;
            });
          } else if (value.logicalKey == LogicalKeyboardKey.enter) {
            setState(() {
              final newTextList = List<String>.from(textList);

              // update to be only the text before the selected
              newTextList[editingPoint] =
                  controller.text.substring(0, controller.selection.end);

              // Create a new point from what is after the selection
              final newPoint = editingPoint + 1;
              String leftover = _getTextAfterSelection();

              if (newPoint < newTextList.length) {
                newTextList.insert(newPoint, leftover);
              } else {
                newTextList.add(leftover);
              }

              textList = newTextList;
              editingPoint = newPoint;

              controller.text = leftover;
              Future.delayed(Duration(milliseconds: 1)).then(
                (value) {
                  controller.text = leftover;
                },
              );
            });
          }
        },
        child: SizedBox(
          width: double.infinity,
          child: TextField(
            key: textListKey,
            decoration: null,
            onChanged: onChange,
            autofocus: true,
            undoController: undoController,
            style: textStyle.copyWith(height: 1.2),
            cursorColor: textStyle.color,
            keyboardType: TextInputType.multiline,
            scrollPadding: EdgeInsets.zero,
            selectionControls: DesktopTextSelectionControls(),
            maxLines: null,
            enableInteractiveSelection: true,
            readOnly: false,
            minLines: null,
            scrollController: _scrollController,
            controller: controller,
          ),
        ),
      ),
    );
  }
}

class TextListLayerWidget extends StatelessWidget {
  final ElementModel element;
  const TextListLayerWidget({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    final style = RubricEditorStyle.of(context);
    final properties = element.getProperties<TextListElementModel>();
    return Text(
      maxLines: 1,
      "List (${properties.textList.length})",
      style: properties.textStyle().copyWith(fontSize: 14),
      overflow: TextOverflow.ellipsis,
    );
  }
}

class TextListReaderWidget extends StatelessWidget {
  final ElementModel element;
  final CanvasModel canvas;
  const TextListReaderWidget(
      {super.key, required this.element, required this.canvas});

  @override
  Widget build(BuildContext context) {
    final properties = element.getProperties<TextListElementModel>();

    return Column(
        mainAxisSize: MainAxisSize.min,
        spacing: textListColumnSpacing,
        children: [
          for (var i = 0; i < properties.textList.length; i++)
            Row(
                spacing: textListRowSpacing,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BulletNumberList(
                    properties: properties,
                    index: i,
                  ),
                  Expanded(
                    child: Text(
                      overflow: TextOverflow.visible,
                      properties.textList[i],
                      style: properties.textStyle(),
                    ),
                  ),
                ])
        ]);
  }
}

class BulletNumberList extends StatelessWidget {
  final TextListElementModel properties;
  final int index;
  const BulletNumberList(
      {super.key, required this.properties, required this.index});

  @override
  Widget build(BuildContext context) {
    final textStyle = properties.textStyle();
    if (properties.textListType == TextListTypes.bulleted) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Text(
          "•",
          style: textStyle.copyWith(fontSize: textStyle.fontSize),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Text(
          "${index + 1}.",
          style: textStyle,
        ),
      );
    }
  }
}

class PointInserter extends StatelessWidget {
  final Function() onTap;
  const PointInserter({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = RubricEditorStyle.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: theme.theme,
          ),
          width: 70,
          height: 30,
          child: RubricIcon(Icons.add, color: theme.back),
        ),
      ),
    );
  }
}
