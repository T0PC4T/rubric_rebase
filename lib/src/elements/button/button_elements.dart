import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/elements/base/enums.dart';
import 'package:rubric/src/elements/base/states.dart';
import 'package:rubric/src/elements/button/button_model.dart';
import 'package:rubric/src/elements/button/button_toolbar.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:url_launcher/url_launcher.dart';

const buttonPadding = EdgeInsets.all(10);

class ButtonEditorElement extends StatefulWidget {
  final ElementModel element;
  final bool header;
  const ButtonEditorElement({super.key, required this.element})
      : header = false;

  const ButtonEditorElement.header({super.key, required this.element})
      : header = true;
  @override
  State<ButtonEditorElement> createState() => ButtonEditorElementState();
}

BoxDecoration? buttonDecoration(ButtonElementModel properties,
    [bool hovered = false]) {
  if (properties.style == ButtonStyles.text.value) {
    return null;
  }
  switch (ButtonStyles.fromString(properties.style)) {
    case ButtonStyles.outlined:
      return BoxDecoration(
        color: Color.lerp(properties.color.withAlpha(0), properties.color,
            hovered ? 0.05 : 0),
        border: Border.all(
            color: hovered
                ? Color.lerp(properties.color, Colors.white, 0.25)!
                : properties.color,
            width: 2),
        borderRadius: BorderRadius.circular(properties.borderRadius),
      );
    case ButtonStyles.filled:
      return BoxDecoration(
        color: !hovered
            ? properties.color
            : Color.lerp(properties.color, Colors.white, 0.25)!,
        borderRadius: BorderRadius.circular(properties.borderRadius),
      );

    case ButtonStyles.text:
      return BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(properties.borderRadius),
      );
  }
}

class ButtonEditorElementState extends FocusableState<ButtonEditorElement> {
  late TextEditingController controller;
  late ScrollController _scrollController;
  late FocusNode focusNode;
  late UndoHistoryController undoController;

  @override
  void initState() {
    final textProperties = widget.element.getProperties<ButtonElementModel>();
    controller = TextEditingController(text: textProperties.text);
    focusNode = FocusNode(debugLabel: "Text ${widget.element.id}");
    _scrollController = ScrollController();
    undoController = UndoHistoryController();

    super.initState();
  }

  @override
  ElementModel get element => widget.element;

  @override
  void onFocus(bool focused) {
    if (focused) {
      focusNode.requestFocus();
    } else {
      final properties = widget.element.getProperties<ButtonElementModel>();
      editorState.canvas.updateProperties(
        widget.element,
        properties.copyWith(text: controller.text).toJson(),
      );
    }
  }

  double _oldHeight = 0;
  _onChange(String value) {
    final box = (context.findRenderObject() as RenderBox);
    if (_oldHeight != box.size.height) {
      _oldHeight = box.size.height;
      final properties = widget.element.getProperties<ButtonElementModel>();
      editorState.canvas.updateProperties(
        widget.element,
        properties.copyWith(text: controller.text).toJson(),
      );
    }
  }

  @override
  void didUpdateWidget(covariant ButtonEditorElement oldWidget) {
    final properties = widget.element.getProperties<ButtonElementModel>();
    final oldProperties = oldWidget.element.getProperties<ButtonElementModel>();
    if (properties.text != oldProperties.text) {
      controller.text = properties.text;
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  onSelect(bool selected) {
    if (selected) {
      editorState.showToolbar(
        widget.element,
        ButtonTooltipWidget(
          element: widget.element,
          controller: controller,
          undoController: undoController,
          header: widget.header,
        ),
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final properties = widget.element.getProperties<ButtonElementModel>();

    return Container(
      alignment: Alignment.center,
      decoration: buttonDecoration(properties),
      padding: buttonPadding,
      child: Transform.translate(
        offset: Offset(0, -0),
        child: TextField(
          decoration: InputDecoration.collapsed(
              hintText: "[Empty Text]",
              hintStyle: TextStyle(color: Colors.black.withAlpha(100))),
          undoController: undoController,

          // spellCheckConfiguration: SpellCheckConfiguration(),
          cursorColor: properties.color,
          keyboardType: TextInputType.multiline,
          scrollPadding: EdgeInsets.zero,
          selectionControls: DesktopTextSelectionControls(),
          textAlign: TextAlign.center,

          style: TextStyle(
              height: 1.8,
              fontSize: FontSizes.medium.value.toDouble(),
              color: properties.textColor,
              fontWeight: FontWeight.bold,
              decoration: properties.style == ButtonStyles.text.value
                  ? TextDecoration.underline
                  : null,
              decorationColor: properties.textColor),

          maxLines: null,
          enableInteractiveSelection: true,
          readOnly: false,
          minLines: null,
          onChanged: _onChange,
          scrollController: _scrollController,
          controller: controller,
          focusNode: focusNode,
        ),
      ),
    );
  }
}

class ButtonLayerWidget extends StatelessWidget {
  final ElementModel element;
  const ButtonLayerWidget({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    final style = RubricEditorStyle.of(context);
    final textElement = element.getProperties<ButtonElementModel>();
    return Text(
      maxLines: 1,
      textElement.text,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class ButtonReaderWidget extends StatefulWidget {
  final ElementModel element;
  final CanvasModel canvas;
  const ButtonReaderWidget(
      {super.key, required this.element, required this.canvas});

  @override
  State<ButtonReaderWidget> createState() => ButtonReaderWidgetState();
}

class ButtonReaderWidgetState extends State<ButtonReaderWidget> {
  bool _hovered = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final properties = widget.element.getProperties<ButtonElementModel>();
    return MouseRegion(
      onEnter: (event) => setState(() => _hovered = true),
      onExit: (event) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          if (properties.link.isEmpty) {
            return;
          }
          String link = properties.link;
          if (!link.startsWith("http")) {
            link = "https://$link";
          }
          await launchUrl(
            Uri.parse(link),
            webOnlyWindowName: '_blank',
          );
        },
        child: Container(
          decoration: buttonDecoration(properties, _hovered),
          padding: buttonPadding,
          child: Text(
            overflow: TextOverflow.visible,
            properties.text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: FontSizes.medium.value.toDouble(),
                color: properties.textColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
