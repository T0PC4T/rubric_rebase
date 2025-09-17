import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/atoms/divider.dart';
import 'package:rubric/src/components/shared.dart';
import 'package:rubric/src/elements/base/enums.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/navbar/navbar.dart';
import 'package:rubric/src/rubric_editor/sidebar/sidebar.dart';
import 'package:rubric/src/rubric_editor/toolbar/dropdown.dart';

class ElementToolbarWidget extends StatelessWidget {
  final ElementModel element;
  final Widget Function(ElementModel element) builder;
  static const double elementToolbarHeight = 40;
  static const double iconSize = 24;
  const ElementToolbarWidget({
    super.key,
    required this.element,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);
    final style = RubricEditorStyle.of(context);

    return ValueListenableBuilder(
      valueListenable: editorState.canvas,
      builder: (context, canvas, _) {
        final newestElement = canvas.element(element.id);
        return Container(
          padding: EdgeInsets.only(
            top: NavbarWidget.navbarHeight,
            left: RubricSideBar.sideBarSize,
          ),
          alignment: Alignment.topCenter,
          child: Container(
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.all(RubricEditorStyle.paddingUnit * 2),
            height: elementToolbarHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: style.borderRadius,
              boxShadow: [
                BoxShadow(
                  color: style.fore.withAlpha(50),
                  blurRadius: style.elevation,
                  offset: Offset(
                    0,
                    style.elevation,
                  ), // changes position of shadow
                ),
              ],
            ),
            child: builder(newestElement),
          ),
        );
      },
    );
  }
}

class ToolbarUniversalIcons extends StatelessWidget {
  final ElementModel element;
  const ToolbarUniversalIcons({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);
    final style = editorState.style;

    return ValueListenableBuilder(
      valueListenable: editorState.edits,
      builder: (context, editsModel, child) {
        return ValueListenableBuilder(
          valueListenable: editorState.canvas,
          builder: (context, canvalModel, child) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    // Padding
                    RubricVerticleDivider(),
                    RubricToolbarDropdown(
                      onUpdate: (value) {
                        if (value case double newValue) {
                          editorState.canvas.updateElement(
                            element,
                            (element) => element.copyWith(padding: newValue),
                          );
                        }
                      },
                      items: [
                        for (var value in ElementPadding.values)
                          RubricDropdownMenuItem(
                            value: value.value,
                            text: value.display,
                          ),
                      ],
                      child: Row(
                        spacing: RubricEditorStyle.paddingUnit * 0.5,
                        children: [
                          Stack(
                            children: [
                              Transform.scale(
                                scaleY: 1.2,
                                child: Icon(
                                  Icons.settings_overscan_outlined,
                                  size: ElementToolbarWidget.iconSize,
                                ),
                              ),
                            ],
                          ),
                          RubricText("Padding"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}
