import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/shared.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_icon/icon_widget.dart';

class RightClickMenu extends StatelessWidget {
  const RightClickMenu({
    super.key,
    required this.editorState,
    required this.element,
    required this.offset,
  });

  final RubricEditorState editorState;
  final ElementModel element;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    final List<({Widget icon, String text, Function() onTap})> buttons = [];
    buttons.add((
      icon: RubricIcon(Icons.copy),
      text: "Duplicate",
      onTap: () {
        final element = this.element;
        editorState.edits.focusElement();
        editorState.canvas.duplicateElement(element);
      }
    ));

    const double rightMenuButtonHeight = 40;
    double rightMenuHeight =
        rightMenuButtonHeight * (buttons.length + 1) + (buttons.length + 2);
    const double rightMenuWidth = 150;

    final size = MediaQuery.sizeOf(context);
    Offset trueOffset = offset;
    if (offset.dx + rightMenuWidth > size.width) {
      trueOffset = Offset(offset.dx - rightMenuWidth, trueOffset.dy);
    }
    if (offset.dy + rightMenuHeight > size.height) {
      trueOffset = Offset(trueOffset.dx, offset.dy - rightMenuHeight);
    }

    return Stack(
      children: [
        SizedBox.expand(
          child: Listener(
            behavior: HitTestBehavior.opaque,
            onPointerSignal: (event) {
              if (event is PointerScrollEvent) {
                editorState.popOverlay();
              }
            },
            onPointerUp: (event) {
              editorState.popOverlay();
            },
          ),
        ),
        Positioned(
          left: trueOffset.dx,
          top: trueOffset.dy,
          width: rightMenuWidth,
          height: rightMenuHeight,
          child: DecoratedBox(
            decoration: BoxDecoration(
              // dropdown shadow
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(50),
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
              color: editorState.style.fore9,
              // borderRadius: editorState.style.borderRadius,
            ),
            child: ClipRRect(
              // borderRadius: editorState.style.borderRadius,
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: Column(
                  spacing: 1,
                  children: [
                    for (var button in buttons)
                      RubricButton(
                        backgroundColor: editorState.style.fore98,
                        hoverColor: editorState.style.theme8,
                        height: rightMenuButtonHeight,
                        padding: RubricEditorStyle.padding,
                        onTap: button.onTap,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: RubricEditorStyle.paddingNum * .75,
                          children: [
                            button.icon,
                            RubricText(
                              button.text,
                            ),
                          ],
                        ),
                      ),
                    RubricButton(
                      backgroundColor: editorState.style.fore98,
                      hoverColor: editorState.style.danger4,
                      height: rightMenuButtonHeight,
                      padding: RubricEditorStyle.padding,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: RubricEditorStyle.paddingNum * .75,
                        children: [
                          RubricIcon(
                            Icons.delete,
                            size: rightMenuButtonHeight * 0.45,
                          ),
                          RubricText(
                            "Delete",
                          ),
                        ],
                      ),
                      onTap: () {
                        editorState.edits.focusElement();
                        editorState.canvas.deleteElement(element);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
