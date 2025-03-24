import 'package:flutter/material.dart';
import 'package:rubric/src/models/canvas.dart';
import 'package:rubric/src/models/editor_models.dart';
import 'package:rubric/src/rubric_editor/models/preview.dart';

class RubricReader extends StatelessWidget {
  final CanvasModel canvasModel;
  const RubricReader({
    super.key,
    required this.canvasModel,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        ViewModes curView = constraints.maxWidth <= ViewModes.mobile.width
            ? ViewModes.mobile
            : ViewModes.desktop;
        return SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: curView == ViewModes.desktop
                ? EdgeInsets.symmetric(vertical: GridSizes.padding)
                : null,
            color: canvasModel.settings.canvasColor,
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: SizedBox(
                width: GridSizes.pageSize,
                height: canvasModel.readerPageHeight(),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned.fill(
                      child: ColoredBox(
                        color: canvasModel.settings.canvasColor,
                      ),
                    ),
                    for (var element in canvasModel.elements)
                      Positioned(
                        left: element.x,
                        top: element.y,
                        width: element.width,
                        height: element.height,
                        child: element.type.readerBuilder(
                          key: ValueKey("${element.id} Viewer"),
                          element: element,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
