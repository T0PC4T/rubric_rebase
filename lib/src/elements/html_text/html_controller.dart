import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' show parse;

sealed class ControllerElement {
  const ControllerElement();

  String get char;
  String get text;
  InlineSpan build();
}

class TextControllerElement extends ControllerElement {
  @override
  final String text;
  final TextStyle style;
  final List<TextStylings> stylings;

  const TextControllerElement({required this.text, this.style = const TextStyle(), this.stylings = const []});

  TextControllerElement copyWith({String? text, TextStyle? style, List<TextStylings>? stylings}) {
    return TextControllerElement(
      text: text ?? this.text,
      style: style ?? this.style,
      stylings: stylings ?? this.stylings,
    );
  }

  @override
  String get char => text;

  @override
  InlineSpan build() {
    return TextSpan(
      text: text,
      style: style.copyWith(
        fontWeight: stylings.contains(TextStylings.b) ? FontWeight.bold : FontWeight.normal,
        fontStyle: stylings.contains(TextStylings.i) ? FontStyle.italic : FontStyle.normal,
        decoration: stylings.contains(TextStylings.u) ? TextDecoration.underline : TextDecoration.none,
        decorationColor: stylings.contains(TextStylings.u) ? style.color : null,
        // Visual indicator for selection
        backgroundColor: stylings.contains(TextStylings.selected) ? Colors.amber.withAlpha(100) : style.backgroundColor,
      ),
    );
  }
}

class HtmlControllerElement extends ControllerElement {
  final String html;

  const HtmlControllerElement({required this.html});

  @override
  String get char => '\uFFFC';

  @override
  String get text => html;

  @override
  InlineSpan build() {
    return WidgetSpan(child: HtmlWidget(html));
  }
}

enum TextStylings { b, i, u, selected }

String _colorToHtml(Color color) {
  if (color.a == 1) {
    return '#${((color.r * 255).round().clamp(0, 255)).toRadixString(16).padLeft(2, '0')}${((color.g * 255).round().clamp(0, 255)).toRadixString(16).padLeft(2, '0')}${((color.b * 255).round().clamp(0, 255)).toRadixString(16).padLeft(2, '0')}';
  } else {
    return 'rgba(${((color.r * 255).round().clamp(0, 255))}, ${((color.g * 255).round().clamp(0, 255))}, ${((color.b * 255).round().clamp(0, 255))}, ${((color.a * 255).round().clamp(0, 255))})';
  }
}

bool _areStylingsEqual(List<TextStylings> s1, List<TextStylings> s2) {
  if (s1.length != s2.length) return false;
  final set1 = s1.toSet();
  for (final style in s2) {
    if (!set1.contains(style)) return false;
  }
  return true;
}

String elementsToHTML(List<ControllerElement> elements) {
  final buffer = StringBuffer();
  if (elements.isEmpty) return buffer.toString();

  var group = <TextControllerElement>[];

  void flushGroup() {
    if (group.isEmpty) return;
    final first = group.first;
    var content = group.map((e) => e.text).join();

    if (content.isEmpty) return;

    final stylings = first.stylings;
    final style = first.style;

    if (stylings.contains(TextStylings.u)) content = '<u>$content</u>';
    if (stylings.contains(TextStylings.i)) content = '<i>$content</i>';
    if (stylings.contains(TextStylings.b)) content = '<b>$content</b>';

    final styleAttributes = <String>[];
    if (style.fontSize != null) {
      styleAttributes.add('font-size: ${style.fontSize}px');
    }
    if (style.color != null) {
      styleAttributes.add('color: ${_colorToHtml(style.color!)}');
    }
    if (style.backgroundColor != null) {
      styleAttributes.add('background-color: ${_colorToHtml(style.backgroundColor!)}');
    }

    if (styleAttributes.isNotEmpty) {
      buffer.write('<span style="${styleAttributes.join('; ')}">$content</span>');
    } else {
      buffer.write(content);
    }
    group.clear();
  }

  for (final element in elements) {
    if (element is TextControllerElement) {
      if (group.isEmpty) {
        group.add(element);
        continue;
      }

      final last = group.last;
      if (_areStylingsEqual(last.stylings, element.stylings) &&
          last.style.fontSize == element.style.fontSize &&
          last.style.color == element.style.color &&
          last.style.backgroundColor == element.style.backgroundColor) {
        group.add(element);
      } else {
        flushGroup();
        group.add(element);
      }
    } else if (element is HtmlControllerElement) {
      flushGroup();
      buffer.write(element.html);
    }
  }

  flushGroup();

  return buffer.toString();
}

