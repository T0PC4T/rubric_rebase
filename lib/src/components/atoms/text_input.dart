// class RubricTextInput extends StatefulWidget {
//   final String helpText;
//   final String value;
//   final Function(String value) onComplete;
//   const RubricTextInput({
//     super.key,
//     required this.onComplete,
//     required this.helpText,
//     this.value = "",
//   });

//   @override
//   State<RubricTextInput> createState() => _RubricTextInputState();
// }

// class _RubricTextInputState extends State<RubricTextInput> {
//   late TextEditingController controller;
//   @override
//   void initState() {
//     controller = TextEditingController(text: widget.value);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final style = RubricEditorStyle.of(context);
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         hintText: widget.helpText,
//         border: OutlineInputBorder(
//           borderRadius: style.borderRadius,
//           borderSide: BorderSide(color: style.light7),
//         ),
//       ),
//       onSubmitted: (value) {
//         widget.onComplete(value);
//       },
//     );
//   }
// }
