import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:rubric/src/elements/elements.dart';
import 'package:rubric/src/elements/row/row_model.dart';
import 'package:rubric/src/models/canvas.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/utilities/uuid.dart';

class CanvasNotifier extends ValueNotifier<CanvasModel> {
  CanvasNotifier(super.value);

  // these actions do not actually change the state of canvas

  addElement(element, {int index = 0}) {
    List<ElementModel> newElements = List.from(value.elements);
    newElements.insert(index, element);
    value = value.copyWith(elements: newElements);
    commit();
  }

  dragInElement(
      {required ElementModel insert,
      required ElementModel exiting,
      required bool above,
      ElementModel? parent}) {
    if (parent != null) {
      if (parent.type == ElementType.row) {
        final rowModel = parent.getProperties<RowElementModel>();

        // Find the column and index of the exiting element
        int columnIndex = -1;
        int elementIndexInColumn = -1;

        for (int i = 0; i < rowModel.elements.length; i++) {
          final column = rowModel.elements[i];
          if (column.isEmpty && i.toString() == exiting.id) {
            columnIndex = i;
            elementIndexInColumn = 0;
            break;
          }
          for (int j = 0; j < column.length; j++) {
            if (ElementModel.fromMap(column[j]).id == exiting.id) {
              columnIndex = i;
              elementIndexInColumn = j;
              break;
            }
          }
          if (columnIndex != -1) break;
        }

        if (columnIndex != -1) {
          final newColumns = List<List<Map<String, dynamic>>>.from(rowModel
              .elements
              .map((col) => List<Map<String, dynamic>>.from(col)));

          if (above) {
            newColumns[columnIndex]
                .insert(elementIndexInColumn, insert.toMap());
          } else {
            newColumns[columnIndex]
                .insert(elementIndexInColumn + 1, insert.toMap());
          }

          updateProperties(
              parent, rowModel.copyWith(elements: newColumns).toJson());
        } else {
          print("Unable to find id ${exiting.id} in row");
        }
      }
    } else {
      int index = value.elements.indexOf(exiting);
      if (index == -1) {
        index = 0;
      }
      addElement(insert, index: index + (above ? 0 : 1));
    }
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

  ElementModel getElement(String elementID) {
    return value.elements.firstWhere((element) => element.id == elementID);
  }

  updateProperties(ElementModel element, Map<String, dynamic> properties) {
    for (var e in value.elements) {
      if (e.type == ElementType.row) {
        final rowModel = e.getProperties<RowElementModel>();
        for (var i = 0; i < rowModel.elements.length; i++) {
          for (var j = 0; j < rowModel.elements[i].length; j++) {
            final rowElement = ElementModel.fromMap(rowModel.elements[i][j]);

            if (rowElement.id == element.id) {
              rowElement.properties = properties;
              rowModel.elements[i][j] = rowElement.toMap();
              return updateProperties(e, rowModel.toJson());
            }
          }
        }
      }
      if (e.id == element.id) {
        e.properties = properties;
        commit();
        return;
      }
    }
  }

  reorderElements(
      List<ElementModel>? cachedElements, int oldIndex, int newIndex) {
    // ? I switched this around because the list is reverse beware.
    if (cachedElements != null) {
      value.elements = cachedElements;
    }
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final ElementModel item = value.elements.removeAt(oldIndex);
    value.elements.insert(newIndex, item);

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

  duplicateElement(ElementModel element) {
    ElementModel newElement = element.copyWith(id: newID());
    if (element.type == ElementType.row) {
      final properties = element.getProperties<RowElementModel>();
      final newElements = properties.elements.map((column) {
        return column.map((e) {
          return ElementModel.fromMap(e).copyWith(id: newID()).toMap();
        }).toList();
      }).toList();
      newElement = newElement.copyWith(
          properties: properties.copyWith(elements: newElements).toJson());
    }

    dragInElement(insert: newElement, exiting: element, above: false);
  }

  deleteElement(ElementModel deleteElement) {
    final List<ElementModel> newElements = [];
    for (var element in value.elements) {
      if (element.type == ElementType.row) {
        final rowModel = element.getProperties<RowElementModel>();
        for (var columnIndex = 0;
            columnIndex < rowModel.columns;
            columnIndex++) {
          final column = rowModel.elements[columnIndex];
          for (var elementIndex = 0;
              elementIndex < column.length;
              elementIndex++) {
            final rowElement = ElementModel.fromMap(column[elementIndex]);
            if (rowElement.id == deleteElement.id) {
              // DELETE THIS ITEM AND REPACKAGE PROPERTIES DO AN UPDATE INSTEAD
              final newColumn = List<Map<String, dynamic>>.from(column);
              newColumn.removeAt(elementIndex);
              final newElements =
                  List<List<Map<String, dynamic>>>.from(rowModel.elements);
              newElements[columnIndex] = newColumn;
              updateProperties(
                  element, rowModel.copyWith(elements: newElements).toJson());
              notifyListeners();
              return;
            }
          }
        }
      }
      if (element.id == deleteElement.id) {
        continue;
      } else {
        newElements.add(element);
      }
    }

    value = value.copyWith(elements: newElements);
    notifyListeners();

    // value.elements = value.elements
    //     .where((element) => element.id != deleteElement.id)
    //     .toList();
    // notifyListeners();
  }
}
