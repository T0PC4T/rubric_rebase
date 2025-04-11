import 'dart:js_interop';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/models/canvas_notifier.dart';
import 'package:rubric/src/models/editor_models.dart';
import 'package:rubric/src/models/editor_notifier.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/models/preview.dart';
import 'package:rubric/src/rubric_editor/navbar/navbar.dart';
import 'package:rubric/src/rubric_editor/sidebar/sidebar.dart';
import 'package:rubric/src/rubric_editor/toolbar/element_toolbar.dart';
import 'package:rubric/src/rubric_editor/viewer/viewer.dart';
import 'package:rubric/src/rubric_reader/size_block.dart';
import 'package:web/web.dart' as web;

class RubricEditor extends StatefulWidget {
  final RubricEditorStyle style;
  final CanvasModel? canvas;
  final Function([CanvasModel? canvas]) onSave;
  final Future<String> Function(Uint8List bytes, {String? name, String? type})
      bytesToURL;
  const RubricEditor({
    super.key,
    required this.style,
    required this.onSave,
    required this.bytesToURL,
    this.canvas,
  });
  @override
  State<RubricEditor> createState() => RubricEditorState();
}

class RubricEditorState extends State<RubricEditor> {
  late CanvasNotifier canvas;
  late EditorNotifier edits;
  late RubricEditorStyle style;

  late FocusNode keyboardFocus;

  List<Widget> overlays = [];
  BuildContext? innerContext;

  @override
  void initState() {
    web.document.oncontextmenu = (JSAny e) {
      if (e.isA<web.PointerEvent>()) {
        (e as web.PointerEvent).preventDefault();
      }
    }.toJS;
    super.initState();
    canvas = CanvasNotifier(widget.canvas?.copyWith() ?? CanvasModel());
    canvas.addListener(_canvasListener);

    edits = EditorNotifier(CanvasEditingModel(steps: [canvas.clone()]));
    edits.addListener(_editorListener);

    keyboardFocus = FocusNode();
    style = widget.style;
  }

  @override
  void dispose() {
    canvas.removeListener(_canvasListener);
    edits.removeListener(_editorListener);
    keyboardFocus.dispose();
    canvas.dispose();
    edits.dispose();
    super.dispose();
  }

  _editorListener() {
    if (edits.value.focused == null) {
      keyboardFocus.requestFocus();
      if (edits.value.selected == null) {
        clearOverlays();
      }
    } else {
      // keyboardFocus.unfocus();
    }
  }

  save() {
    widget.onSave(canvas.value);
  }

  undo() {
    if (edits.canUndo) {
      canvas.value = edits.undo().copyWith();
    }
  }

  redo() {
    if (edits.canRedo) {
      canvas.value = edits.redo().copyWith();
    }
  }

  _canvasListener() {
    // ? if this is false, the the last change was from an undo.
    if (edits.currentUndo != canvas.value) {
      edits.saveStep(canvas.clone());
    }
  }

  pushOverlay(Widget child, {int? removeToLength}) {
    setState(() {
      overlays = [
        ...overlays.sublist(
            0, math.min(overlays.length, removeToLength ?? overlays.length)),
        child
      ];
    });
  }

  popToLength(int length) {
    setState(() {
      overlays = overlays.sublist(0, length);
    });
  }

  popOverlay() {
    popToLength(overlays.length - 1);
  }

  clearOverlays() {
    setState(() {
      overlays = <Widget>[];
    });
  }

  setPreview(bool preview) {
    edits.setPreview(preview);
    clearOverlays();
  }

  changeViewMode(ViewModes newValue) {
    if (edits.value.viewMode == newValue) {
      return;
    }
    setState(() {
      edits.changeViewMode(newValue);
    });
  }

  showToolbar(ElementModel element, Widget child) {
    pushOverlay(
      ElementToolbarWidget(element: element, child: child),
      removeToLength: 0,
    );
  }

  static RubricEditorState of(BuildContext ctx) {
    if (ctx.findAncestorStateOfType<RubricEditorState>()
        case RubricEditorState state) {
      return state;
    }
    throw AssertionError("RubricEditorState not found");
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      onKeyEvent: (value) {
        if (value.logicalKey == LogicalKeyboardKey.delete) {
          if (edits.value.selected case ElementModel element) {
            edits.selectElement(null);
            canvas.deleteElement(element);
          }
        }
      },
      focusNode: keyboardFocus,
      child: SizeBlockerWidget(
        // previewing ? RubricReader(canvasModel: canvas.value)
        child: Stack(
          fit: StackFit.expand,
          children: [
            DefaultTextStyle(
              style: TextStyle(
                color: style.dark,
                fontSize: style.fontSize,
                fontWeight: style.fontWeight,
              ),
              child: Column(
                children: [
                  NavbarWidget(),
                  if (edits.value.previewing)
                    Expanded(
                      child: Container(
                          color: edits.value.viewMode == ViewModes.mobile
                              ? style.dark
                              : canvas.value.settings.canvasColor,
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: edits.value.viewMode == ViewModes.mobile
                                ? ViewModes.mobile.width
                                : double.infinity,
                            child: RubricReader(
                              canvasModel: canvas.value,
                            ),
                          )),
                    )
                  else
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          RubricSideBar(),
                          Expanded(child: RubricEditorViewer()),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            for (var overlay in overlays) overlay,
          ],
        ),
      ),
    );
  }
}
