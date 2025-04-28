import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';

final primary = const Color.fromARGB(255, 0, 162, 255);
final dark = Colors.black;
final light = Colors.white;
final primaryDark = Color.lerp(primary, dark, 0.85)!;
final primaryLight = Color.lerp(primary, light, 0.1)!;

class RubricLessonReaderWidget extends StatefulWidget {
  final String moduleID;
  final double? width;
  final double? height;
  final Future Function() onComplete;
  const RubricLessonReaderWidget({
    super.key,
    this.width,
    this.height,
    required this.moduleID,
    required this.onComplete,
  });

  @override
  State<RubricLessonReaderWidget> createState() =>
      RubricLessonReaderWidgetState();
}

final _textStyle = TextStyle(
  color: light,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

class RubricLessonReaderWidgetState extends State<RubricLessonReaderWidget> {
  late Stream<DocumentSnapshot<Map<String, dynamic>>> future;

  @override
  void initState() {
    final firestore = FirebaseFirestore.instance;
    future = firestore.collection("modules").doc(widget.moduleID).snapshots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: StreamBuilder(
        stream: future,
        builder: (context, snapshot) {
          if (snapshot
              case AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>(
                data: DocumentSnapshot<Map<String, dynamic>> data,
              )) {
            final map = data.data();

            return Column(
              children: [
                Container(
                  color: primaryDark,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              "https://firebasestorage.googleapis.com/v0/b/academy-5q7q96.firebasestorage.app/o/static%2Flogo.png?alt=media",
                            ),
                          ),

                          Text(
                            map?["name"] ?? "Untitled",
                            style: _textStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),

                      CompleteButtonWidget(onComplete: widget.onComplete),
                    ],
                  ),
                ),
                Expanded(
                  child: RubricReader(
                    canvasModel:
                        map?["lesson_data"] == null
                            ? CanvasModel()
                            : CanvasModel.fromJson(map!["lesson_data"]),
                  ),
                ),
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class CompleteButtonWidget extends StatefulWidget {
  final Future Function() onComplete;
  const CompleteButtonWidget({super.key, required this.onComplete});

  @override
  State<CompleteButtonWidget> createState() => _CompleteButtonWidgetState();
}

class _CompleteButtonWidgetState extends State<CompleteButtonWidget> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return MouseRegion(
      onEnter: (_) {
        if (!hovered) {
          setState(() => hovered = true);
        }
      },
      onExit: (_) {
        if (hovered) {
          setState(() => hovered = false);
        }
      },
      cursor: SystemMouseCursors.click,
      opaque: true,
      onHover: (_) {
        if (!hovered) {
          setState(() => hovered = true);
        }
      },

      child: GestureDetector(
        onTap: widget.onComplete,
        child: Container(
          alignment: Alignment.center,
          color: hovered ? primaryLight : primary,
          height: double.infinity,
          width: size.width > 600 ? 240 : 60,
          child:
              size.width > 600
                  ? Text("Complete Lesson", style: _textStyle)
                  : Icon(Icons.done, color: Colors.white, size: 25),
        ),
      ),
    );
  }
}
