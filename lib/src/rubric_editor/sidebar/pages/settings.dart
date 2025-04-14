import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/atoms/container.dart';
import 'package:rubric/src/components/atoms/popup.dart';
import 'package:rubric/src/components/molecules/color_picker.dart';
import 'package:rubric/src/components/shared.dart';
import 'package:rubric/src/models/editor_models.dart';
import 'package:rubric/src/rubric_icon/icon_grid.dart';
import 'package:rubric/src/rubric_icon/icon_widget.dart';

class Item {
  Item({
    required this.title,
    required this.icon,
    required this.bodyBuilder,
    this.isExpanded = false,
  });

  String title;
  IconData icon;
  WidgetBuilder bodyBuilder;
  bool isExpanded;
}

class GeneralSettingsPageWidget extends StatefulWidget {
  const GeneralSettingsPageWidget({super.key});

  @override
  State<GeneralSettingsPageWidget> createState() =>
      _GeneralSettingsPageWidgetState();
}

class _GeneralSettingsPageWidgetState extends State<GeneralSettingsPageWidget> {
  RubricEditorState? editorState;
  final statuses = ["Draft", "Published", "Archived"];
  late List<Item> _data;
  @override
  void initState() {
    _data = [
      Item(
        title: "Details",
        icon: Icons.edit_document,
        isExpanded: true,
        bodyBuilder: (context) {
          final style = editorState!.style;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: RubricEditorStyle.paddingNum * 0.5,
            children: [
              RubricText(
                "Lesson title",
                textType: TextType.small,
              ),
              RubricTextField(
                maxLength: 30,
                initialValue: editorState!.canvas.value.settings.name,
                onChanged: (value) {
                  editorState!.canvas.updateSettings(
                    editorState!.canvas.value.settings.copyWith(
                      name: value,
                    ),
                  );
                },
              ),
              SizedBox(height: RubricEditorStyle.paddingNum),
              // statuses dropdown
              RubricText(
                "Lesson icon",
                textType: TextType.small,
              ),
              GestureDetector(
                onTap: () {
                  final settings = editorState!.canvas.value.settings;
                  final newIcon = PopupWidget.showPopup<String>(
                    context,
                    (closeWith) {
                      return SizedBox(
                        width: PopupWidget.popWidth,
                        height: (PopupWidget.popWidth /
                                RubricIconGrid.iconsAcross) *
                            RubricIconGrid.iconsDown,
                        child: RubricIconGrid(
                          onSelect: closeWith,
                          currentIcon: settings.icon,
                          buttonColor: style.light98,
                          iconColor: style.light4,
                          hoverColor: style.light9,
                          iconSelectedColor: style.theme2,
                          borderRadius: style.radius,
                          marginNum: RubricEditorStyle.paddingNum,
                        ),
                      );
                    },
                  );
                  newIcon.then((value) {
                    if (value case String newIcon) {
                      editorState!.canvas.updateSettings(
                        editorState!.canvas.value.settings.copyWith(
                          icon: newIcon,
                        ),
                      );
                    }
                  });
                },
                child: RubricContainer(
                  height: 100,
                  width: double.infinity,
                  child: RubricIcon(
                    editorState!.canvas.value.settings.icon,
                    size: 50,
                    color: style.light4,
                  ),
                ),
              ),
            ],
          );
        },
      ),
      Item(
        title: "Grid",
        icon: Icons.grid_3x3,
        isExpanded: false,
        bodyBuilder: (context) {
          final style = editorState!.style;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: RubricEditorStyle.paddingNum * 1.5,
            children: [
              ColorPickerSettingsWidget(
                title: "Grid Line Color",
                color: editorState!.canvas.value.settings.gridColor,
                onUpdate: (color) {
                  editorState!.canvas.updateSettings(
                    editorState!.canvas.value.settings.copyWith(
                      gridColor: color,
                    ),
                  );
                },
              ),
              Row(
                children: [
                  RubricText("Line Spacing: "),
                  RubricDropdown<GridSizes>(
                    value: editorState!.canvas.value.settings.gridSize,
                    items: [
                      for (var item in GridSizes.values)
                        DropdownMenuItem<GridSizes>(
                          value: item,
                          child: Text(item.pretty),
                        ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        editorState!.canvas.updateSettings(
                          editorState!.canvas.value.settings.copyWith(
                            gridSize: value,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
      Item(
        title: "Background",
        icon: Icons.collections_sharp,
        isExpanded: false,
        bodyBuilder: (context) {
          return Column(
            spacing: RubricEditorStyle.paddingNum * 1.5,
            children: [
              ColorPickerSettingsWidget(
                title: "Canvas Color",
                color: editorState!.canvas.value.settings.canvasColor,
                onUpdate: (color) {
                  editorState!.canvas.updateSettings(
                    editorState!.canvas.value.settings.copyWith(
                      canvasColor: color,
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    editorState ??= RubricEditorState.of(context);
    final style = editorState!.style;
    // todo, make this listen to editor
    return SingleChildScrollView(
      child: ValueListenableBuilder(
        valueListenable: editorState!.canvas,
        builder: (context, canvas, child) {
          return ExpansionPanelList(
            elevation: 0,
            materialGapSize: 1,
            expandedHeaderPadding: EdgeInsets.zero,
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _data[index].isExpanded = isExpanded;
              });
            },
            children: _data.map<ExpansionPanel>((Item item) {
              return ExpansionPanel(
                backgroundColor: style.light,
                highlightColor: style.light95,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Padding(
                    padding: RubricEditorStyle.padding,
                    child: Row(
                      spacing: RubricEditorStyle.paddingNum,
                      children: [
                        Icon(item.icon, size: 20, color: style.light4),
                        RubricText(item.title),
                      ],
                    ),
                  );
                },
                body: Container(
                  color: style.light95,
                  padding: RubricEditorStyle.padding,
                  child: item.bodyBuilder(context),
                ),
                isExpanded: item.isExpanded,
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class ColorPickerSettingsWidget extends StatelessWidget {
  const ColorPickerSettingsWidget({
    super.key,
    required this.title,
    required this.onUpdate,
    required this.color,
  });

  final String title;
  final Color color;
  final Function(Color color) onUpdate;

  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);
    final canvas = editorState.canvas.value;
    return Row(
      spacing: RubricEditorStyle.paddingNum,
      children: [
        RubricColorButton(
          color: color,
          onTap: () async {
            final newColor = await PopupWidget.showPopup<Color>(context, (
              closeWith,
            ) {
              return RubricColorPicker(
                onComplete: closeWith,
                color: canvas.settings.backgroundColor,
              );
            });
            if (newColor == null) return;
            onUpdate(newColor);
          },
        ),
        RubricText(title),
      ],
    );
  }
}
