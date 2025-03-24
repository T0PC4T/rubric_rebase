import 'package:flutter/cupertino.dart';
import 'package:rubric/src/models/canvas.dart';
import 'package:rubric/src/models/elements.dart';

class CanvasNotifier extends ValueNotifier<CanvasModel> {
  CanvasNotifier(super.value);

  // these actions do not actually change the state of canvas

  addElement(element) {
    value.elements = [...value.elements, element];
    commit();
  }

  @override
  notifyListeners() {
    print("CanvasNotifier.notifying");
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
  scaleElement(ElementModel element, Offset offset) {
    element.width = offset.dx;
    element.height = offset.dy;
  }

  moveElement(ElementModel element, Offset offset) {
    element.x = offset.dx;
    element.y = offset.dy;
  }

  updateElement(ElementModel element, Map<String, dynamic> properties) {
    element.properties = properties;
    commit();
  }

  reorderElements(int oldIndex, int newIndex) {
    // ? I switched this around because the list is reverse beware.
    if (oldIndex > newIndex) {
      newIndex += 1;
    }
    final ElementModel item = value.elements.removeAt(oldIndex);
    value.elements.insert(newIndex, item);
    commit();
  }

  moveItem(int oldIndex, int newIndex) {
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
