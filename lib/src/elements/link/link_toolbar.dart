import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/atoms/divider.dart';
import 'package:rubric/src/components/atoms/popup.dart';
import 'package:rubric/src/components/molecules/color_picker.dart';
import 'package:rubric/src/components/shared.dart';
import 'package:rubric/src/elements/base/enums.dart';
import 'package:rubric/src/elements/link/link_model.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/toolbar/dropdown.dart';
import 'package:rubric/src/rubric_editor/toolbar/element_toolbar.dart';

@immutable
class LinkTooltipWidget extends StatefulWidget {
  final ElementModel element;
  final TextEditingController controller;
  final UndoHistoryController undoController;
  final bool header;

  const LinkTooltipWidget({
    super.key,
    required this.element,
    required this.controller,
    required this.undoController,
    required this.header,
  });

  @override
  State<LinkTooltipWidget> createState() => _LinkTooltipWidgetState();
}

class _LinkTooltipWidgetState extends State<LinkTooltipWidget> {
  String lastValue = "";

  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);

    final properties = widget.element.getProperties<LinkElementModel>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        RubricIconTextButton(
          onTap: () async {
            final linkUrl = await PopupWidget.showPopup<String>(context, (closeWith) {
              return SizedBox(
                width: PopupWidget.popWidth,
                child: Column(
                  children: [
                    RubricText("Edit Link", textType: TextType.title),
                    Padding(
                      padding: RubricEditorStyle.padding,
                      child: RubricTextField(
                        initialValue: properties.link,
                        onComplete: closeWith,
                        onChanged: (value) {
                          lastValue = value;
                        },
                        helpText: "https://www.google.com",
                      ),
                    ),
                    RubricButton.light(
                      editorState.style,
                      width: 150,
                      height: 30,
                      onTap: () => closeWith(lastValue),
                      child: Text("Save Link"),
                    ),
                  ],
                ),
              );
            });
            if (linkUrl case String newUrl) {
              editorState.canvas.updateProperties<LinkElementModel>(
                widget.element,
                (properties) => properties.copyWith(link: newUrl).toJson(),
              );
              // editorState.canvas.updateProperties(
              //   widget.element,
              //   properties.copyWith(link: newUrl).toJson(),
              // );
            }
          },
          iconData: Icons.link,
          text: "Edit Link",
        ),
        RubricIconButton(
          isActive: properties.isBold,
          size: ElementToolbarWidget.elementToolbarHeight,
          onTap: () {
            editorState.canvas.updateProperties<LinkElementModel>(
              widget.element,
              (properties) => properties.copyWith(isBold: !properties.isBold).toJson(),
            );
          },
          iconData: Icons.format_bold,
        ),
        RubricIconButton(
          isActive: properties.isItalic,
          size: ElementToolbarWidget.elementToolbarHeight,
          onTap: () {
            editorState.canvas.updateProperties<LinkElementModel>(
              widget.element,
              (properties) => properties.copyWith(isItalic: !properties.isItalic).toJson(),
            );
          },
          iconData: Icons.format_italic,
        ),
        RubricIconButton(
          isActive: properties.isUnderline,
          size: ElementToolbarWidget.elementToolbarHeight,
          onTap: () {
            editorState.canvas.updateProperties<LinkElementModel>(
              widget.element,
              (properties) => properties.copyWith(isUnderline: !properties.isUnderline).toJson(),
            );
          },
          iconData: Icons.format_underline,
        ),
        RubricVerticleDivider(),
        for (var align in ElementAlignment.all)
          RubricIconButton(
            isActive: properties.alignment == align,
            size: ElementToolbarWidget.elementToolbarHeight,
            onTap: () {
              editorState.canvas.updateProperties<LinkElementModel>(
                widget.element,
                (properties) => properties.copyWith(alignment: align).toJson(),
              );
            },
            iconData: ElementAlignment.icon(align),
          ),
        RubricVerticleDivider(),
        Padding(
          padding: RubricEditorStyle.padding,
          child: RubricColorButton(
            color: properties.color,
            onTap: () async {
              final newColor = await PopupWidget.showPopup<Color>(context, (closeWith) {
                return RubricColorPicker(onComplete: closeWith, color: properties.color);
              });
              if (newColor != null) {
                editorState.canvas.updateProperties<LinkElementModel>(
                  widget.element,
                  (properties) => properties.copyWith(color: newColor).toJson(),
                );
              }
            },
          ),
        ),
        RubricToolbarDropdown(
          onUpdate: (value) {
            if (value case double newValue) {
              editorState.canvas.updateProperties<LinkElementModel>(
                widget.element,
                (properties) => properties.copyWith(size: newValue).toJson(),
              );
            }
          },
          items: [
            if (widget.header)
              for (var value in HeadingFontSizes.values) RubricDropdownMenuItem(value: value.value, text: value.display)
            else
              for (var value in FontSizes.values) RubricDropdownMenuItem(value: value.value, text: value.display),
          ],
          child: RubricText("Font Size"),
        ),
        ToolbarUniversalIcons(element: widget.element),
      ],
    );
  }
}
