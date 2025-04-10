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
  final Widget? child;
  static const double elementToolbarHeight = 40;
  static const double iconSize = 24;
  const ElementToolbarWidget({super.key, required this.element, this.child});

  @override
  Widget build(BuildContext context) {
    final style = RubricEditorStyle.of(context);

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
              color: style.dark.withAlpha(50),
              blurRadius: style.elevation,
              offset: Offset(0, style.elevation), // changes position of shadow
            ),
          ],
        ),
        child: child,
      ),
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
        valueListenable: editorState.canvas,
        builder: (context, value, child) {
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
                        // quite botchy
                        element.padding = newValue;
                        editorState.canvas
                            .updateElement(element, element.properties);
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
                            Icon(
                              Icons.expand,
                              size: ElementToolbarWidget.iconSize,
                            ),
                            Transform.rotate(
                              angle: 3.1415 / 2,
                              child: Icon(
                                Icons.expand,
                                size: ElementToolbarWidget.iconSize,
                              ),
                            ),
                          ],
                        ),
                        RubricText("Padding"),
                      ],
                    ),
                  ),
                  if (element.fixed) ...[
                    RubricVerticleDivider(),
                    RubricToolbarDropdown(
                      onUpdate: (value) {
                        if (value case double newValue) {
                          // quite botchy
                          element.fixedWidth = newValue;
                          editorState.canvas.updateElement(element);
                        }
                      },
                      items: [
                        for (var value in FixedWidths.values)
                          RubricDropdownMenuItem(
                            value: value.value,
                            text: value.display,
                          ),
                      ],
                      child: Row(
                        spacing: RubricEditorStyle.paddingUnit * 0.5,
                        children: [
                          Transform.rotate(
                            angle: 3.1415 / 2,
                            child: Icon(
                              Icons.expand,
                              size: ElementToolbarWidget.iconSize,
                            ),
                          ),
                          RubricText("Width"),
                        ],
                      ),
                    ),
                  ],
                  RubricVerticleDivider(),
                  RubricIconButton(
                    iconData: Icons.lock_open_rounded,
                    size: ElementToolbarWidget.elementToolbarHeight,
                    isActive: !element.fixed,
                    onTap: () {
                      editorState.canvas.fixElement(element, false);
                    },
                  ),
                  RubricIconButton(
                    iconData: Icons.lock_outline,
                    size: ElementToolbarWidget.elementToolbarHeight,
                    isActive: element.fixed,
                    onTap: () {
                      editorState.canvas.fixElement(element, true);
                    },
                  ),
                ],
              ),
            ],
          );
        });
  }
}