extension ControllerElementsUtil on List<ControllerElement> {
  String get chars => map((e) => e.char).join();
}

class HTMLEditorController extends TextEditingController {
  HTMLEditorController({required this.elements, super.text});

  factory HTMLEditorController.fromText(String t) {
    final elements = htmlToControllerElement(t);
    return HTMLEditorController(elements: elements, text: elements.chars);
  }

  void flush(String t) {
    final elements = htmlToControllerElement(t);
    text = elements.chars;
    this.elements = elements;
    notifyListeners();
  }

  String toHtml() {
    return elementsToHTML(elements);
  }

  List<ControllerElement> elements;

  /// Intercepts text changes to handle chip deletion and creation via Backspace/Enter
  List<ControllerElement> get selectedElements {
    if (!selection.isValid || selection.isCollapsed) {
      return [];
    }
    // Clamp selection range to be within the bounds of the elements list
    final start = selection.start.clamp(0, elements.length);
    final end = selection.end.clamp(0, elements.length);

    if (start >= end) {
      return [];
    }

    return elements.sublist(start, end);
  }

  void toggleBold() {
    final sel = selection;
    if (!selection.isValid || selection.isCollapsed) {
      return;
    }
    // Clamp selection range to be within the bounds of the elements list
    final start = selection.start.clamp(0, elements.length);
    final end = selection.end.clamp(0, elements.length);

    if (start >= end) {
      return;
    }

    for (var i = start; i < end; i++) {
      final element = elements[i];
      if (element is TextControllerElement) {
        final newStylings = List<TextStylings>.from(element.stylings);
        if (newStylings.contains(TextStylings.b)) {
          newStylings.remove(TextStylings.b);
        } else {
          newStylings.add(TextStylings.b);
        }
        elements[i] = element.copyWith(stylings: newStylings);
      }
    }

    selection = sel;
    notifyListeners();
  }

  void setFontSize(double size) {
    final sel = selection;
    if (!selection.isValid || selection.isCollapsed) return;
    final start = selection.start.clamp(0, elements.length);
    final end = selection.end.clamp(0, elements.length);
    if (start >= end) return;

    for (var i = start; i < end; i++) {
      final element = elements[i];
      if (element is TextControllerElement) {
        elements[i] = element.copyWith(style: element.style.copyWith(fontSize: size));
      }
    }
    selection = sel;
    notifyListeners();
  }

  void setTextColor(Color color) {
    final sel = selection;
    if (!selection.isValid || selection.isCollapsed) return;
    final start = selection.start.clamp(0, elements.length);
    final end = selection.end.clamp(0, elements.length);
    if (start >= end) return;

    for (var i = start; i < end; i++) {
      final element = elements[i];
      if (element is TextControllerElement) {
        elements[i] = element.copyWith(style: element.style.copyWith(color: color));
      }
    }
    selection = sel;
    notifyListeners();
  }

  void setBackgroundColor(Color color) {
    final sel = selection;
    if (!selection.isValid || selection.isCollapsed) return;
    final start = selection.start.clamp(0, elements.length);
    final end = selection.end.clamp(0, elements.length);
    if (start >= end) return;

    for (var i = start; i < end; i++) {
      final element = elements[i];
      if (element is TextControllerElement) {
        elements[i] = element.copyWith(style: element.style.copyWith(backgroundColor: color));
      }
    }
    selection = sel;
    notifyListeners();
  }

  void toggleItalic() {
    final sel = selection;
    if (!selection.isValid || selection.isCollapsed) {
      return;
    }
    // Clamp selection range to be within the bounds of the elements list
    final start = selection.start.clamp(0, elements.length);
    final end = selection.end.clamp(0, elements.length);

    if (start >= end) {
      return;
    }

    for (var i = start; i < end; i++) {
      final element = elements[i];
      if (element is TextControllerElement) {
        final newStylings = List<TextStylings>.from(element.stylings);
        if (newStylings.contains(TextStylings.i)) {
          newStylings.remove(TextStylings.i);
        } else {
          newStylings.add(TextStylings.i);
        }
        elements[i] = element.copyWith(stylings: newStylings);
      }
    }
    selection = sel;
    notifyListeners();
  }

