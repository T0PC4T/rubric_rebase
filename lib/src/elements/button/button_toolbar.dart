import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/atoms/divider.dart';
import 'package:rubric/src/components/atoms/popup.dart';
import 'package:rubric/src/components/molecules/border_radius_dropdown.dart';
import 'package:rubric/src/components/molecules/color_picker.dart';
import 'package:rubric/src/components/shared.dart';
import 'package:rubric/src/elements/button/button_model.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/toolbar/dropdown.dart';
import 'package:rubric/src/rubric_editor/toolbar/element_toolbar.dart';

class ButtonTooltipWidget extends StatefulWidget {
  final ElementModel element;
  final TextEditingController controller;
  final UndoHistoryController undoController;
  final bool header;

  const ButtonTooltipWidget({
    super.key,
    required this.element,
    required this.controller,
    required this.undoController,
    required this.header,
  });

  @override
  State<ButtonTooltipWidget> createState() => _ButtonTooltipWidgetState();
}

class _ButtonTooltipWidgetState extends State<ButtonTooltipWidget> {
  String lastValue = "https://www.google.com";
  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);

    return ValueListenableBuilder(
        valueListenable: editorState.canvas,
        builder: (context, canvalModel, child) {
          final properties = canvalModel
              .element(widget.element.id)
              .getProperties<ButtonElementModel>();
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              RubricIconTextButton(
                onTap: () async {
                  final videoUrl = await PopupWidget.showPopup<String>(
                    context,
                    (closeWith) {
                      return SizedBox(
                        width: PopupWidget.popWidth,
                        child: Column(
                          children: [
                            RubricText(
                              "Edit Link",
                              textType: TextType.title,
                            ),
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
                            RubricButton.light(editorState.style,
                                width: 150,
                                height: 30,
                                onTap: () => closeWith(lastValue),
                                child: Text("Save Link"))
                          ],
                        ),
                      );
                    },
                  );
                  if (videoUrl case String newUrl) {
                    editorState.canvas.updateElement(
                      widget.element,
                      properties.copyWith(link: newUrl).toJson(),
                    );
                  }
                },
                iconData: Icons.link,
                text: "Edit Link",
              ),
              RubricVerticleDivider(),
              // Button styles
              RubricToolbarDropdown(
                onUpdate: (value) {
                  if (value case String newValue) {
                    final newProperties = properties.copyWith(
                      style: newValue,
                    );
                    if (newProperties.style == ButtonStyles.outlined.value) {
                      editorState.canvas.updateElement(
                        widget.element,
                        newProperties
                            .copyWith(
                                style: newValue, textColor: properties.color)
                            .toJson(),
                      );
                    } else if (newProperties.style ==
                        ButtonStyles.filled.value) {
                      Color textColor;
                      if (properties.color.computeLuminance() > 0.5) {
                        textColor =
                            Color.lerp(properties.color, Colors.black, 0.5)!;
                      } else {
                        textColor = Colors.white;
                      }
                      editorState.canvas.updateElement(
                        widget.element,
                        newProperties
                            .copyWith(style: newValue, textColor: textColor)
                            .toJson(),
                      );
                    } else {
                      editorState.canvas.updateElement(
                        widget.element,
                        newProperties
                            .copyWith(
                                style: newValue,
                                textColor: editorState.style.theme)
                            .toJson(),
                      );
                    }
                  }
                },
                items: [
                  for (var value in ButtonStyles.values)
                    RubricDropdownMenuItem(
                      value: value.value,
                      text: value.name,
                    ),
                ],
                child: Row(
                  spacing: RubricEditorStyle.paddingUnit * 0.5,
                  children: [
                    Icon(
                      Icons.smart_button_sharp,
                      size: ElementToolbarWidget.iconSize,
                    ),
                    RubricText("Button Style"),
                  ],
                ),
              ),

              RubricVerticleDivider(),
              RubricBorderRadiusDropdown(
                radius: properties.borderRadius,
                onChanged: (value) {
                  if (value case double newValue) {
                    final newProperties = properties.copyWith(
                      borderRadius: newValue,
                    );
                    editorState.canvas.updateElement(
                      widget.element,
                      newProperties.toJson(),
                    );
                  }
                },
              ),
              RubricVerticleDivider(),
              Padding(
                padding: RubricEditorStyle.padding,
                child: RubricColorButton(
                  color: properties.color,
                  onTap: () async {
                    final newColor =
                        await PopupWidget.showPopup<Color>(context, (
                      closeWith,
                    ) {
                      return RubricColorPicker(
                        onComplete: closeWith,
                        color: properties.color,
                      );
                    });
                    if (newColor != null) {
                      editorState.canvas.updateElement(
                        widget.element,
                        properties.copyWith(color: newColor).toJson(),
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.only(
                    left: RubricEditorStyle.paddingNum * 0.5,
                    right: RubricEditorStyle.paddingNum),
                child: RubricColorButton(
                  builder: (color) {
                    return Icon(
                      Icons.text_fields_outlined,
                      color: color == Colors.white ? Colors.black : color,
                      size: ElementToolbarWidget.iconSize,
                    );
                  },
                  color: properties.textColor,
                  onTap: () async {
                    final newColor =
                        await PopupWidget.showPopup<Color>(context, (
                      closeWith,
                    ) {
                      return RubricColorPicker(
                        onComplete: closeWith,
                        color: properties.textColor,
                      );
                    });
                    if (newColor != null) {
                      editorState.canvas.updateElement(
                        widget.element,
                        properties.copyWith(textColor: newColor).toJson(),
                      );
                    }
                  },
                ),
              ),
              ToolbarUniversalIcons(
                element: widget.element,
              ),
            ],
          );
        });
  }
}
