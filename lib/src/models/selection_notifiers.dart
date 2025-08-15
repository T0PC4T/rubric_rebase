import 'package:rubric/src/models/elements.dart';

class SelectionNotifier {
  SelectionNotifier() : _selection = [];
  Map<String, Function(bool focused)> _listeners = {};

  void addListener(String id, Function(bool focused) listener) {
    _listeners[id] = listener;
  }

  void dispose() {
    _listeners = {};
  }

  final List<ElementModel> _selection;
  List<ElementModel> get selection => _selection;
  set selection(dynamic input) {
    List<ElementModel> newSelection;

    if (input case ElementModel element) {
      newSelection = [element];
    } else if (input case List<ElementModel> elements) {
      newSelection = elements;
    } else {
      newSelection = [];
    }

    // Notify that the items that are selected and no longer are
    for (var e in _selection) {
      if (!newSelection.contains(e)) {
        _listeners[e.id]?.call(false);
      }
    }
    // Notify that the items that were not selected and now are
    for (var e in newSelection) {
      if (!_selection.contains(e)) {
        _listeners[e.id]?.call(true);
      }
    }
    _selection.clear();
    _selection.addAll(newSelection);
  }

  void removeListener(String id) {
    _listeners.remove(id);
  }
}

class FocusNotifier {
  Map<String, Function(bool focused)> _listeners = {};

  void addListener(String id, Function(bool focused) listener) {
    _listeners[id] = listener;
  }

  void dispose() {
    _listeners = {};
  }

  ElementModel? _focus;
  ElementModel? get focus => _focus;
  set focus(ElementModel? newFocus) {
    if (_focus case ElementModel element) {
      _listeners[element.id]?.call(false);
    }
    if (newFocus case ElementModel element) {
      _listeners[element.id]?.call(true);
    }
    _focus = newFocus;
  }

  void removeListener(String id) {
    _listeners.remove(id);
  }
}
