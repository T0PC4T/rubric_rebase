import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/shared.dart';
import 'package:rubric/src/elements/elements.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_icon/icon_widget.dart';

class RightClickMenu extends StatelessWidget {
  const RightClickMenu({
    super.key,
    required this.editorState,
    required this.elements,
    required this.offset,
  });

  final RubricEditorState editorState;
  final List<ElementModel> elements;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    final List<({Widget icon, String text, Function() onTap})> buttons = [];
    if (elements.length == 1) {
      buttons.add((
        icon: RubricIcon(Icons.copy),
        text: "Duplicate",
        onTap: () {
          final element = elements.first;
          editorState.edits.selectElements(null);
          editorState.canvas.duplicateElement(element);
          editorState.popToLength(1);
        }
      ));
      buttons.add((
        icon: RubricIcon(Icons.flip_to_front_rounded),
        text: "Bring to front",
        onTap: () {
          editorState.edits.selectElements(null);
          editorState.canvas.sendTo(elements.first, front: true);
          editorState.popToLength(1);
        },
      ));
      buttons.add((
        icon: RubricIcon(Icons.flip_to_back_rounded),
        text: "Send to back",
        onTap: () {
          editorState.edits.selectElements(null);
          editorState.canvas.sendTo(elements.first, front: false);
          editorState.popToLength(1);
        },
      ));
    } else {
      buttons.add((
        icon: RubricIcon(Icons.account_tree_outlined),
        text: "Group",
        onTap: () {
          editorState.popToLength(1);
        },
      ));

      if (elements.every((element) {
        return element.type == ElementType.text;
      })) {
        // merge text elements
        buttons.add((
          icon: RubricIcon(Icons.merge),
          text: "Merge text",
          onTap: () {
            editorState.canvas.mergeTextElements(elements);
            editorState.edits.selectElements(null);
            editorState.popToLength(1);
          },
        ));
      }
    }

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
              // print(event.buttons);
              // print(kPrimaryButton);
              // if (event.buttons == kPrimaryButton) {
              //   print("HAPPENING");

              // }
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
              color: editorState.style.light9,
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
                        backgroundColor: editorState.style.light98,
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
                      backgroundColor: editorState.style.light98,
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
                        editorState.canvas.deleteElements(elements);
                        editorState.edits.selectElements(null);
                        editorState.popToLength(1);
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
