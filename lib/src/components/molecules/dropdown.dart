import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';

class RubricDropdown<T> extends StatefulWidget {
  final List<DropdownMenuItem<T>>? items;
  final DropdownButtonBuilder? selectedItemBuilder;
  final double? menuWidth;
  final double itemHeight;
  final ValueChanged<T?>? onChanged;
  final T? value;

  const RubricDropdown({
    this.items,
    this.selectedItemBuilder,
    this.onChanged,
    this.value,
    this.menuWidth = 90,
    this.itemHeight = 50,
    super.key,
  });

  @override
  State<RubricDropdown<T>> createState() => RubricDropdownState<T>();
}

class RubricDropdownState<T> extends State<RubricDropdown<T>> {
  T? value;
  @override
  Widget build(BuildContext context) {
    final styles = RubricEditorStyle.of(context);
    return DropdownButton<T>(
      itemHeight: widget.itemHeight,
      menuWidth: widget.menuWidth,
      padding: EdgeInsets.all(RubricEditorStyle.paddingUnit * 0.5),
      underline: SizedBox(),
      isDense: true,
      value: value ?? widget.value,
      borderRadius: BorderRadius.circular(styles.radius),
      items: widget.items,
      selectedItemBuilder: widget.selectedItemBuilder,
      onChanged: (newValue) {
        if (widget.onChanged case ValueChanged<T?> onChanged) {
          onChanged(newValue);
        }
        setState(() {
          value = newValue;
        });
      },
      dropdownColor: styles.light,

      style: TextStyle(color: styles.dark, fontSize: styles.fontSize),
    );
  }
}
