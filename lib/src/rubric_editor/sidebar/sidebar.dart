// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:rubric/src/components/shared.dart';
import 'package:rubric/src/rubric_editor/models/style.dart';
import 'package:rubric/src/rubric_editor/sidebar/pages/menu_elements.dart';
import 'package:rubric/src/rubric_editor/sidebar/pages/menu_settings.dart';
import 'package:rubric/src/rubric_editor/sidebar/pages/menu_structure.dart';
import 'package:rubric/src/rubric_icon/icon_widget.dart';

class RubricSideBar extends StatefulWidget {
  const RubricSideBar({super.key});

  static const double sideBarSize = 240;

  static const pages = [ElementPageWidget(), GeneralSettingsPageWidget(), LayersPageWidget()];

  @override
  State<RubricSideBar> createState() => RubricSideBarState();
}

const sidebarButtonHeight = 70.0;

class RubricSideBarState extends State<RubricSideBar> {
  static const menusIcons = [
    Icons.widgets_rounded,
    // Icons.shape_line_rounded,
    Icons.settings,
    Icons.layers,
  ];
  static const menus = ["Elements", "Settings", "Structure"];

  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final style = RubricEditorStyle.of(context);
    return Container(
      decoration: BoxDecoration(color: style.fore95),
      width: RubricSideBar.sideBarSize,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              for (var i = 0; i < menus.length; i++)
                Expanded(
                  child: RubricButton(
                    hoverColor: style.fore9,
                    backgroundColor: i == pageIndex ? style.fore95 : style.back,
                    height: sidebarButtonHeight,
                    onTap: () {
                      setState(() {
                        pageIndex = i;
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: RubricEditorStyle.paddingUnit * 0.7,
                      children: [
                        Opacity(
                          opacity: i == pageIndex ? 1 : 0,
                          child: Container(color: style.theme, height: 5, width: double.infinity),
                        ),
                        RubricIcon(menusIcons[i], size: 25),
                        RubricText(menus[i], textType: TextType.small, isCentered: true),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          Expanded(child: RubricSideBar.pages[pageIndex]),
        ],
      ),
    );
  }
}
