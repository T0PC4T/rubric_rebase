import 'package:flutter/cupertino.dart';
import 'package:rubric/src/models/canvas.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/models/preview.dart';

class CanvasNotifier extends ValueNotifier<CanvasModel> {
  CanvasNotifier(super.value);

  // these actions do not actually change the state of canvas

  addElement(element) {
    value.elements = [...value.elements, element];
    commit();
  }

  @override
  notifyListeners() {
    super.notifyListeners();
  }

  CanvasModel clone() {
    return value.copyWith();
  }

  commit() {
    notifyListeners();
  }

  commitIfChange(CanvasModel? canvas) {
    if (value != canvas) {
      commit();
    }
  }

  // updateSettings
  updateSettings(CanvasSettings settings) {
    value.settings = settings;
    commit();
  }

  getElement(String elementID) {
    return value.elements.firstWhere((element) => element.id == elementID);
  }

  // ? Element are editable, they edit until a fixed point then the entire object is copied
  scaleElement(ViewModes viewMode, ElementModel element, Offset offset) {
    if (viewMode == ViewModes.desktop) {
      element.width = offset.dx / ViewModes.desktop.width;
      element.height = offset.dy / ViewModes.desktop.width;
    } else {
      element.mobileWidth = offset.dx / ViewModes.mobile.width;
      element.mobileHeight = offset.dy / ViewModes.mobile.width;
    }
  }

  moveElement(ViewModes viewMode, ElementModel element, Offset offset) {
    if (viewMode == ViewModes.desktop) {
      element.x = offset.dx / ViewModes.desktop.width;
      element.y = offset.dy / ViewModes.desktop.width;
    } else {
      element.mobileX = offset.dx / ViewModes.mobile.width;
      element.mobileY = offset.dy / ViewModes.mobile.width;
    }
  }

  fixElement(ElementModel element, bool fixed) {
    element.fixedWidth = fixed ? 1 : 0;
    if (!fixed) {
      sendTo(element, front: true);
    } else {
      commit();
    }
  }

  updateElement(ElementModel element, [Map<String, dynamic>? properties]) {
    if (properties case Map<String, dynamic> properties) {
      element.properties = properties;
    }
    commit();
  }

  reorderElements(
      List<ElementModel>? cachedElements, int oldIndex, int newIndex) {
    // ? I switched this around because the list is reverse beware.
    cachedElements ??= value.orderedElements.toList();
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final ElementModel item = cachedElements.removeAt(oldIndex);
    cachedElements.insert(newIndex, item);
    for (var i = 0; i < cachedElements.length; i++) {
      value.elements
          .firstWhere(
            (element) => element.id == cachedElements![i].id,
          )
          .orderIndex = i;
    }
    commit();
  }

  sendTo(ElementModel element, {bool front = true}) {
    var oldIndex = value.elements.indexOf(element);
    var newIndex = front ? value.elements.length : 0;

    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final ElementModel item = value.elements.removeAt(oldIndex);
    value.elements.insert(newIndex, item);
    commit();
  }

  changeProperties(ElementModel element, Map<String, dynamic> newPropeties) {
    element.properties = newPropeties;
  }

  deleteElement(ElementModel deleteElement) {
    value.elements = value.elements
        .where((element) => deleteElement.id != element.id)
        .toList();
    notifyListeners();
  }
}
