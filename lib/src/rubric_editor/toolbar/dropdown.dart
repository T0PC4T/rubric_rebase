import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/shared.dart';
import 'package:rubric/src/utilities/uuid.dart';

class RubricToolbarDropdown<T> extends StatefulWidget {
  final Widget child;
  final List<RubricDropdownMenuItem<T>> items;
  final Function(T? value) onUpdate;
  const RubricToolbarDropdown({super.key, required this.child, required this.items, required this.onUpdate});

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
    offset = box.localToGlobal(Offset(0, size.height));
    if (editorState.overlays case List(
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
              color: editorState.style.back,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(editorState.style.radius),
                bottomRight: Radius.circular(editorState.style.radius),
              ),
              boxShadow: [
                BoxShadow(
                  color: style.fore.withAlpha(50),
                  blurRadius: style.elevation,
                  offset: Offset(0, style.elevation), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                for (var item in widget.items)
                  RubricButton(
                    padding: RubricEditorStyle.padding,
                    backgroundColor: editorState.style.back,
                    hoverColor: editorState.style.fore95,
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
        horizontal: RubricEditorStyle.paddingNum,
        vertical: RubricEditorStyle.paddingNum * 0.5,
      ),
      onTap: showDropdown,
      backgroundColor: style.back,
      hoverColor: style.fore95,
      child: Row(
        spacing: RubricEditorStyle.paddingNum,
        children: [widget.child, Icon(Icons.keyboard_arrow_down_rounded)],
      ),
    );
  }
}

class RubricDropdownMenuItem<T> {
  const RubricDropdownMenuItem({this.onTap, this.enabled = true, required this.value, required this.text});

  Widget get child => Container(
    padding: EdgeInsets.only(left: RubricEditorStyle.paddingNum),
    alignment: Alignment.centerLeft,
    child: RubricText(text),
  );
  final String text;
  final VoidCallback? onTap;
  final T? value;
  final bool enabled;
}
