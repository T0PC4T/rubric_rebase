import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:rubric/src/components/atoms/popup.dart';
import 'package:rubric/src/components/shared.dart';
import 'package:rubric/src/rubric_editor/models/style.dart';

class RubricColorPicker extends StatefulWidget {
  final Function(Color) onComplete;
  final Color color;
  const RubricColorPicker({
    super.key,
    required this.onComplete,
    required this.color,
  });

  @override
  State<RubricColorPicker> createState() => RubricColorPickerState();
}

class RubricColorPickerState extends State<RubricColorPicker> {
  late Color color;
  bool customColor = false;
  @override
  void initState() {
    color = widget.color;
    super.initState();
  }

  static const int numberOfItemsPerRow = 4;

  @override
  Widget build(BuildContext context) {
    final style = RubricEditorStyle.of(context);
    return SizedBox(
      width: PopupWidget.popWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!customColor)
            Wrap(
              children: [
                for (var c in style.brandColors)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.onComplete(c);
                      });
                    },
                    child: Container(
                      width: (PopupWidget.popWidth -
                              style.paddingNum * numberOfItemsPerRow * 2) /
                          numberOfItemsPerRow,
                      height: (PopupWidget.popWidth -
                              style.paddingNum * numberOfItemsPerRow * 2) /
                          numberOfItemsPerRow,
                      margin: style.padding,
                      decoration: BoxDecoration(
                        color: c,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      customColor = true;
                    });
                  },
                  child: Container(
                    width: (PopupWidget.popWidth -
                            style.paddingNum * numberOfItemsPerRow * 2) /
                        numberOfItemsPerRow,
                    height: (PopupWidget.popWidth -
                            style.paddingNum * numberOfItemsPerRow * 2) /
                        numberOfItemsPerRow,
                    margin: style.padding,
                    decoration: BoxDecoration(
                      // radial gradient
                      gradient: LinearGradient(
                        // center: Alignment.center,
                        // radius: 0.9,
                        colors: [
                          const Color.fromARGB(255, 193, 255, 47),
                          const Color.fromARGB(255, 255, 126, 116),
                          const Color.fromARGB(255, 89, 92, 255),
                        ],
                      ),

                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.add, size: 30, color: Colors.white),
                  ),
                ),
              ],
            )
          else ...[
            ColorPicker(
              pickerColor: color,
              displayThumbColor: false,
              hexInputBar: false,
              colorPickerWidth: 240,
              portraitOnly: true,
              paletteType: PaletteType.hueWheel,
              onColorChanged: (value) {
                color = value;
              },
            ),
            RubricButton.light(
              style,
              height: 40,
              width: 150,
              child: RubricText("Select"),
              onTap: () {
                widget.onComplete(color);
              },
            ),
          ],
        ],
      ),
    );
  }
}
