import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/atoms/button.dart';
import 'package:rubric/src/utilities/uuid.dart';

class RubricToolbarDropdown<T> extends StatefulWidget {
  final Widget child;
  final List<DropdownMenuItem<T>> items;
  final Function(T? value) onUpdate;
  const RubricToolbarDropdown({
    super.key,
    required this.child,
    required this.items,
    required this.onUpdate,
  });

  @override
  State<RubricToolbarDropdown> createState() => RubricToolbarDropdownState<T>();
}

// todo edit this.
class RubricToolbarDropdownState<T> extends State<RubricToolbarDropdown<T>> {
  String openID = "";
  Offset offset = Offset.zero;
  Size size = Size.zero;

  void showDropdown() {
    final editorState = RubricEditorState.of(context);
    final style = editorState.style;
    final box = (context.findRenderObject() as RenderBox);
    size = box.size;
    offset = box.localToGlobal(
      Offset(0, size.height - editorState.style.radius),
    );
    if (editorState.overlays
        case List(
          isNotEmpty: true,
          last: Positioned(key: ValueKey key),
        ) when key.value == openID) {
      editorState.popToLength(1);
    } else {
      openID = newID();
      editorState.pushOverlay(
        removeToLength: 1,
        Positioned(
          key: ValueKey(openID),
          left: offset.dx,
          top: offset.dy,
          child: Container(
            width: size.width,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: editorState.style.light,
              borderRadius: editorState.style.borderRadius,
              boxShadow: [
                BoxShadow(
                  color: style.dark.withAlpha(50),
                  blurRadius: style.elevation,
                  offset: Offset(
                    0,
                    style.elevation,
                  ), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                for (var item in widget.items)
                  RubricButton(
                    padding: editorState.style.padding,
                    backgroundColor: editorState.style.light,
                    hoverColor: editorState.style.light95,
                    onTap: () {
                      widget.onUpdate(item.value);
                      editorState.popOverlay();
                    },
                    child: item.child,
                  ),
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final style = RubricEditorStyle.of(context);
    return RubricButton(
      padding: EdgeInsets.symmetric(
        horizontal: style.paddingNum,
        vertical: style.paddingNum * 0.5,
      ),
      onTap: showDropdown,
      backgroundColor: style.light,
      hoverColor: style.light95,
      child: Row(
        spacing: style.paddingNum,
        children: [widget.child, Icon(Icons.keyboard_arrow_down_rounded)],
      ),
    );
  }
}
