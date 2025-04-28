import 'package:flutter/material.dart';
import 'package:rubric/src/models/canvas.dart';
import 'package:rubric/src/models/canvas_notifier.dart';
import 'package:rubric/src/models/editor_models.dart';
import 'package:rubric/src/rubric_editor/models/preview.dart';
import 'package:rubric/src/rubric_editor/viewer/items/element.dart';
import 'package:rubric/src/rubric_editor/viewer/stack/element_stack.dart';

class RubricReader extends StatefulWidget {
  final CanvasModel canvasModel;
  const RubricReader({
    super.key,
    required this.canvasModel,
  });

  @override
  State<RubricReader> createState() => _RubricReaderState();
}

class _RubricReaderState extends State<RubricReader> {
  late CanvasNotifier canvas;
  @override
  void initState() {
    canvas = CanvasNotifier(widget.canvasModel.copyWith());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: canvas,
        builder: (context, value, child) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            color: widget.canvasModel.settings.canvasColor,
            constraints: BoxConstraints.expand(),
            child: LayoutBuilder(
              builder: (context, constraints) {
                ViewModes curView = constraints.maxWidth < GridSizes.pageSize
                    ? ViewModes.mobile
                    : ViewModes.desktop;
                return SingleChildScrollView(
                  child: Container(
                    padding: curView == ViewModes.desktop
                        ? EdgeInsets.symmetric(vertical: GridSizes.padding)
                        : EdgeInsets.all(0),
                    alignment: curView == ViewModes.desktop
                        ? Alignment.topCenter
                        : null,
                    child: FittedBox(
                      fit: curView == ViewModes.desktop
                          ? BoxFit.none
                          : BoxFit.fitWidth,
                      child: SizedBox(
                        width: curView.width,
                        child: RubricElementStack(
                          secretSetter: (element, x, y, width, height, mobileX,
                              mobileY, mobileWidth, mobileHeight) {
                            canvas.moveElement(
                                ViewModes.desktop, element, Offset(x, y));
                            canvas.moveElement(ViewModes.mobile, element,
                                Offset(mobileX, mobileY));
                            canvas.scaleElement(ViewModes.desktop, element,
                                Offset(width, height));
                            canvas.scaleElement(ViewModes.mobile, element,
                                Offset(mobileWidth, mobileHeight));
                          },
                          offset: Offset.zero,
                          children: [
                            ColoredBox(
                              color: widget.canvasModel.settings.canvasColor,
                            ),
                            for (var element in widget.canvasModel.elements)
                              ReaderElementWidget(
                                viewMode: curView,
                                key: ValueKey(element.id),
                                element: element,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
}
