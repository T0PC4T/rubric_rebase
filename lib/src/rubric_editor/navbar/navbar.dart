import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/shared.dart';
import 'package:rubric/src/rubric_editor/models/preview.dart';
import 'package:rubric/src/rubric_editor/navbar/dropdown.dart';
import 'package:rubric/src/rubric_editor/toolbar/element_toolbar.dart';

class NavbarWidget extends StatelessWidget {
  static const double navbarHeight = 60;
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
          SizedBox(width: navbarHeight * 0.15, height: navbarHeight),
          Container(
            padding: RubricEditorStyle.padding,
            width: NavbarWidget.navbarHeight * 5.85,
            alignment: Alignment.centerLeft,
            child: RubricText(
              isDark: true,
              editorState.canvas.value.settings.name,
              textType: TextType.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                // todo add mobile support.
                RubricIconButton(
                  hasNotification: editorState.mobileDirty,
                  style: RBStyles.dark,
                  isActive:
                      editorState.edits.value.viewMode == ViewModes.mobile,
                  iconData: Icons.phone_android,
                  size: NavbarWidget.navbarHeight,
                  onTap: () {
                    editorState.changeViewMode(ViewModes.mobile);
                  },
                ),
                RubricIconButton(
                  hasNotification: false,
                  style: RBStyles.dark,
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
            style: RBStyles.dark,
            iconData: Icons.undo,
            size: NavbarWidget.navbarHeight,
            disabled: !editorState.edits.canUndo,
            onTap: () {
              editorState.undo();
            },
          ),

          RubricIconButton(
            style: RBStyles.dark,
            iconData: Icons.redo,
            size: NavbarWidget.navbarHeight,
            disabled: !editorState.edits.canRedo,
            onTap: () {
              editorState.redo();
            },
          ),
          RubricIconButton(
            style: RBStyles.dark,
            iconData: editorState.edits.value.previewing
                ? Icons.edit
                : Icons.remove_red_eye_rounded,
            size: NavbarWidget.navbarHeight,
            onTap: () {
              editorState.edits.selectElements(null);
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
              editorState.edits.selectElements(null);
              editorState.save();
            },
          ),
          // Dropdown that will show exit without saving.
          Container(
            width: 1,
            height: NavbarWidget.navbarHeight,
            color: style.theme,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              width: 1,
              height: NavbarWidget.navbarHeight - 10,
              color: style.light.withAlpha(100),
            ),
          ),
          RubricButton.theme(
            style,
            width: NavbarWidget.navbarHeight * .66,
            height: NavbarWidget.navbarHeight,
            onTap: () {
              editorState.edits.selectElements(null);
              if (editorState.overlays.any(
                (element) => element.runtimeType == SaveDropDownWidget,
              )) {
                editorState.popOverlay();
                return;
              }
              editorState.pushOverlay(SaveDropDownWidget(), removeToLength: 0);
            },
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: style.light,
              size: ElementToolbarWidget.iconSize,
            ),
          ),
        ],
      ),
    );
  }
}
