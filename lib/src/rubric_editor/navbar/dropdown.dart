import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/shared.dart';
import 'package:rubric/src/rubric_editor/navbar/navbar.dart';

class SaveDropDownWidget extends StatelessWidget {
  const SaveDropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);
    final style = editorState.style;
    return Positioned(
        top: NavbarWidget.navbarHeight,
        right: 0,
        width: NavbarWidget.navbarHeight * 2.66 + 1,
        child: Column(
          children: [
            if (1 + 1 == 2)
              RubricButton(
                backgroundColor: Color.lerp(style.fore, style.theme4, 0.4)!,
                hoverColor: Color.lerp(style.fore, style.theme2, 0.8)!,
                width: double.infinity,
                height: NavbarWidget.navbarHeight,
                child: RubricText(
                  "Download HTML",
                  textType: TextType.thick,
                  color: style.back,
                ),
                onTap: () {
                  editorState.edits.focusElement();
                  editorState.downloadHTML();
                },
              ),
            RubricButton(
              backgroundColor: Color.lerp(style.fore, style.danger, 0.4)!,
              hoverColor: Color.lerp(style.fore, style.danger, 0.8)!,
              width: double.infinity,
              height: NavbarWidget.navbarHeight,
              child: RubricText(
                "Discard Changes",
                textType: TextType.thick,
                color: style.back,
              ),
              onTap: () {
                editorState.edits.focusElement();
                editorState.discard();
              },
            ),
          ],
        ));
  }
}
