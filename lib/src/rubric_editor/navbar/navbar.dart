import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/shared.dart';
import 'package:rubric/src/rubric_editor/models/preview.dart';

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
              padding: style.halfPadding,
              width: navbarHeight,
              height: navbarHeight,
              child: Image.network(style.logoUrl)),
          Container(
            padding: style.padding,
            width: NavbarWidget.navbarHeight * 4,
            child: RubricText(
              isDark: true,
              editorState.canvas.value.settings.name,
              textType: TextType.title,
            ),
          ),

          // ! Removed Functionality
          // RubricTextField(
          //   width: NavbarWidget.navbarHeight * 4,
          //   initialValue: editorState.canvas.value.settings.name,
          //   onChanged: (value) {
          //     editorState.canvas.updateSettings(
          //       editorState.canvas.value.settings.copyWith(name: value),
          //     );
          //   },
          // ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                if (editorState.previewing case ViewModes mode) ...[
                  // todo add mobile support.
                  RubricIconButton(
                    isDark: true,
                    isActive: mode == ViewModes.mobile,
                    iconData: Icons.phone_android,
                    size: NavbarWidget.navbarHeight,
                    onTap: () {
                      editorState.setPreview(ViewModes.mobile);
                    },
                  ),
                  RubricIconButton(
                    isDark: true,
                    isActive: mode == ViewModes.desktop,
                    iconData: Icons.desktop_mac_rounded,
                    size: NavbarWidget.navbarHeight,
                    onTap: () {
                      editorState.setPreview(ViewModes.desktop);
                    },
                  ),
                ],
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
            iconData: editorState.previewing == null
                ? Icons.remove_red_eye_rounded
                : Icons.edit,
            size: NavbarWidget.navbarHeight,
            onTap: () {
              editorState.edits.selectElement(null);
              if (editorState.previewing == null) {
                editorState.setPreview(ViewModes.desktop);
              } else {
                editorState.setPreview(null);
              }
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
        ],
      ),
    );
  }
}
