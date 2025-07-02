import 'package:flutter/material.dart';
import 'package:rubric/src/rubric_editor/models/style.dart';

enum TextType {
  title(1.3),
  big(1.2),
  paragraph(1),

  thick(1.1),

  small(0.9);

  final double sizeMultiplier;
  const TextType(this.sizeMultiplier);
}

class RubricText extends StatelessWidget {
  final String text;
  final TextType textType;
  final bool isDark;
  final bool isCentered;
  const RubricText(
    this.text, {
    super.key,
    this.isCentered = false,
    this.textType = TextType.paragraph,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    final styles = RubricEditorStyle.of(context);
    return Text(
      textAlign: isCentered ? TextAlign.center : TextAlign.center,
      text,
      style: TextStyle(
        color: isDark ? styles.light : styles.dark,
        fontSize: styles.fontSize * textType.sizeMultiplier,
        fontWeight:
            textType == TextType.thick ? FontWeight.w600 : FontWeight.normal,
      ),
    );
  }
}

class RubricTextField extends StatefulWidget {
  final String initialValue;
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onComplete;
  final double? width;
  final String? helpText;
  final String? labelText;
  final int? maxLength;
  const RubricTextField({
    super.key,
    required this.initialValue,
    this.onComplete,
    required this.onChanged,
    this.width,
    this.helpText,
    this.maxLength,
    this.labelText,
  });

  @override
  State<RubricTextField> createState() => _RubricTextFieldState();
}

class _RubricTextFieldState extends State<RubricTextField> {
  String value = "";
  late FocusNode focusNode;
  @override
  void initState() {
    value = widget.initialValue;
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = RubricEditorStyle.of(context);

    return SizedBox(
      width: widget.width,
      child: TextFormField(
        maxLength: widget.maxLength,
        focusNode: focusNode,
        cursorColor: style.dark,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: RubricEditorStyle.paddingNum),
          filled: true,
          fillColor: style.light,
          border: OutlineInputBorder(
            borderRadius: style.borderRadius,
            borderSide: BorderSide(
              color: style.light4,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: style.borderRadius,
            borderSide: BorderSide(
              color: style.theme,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: style.borderRadius,
            borderSide: BorderSide(
              color: style.light4,
            ),
          ),
          hintStyle: TextStyle(color: style.light4),
          hintText: widget.helpText,
          labelText: widget.labelText,
        ),
        style: TextStyle(color: style.dark),
        initialValue: widget.initialValue,
        onChanged: (nvalue) {
          widget.onChanged(nvalue);
          value = nvalue;
        },
        onTapOutside: (event) {
          widget.onComplete?.call(value);
        },
        onEditingComplete: () {
          widget.onComplete?.call(value);
        },
      ),
    );
  }
}

class RubricBorderlessTextField extends StatefulWidget {
  final String initialValue;
  final ValueChanged<String> onChanged;
  final double width;
  const RubricBorderlessTextField({
    super.key,
    required this.initialValue,
    required this.onChanged,
    this.width = 150,
  });

  @override
  State<RubricBorderlessTextField> createState() =>
      _RubricBorderlessTextFieldState();
}

class _RubricBorderlessTextFieldState extends State<RubricBorderlessTextField> {
  String value = "";
  late FocusNode focusNode;
  @override
  void initState() {
    value = widget.initialValue;
    focusNode = FocusNode();
    focusNode.addListener(_l);
    super.initState();
  }

  _l() {
    if (!focusNode.hasFocus) {
      widget.onChanged(value);
    }
  }

  @override
  void dispose() {
    focusNode.removeListener(_l);
    focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = RubricEditorStyle.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: RubricEditorStyle.paddingNum),
      width: widget.width,
      child: TextFormField(
        focusNode: focusNode,
        cursorColor: style.theme,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
        style: TextStyle(color: style.light, fontSize: 18),
        initialValue: widget.initialValue,
        onChanged: (nvalue) {
          value = nvalue;
        },
        onEditingComplete: () {
          widget.onChanged(value);
        },
      ),
    );
  }
}
