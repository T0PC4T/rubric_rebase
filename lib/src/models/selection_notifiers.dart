import 'package:rubric/src/models/elements.dart';

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