  void toggleUnderline() {
    final sel = selection;
    if (!selection.isValid || selection.isCollapsed) {
      return;
    }
    // Clamp selection range to be within the bounds of the elements list
    final start = selection.start.clamp(0, elements.length);
    final end = selection.end.clamp(0, elements.length);

    if (start >= end) {
      return;
    }

    for (var i = start; i < end; i++) {
      final element = elements[i];
      if (element is TextControllerElement) {
        final newStylings = List<TextStylings>.from(element.stylings);
        if (newStylings.contains(TextStylings.u)) {
          newStylings.remove(TextStylings.u);
        } else {
          newStylings.add(TextStylings.u);
        }
        elements[i] = element.copyWith(stylings: newStylings);
      }
    }
    selection = sel;
    notifyListeners();
  }

  @override
  set value(TextEditingValue newValue) {
    final oldValue = super.value;
    // This is a workaround for a presumed bug in Flutter's handling of
    // WidgetSpans (`\uFFFC`) on backspace. When the character before the cursor
    // is the special object replacement character, we manually handle the
    // deletion of the corresponding `HtmlControllerElement` to prevent
    // potential inconsistencies and crashes from the default text field behavior.
    if (oldValue.selection.isCollapsed &&
        oldValue.selection.start > 0 &&
        newValue.text.length == oldValue.text.length - 1 &&
        newValue.selection.isCollapsed &&
        newValue.selection.start == oldValue.selection.start - 1 &&
        oldValue.text[oldValue.selection.start - 1] == '\uFFFC') {
      final elementIndex = oldValue.selection.start - 1;
      elements.removeAt(elementIndex);

      final newText = elements.chars;

      super.value = TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: elementIndex), // might be causing the issue
      );
      return;
    }
    if (newValue.text == text) {
      // Only selection changed
      super.value = newValue;
      return;
    }

    // Find common prefix
    int prefix = 0;
    while (prefix < text.length && prefix < newValue.text.length && text[prefix] == newValue.text[prefix]) {
      prefix++;
    }

    // Find common suffix
    int suffix = 0;
    while (suffix < text.length - prefix &&
        suffix < newValue.text.length - prefix &&
        text[text.length - 1 - suffix] == newValue.text[newValue.text.length - 1 - suffix]) {
      suffix++;
    }

    final int deletedCount = text.length - prefix - suffix;
    final int insertedCount = newValue.text.length - prefix - suffix;

    if (deletedCount > 0) {
      elements.removeRange(prefix, prefix + deletedCount);
    }

    if (insertedCount > 0) {
      final inserted = newValue.text.substring(prefix, prefix + insertedCount);
      List<TextStylings> newStylings = [];
      if (prefix > 0 && prefix <= elements.length) {
        final prevElement = elements[prefix - 1];
        if (prevElement is TextControllerElement) {
          newStylings = List.from(prevElement.stylings);
        }
      } else if (elements.isNotEmpty && elements.length > prefix) {
        final nextElement = elements[prefix];
        if (nextElement is TextControllerElement) {
          newStylings = List.from(nextElement.stylings);
        }
      }

      final newElements = inserted.split('').map((char) {
        return TextControllerElement(text: char, stylings: newStylings);
      }).toList();

      elements.insertAll(prefix, newElements);
    }

    super.value = newValue;
  }

  @override
  TextSpan buildTextSpan({required BuildContext context, TextStyle? style, required bool withComposing}) {
    final children = <InlineSpan>[];
    for (var element in elements) {
      children.add(element.build());
    }
    return TextSpan(style: style, children: children);
  }

  final List<double> fontSizes = const [10, 12, 14, 16, 18, 20, 24, 36, 48];
  final List<Color> editorColors = const [
    Colors.black,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.cyan,
    Colors.white,
    Colors.transparent,
  ];
}

