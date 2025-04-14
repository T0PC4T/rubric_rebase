import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';

class RubricLessonReaderWidget extends StatefulWidget {
  final String moduleID;
  final double? width;
  final double? height;
  const RubricLessonReaderWidget({
    super.key,
    this.width,
    this.height,
    required this.moduleID,
  });

  @override
  State<RubricLessonReaderWidget> createState() =>
      RubricLessonReaderWidgetState();
}

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
    return StreamBuilder(
      stream: future,
      builder: (context, snapshot) {
        if (snapshot case AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>(
          data: DocumentSnapshot<Map<String, dynamic>> data,
        )) {
          final map = data.data();
          return SizedBox.expand(
            child: RubricReader(
              canvasModel: CanvasModel.fromJson(map!["lesson_data"]),
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
