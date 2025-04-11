import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/shared.dart';
import 'package:rubric/src/rubric_editor/models/preview.dart';
import 'package:rubric/src/rubric_editor/toolbar/element_toolbar.dart';

class NavbarWidget extends StatelessWidget {
  static const double navbarHeight = 56;
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);
    final style = RubricEditorStyle.of(context);

    return ColoredBox(
      color: style.dark,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: RubricEditorStyle.halfPadding,
              width: navbarHeight,
              height: navbarHeight,
              child: Image.network(style.logoUrl)),
          Container(
            padding: RubricEditorStyle.padding,
            width: NavbarWidget.navbarHeight * 5,
            alignment: Alignment.centerLeft,
            child: RubricText(
              isDark: true,
              editorState.canvas.value.settings.name,
              textType: TextType.title,
            ),
          ),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                // todo add mobile support.
                RubricIconButton(
                  isDark: true,
                  isActive:
                      editorState.edits.value.viewMode == ViewModes.mobile,
                  iconData: Icons.phone_android,
                  size: NavbarWidget.navbarHeight,
                  onTap: () {
                    editorState.changeViewMode(ViewModes.mobile);
                  },
                ),
                RubricIconButton(
                  isDark: true,
                  isActive:
                      editorState.edits.value.viewMode == ViewModes.desktop,
                  iconData: Icons.desktop_mac_rounded,
                  size: NavbarWidget.navbarHeight,
                  onTap: () {
                    editorState.changeViewMode(ViewModes.desktop);
                  },
                ),
              ],
            ),
          ),

          RubricIconButton(
            isDark: true,
            iconData: Icons.undo,
            size: NavbarWidget.navbarHeight,
            disabled: !editorState.edits.canUndo,
            onTap: () {
              editorState.undo();
            },
          ),

          RubricIconButton(
            isDark: true,
            iconData: Icons.redo,
            size: NavbarWidget.navbarHeight,
            disabled: !editorState.edits.canRedo,
            onTap: () {
              editorState.redo();
            },
          ),
          RubricIconButton(
            isDark: true,
            iconData: editorState.edits.value.previewing
                ? Icons.edit
                : Icons.remove_red_eye_rounded,
            size: NavbarWidget.navbarHeight,
            onTap: () {
              editorState.edits.selectElement(null);
              editorState.setPreview(!editorState.edits.value.previewing);
            },
          ),
          RubricButton.theme(
            style,
            width: NavbarWidget.navbarHeight * 2,
            height: NavbarWidget.navbarHeight,
            child: RubricText(
              "Save & Exit",
              textType: TextType.thick,
              isDark: true,
            ),
            onTap: () {
              editorState.edits.selectElement(null);
              editorState.save();
            },
          ),
          // Dropdown that will show exit without saving.
          RubricButton(
            width: NavbarWidget.navbarHeight,
            height: NavbarWidget.navbarHeight,
            backgroundColor: Color.lerp(style.dark, style.danger, 0.4)!,
            hoverColor: Color.lerp(style.dark, style.danger, 0.8)!,
            onTap: () {
              editorState.edits.selectElement(null);
              editorState.discard();
            },
            child: Icon(
              Icons.close,
              color: style.light,
              size: ElementToolbarWidget.iconSize,
            ),
          ),
        ],
      ),
    );
  }
}