List<ControllerElement> htmlToControllerElement(String html) {
  final document = parse(html);
  final body = document.body;
  if (body == null) return [];

  final List<ControllerElement> elements = [];
  _parseNode(body, elements, const TextStyle(), []);
  // If the source HTML was just text and didn't have any block-level
  // elements, we won't have a trailing newline. But since our editor
  // treats everything as blocks, let's ensure there's a blank line
  return elements;
}

void _parseNode(
  dom.Node node,
  List<ControllerElement> elements,
  TextStyle parentStyle,
  List<TextStylings> parentStylings,
) {
  if (node is dom.Text) {
    // as it's often used in editors but we want to treat it as a space.
    final text = node.text.replaceAll('​', ' ').replaceAll('\n', '');
    for (var char in text.split('')) {
      elements.add(TextControllerElement(text: char, style: parentStyle, stylings: parentStylings));
    }
    return;
  }

  if (node is dom.Element) {
    const knownTags = ['p', 'h1', 'h2', 'h3', 'div', 'b', 'strong', 'i', 'em', 'u', 'br', 'span'];
    if (node.localName == 'body') {
      for (var child in node.nodes) {
        _parseNode(child, elements, parentStyle, parentStylings);
      }
      return;
    }
    if (node.localName != null && !knownTags.contains(node.localName)) {
      elements.add(HtmlControllerElement(html: node.outerHtml));
      return;
    }
    var newStylings = List<TextStylings>.from(parentStylings);
    switch (node.localName) {
      case 'b':
      case 'strong':
        newStylings.add(TextStylings.b);
        break;
      case 'i':
      case 'em':
        newStylings.add(TextStylings.i);
        break;
      case 'u':
        newStylings.add(TextStylings.u);
        break;
    }

    var newStyle = parentStyle;
    if (node.attributes.containsKey('style')) {
      newStyle = newStyle.merge(_parseStyle(node.attributes['style']!));
    }

    for (var child in node.nodes) {
      _parseNode(child, elements, newStyle, newStylings);
    }

    if (node.localName == 'br') {
      elements.add(TextControllerElement(text: '\n', style: parentStyle, stylings: parentStylings));
    }
  }
}

TextStyle _parseStyle(String styleString) {
  var style = const TextStyle();
  final declarations = styleString.split(';').where((s) => s.trim().isNotEmpty);
  for (var declaration in declarations) {
    final parts = declaration.split(':');
    if (parts.length == 2) {
      final property = parts[0].trim();
      final value = parts[1].trim();
      switch (property) {
        case 'font-size':
          final size = double.tryParse(value.replaceAll('px', ''));
          if (size != null) {
            style = style.copyWith(fontSize: size);
          }
          break;
        case 'color':
          final color = _parseColor(value);
          if (color != null) {
            style = style.copyWith(color: color);
          }
          break;
        case 'background-color':
          final color = _parseColor(value);
          if (color != null) {
            style = style.copyWith(backgroundColor: color);
          }
          break;
      }
    }
  }
  return style;
}

Color? _parseColor(String colorString) {
  if (colorString.startsWith('#')) {
    var hex = colorString.substring(1);
    if (hex.length == 8) {
      // Already includes alpha
      return Color(int.parse(hex, radix: 16));
    }
    if (hex.length == 6) {
      return Color(int.parse('FF$hex', radix: 16));
    }
    if (hex.length == 3) {
      final r = hex[0];
      final g = hex[1];
      final b = hex[2];
      return Color(int.parse('FF$r$r$g$g$b$b', radix: 16));
    }
  } else if (colorString.startsWith('rgba')) {
    final values = colorString.substring(5, colorString.length - 1).split(',');
    if (values.length == 4) {
      final r = int.tryParse(values[0].trim());
      final g = int.tryParse(values[1].trim());
      final b = int.tryParse(values[2].trim());
      final a = double.tryParse(values[3].trim());
      if (r != null && g != null && b != null && a != null) {
        return Color.fromRGBO(r, g, b, a);
      }
    }
  } else if (colorString.startsWith('rgb')) {
    final values = colorString.substring(4, colorString.length - 1).split(',');
    if (values.length == 3) {
      final r = int.tryParse(values[0].trim());
      final g = int.tryParse(values[1].trim());
      final b = int.tryParse(values[2].trim());
      if (r != null && g != null && b != null) {
        return Color.fromRGBO(r, g, b, 1.0);
      }
    }
  }
  return null;
}
