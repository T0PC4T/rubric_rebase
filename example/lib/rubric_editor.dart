// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example/main.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';

class RubricLessonEditorWidget extends StatefulWidget {
  const RubricLessonEditorWidget({
    super.key,
    this.width,
    this.height,
    required this.moduleID,
    required this.onSaved,
  });

  final double? width;
  final double? height;
  final String moduleID;
  final Future Function() onSaved;

  @override
  State<RubricLessonEditorWidget> createState() =>
      _RubricLessonEditorWidgetState();
}

class _RubricLessonEditorWidgetState extends State<RubricLessonEditorWidget> {
  Future<DocumentSnapshot<Map<String, dynamic>>>? future;

  @override
  void initState() {
    final firestore = FirebaseFirestore.instanceFor(
      app: firebaseApp!,
      databaseId: "test",
    );
    future = firestore.collection("modules").doc(widget.moduleID).get();
    future!.then((value) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot case AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>(
          data: DocumentSnapshot<Map<String, dynamic>> data,
        )) {
          final map = data.data();
          CanvasModel canvasModel;
          if (map?["lesson_data"] == null) {
            canvasModel = CanvasModel();
          } else {
            canvasModel = CanvasModel.fromJson(map!["lesson_data"]);
          }
          canvasModel = canvasModel.copyWith(
            settings: canvasModel.settings.copyWith(
              name: map?["name"] ?? "Untitled",
              icon: map?["icon"] ?? "doc",
            ),
          );

          return RubricEditor(
            canvas: canvasModel,
            onDiscard: () {
              widget.onSaved();
            },
            onSave: ([canvas]) {
              if (canvas case CanvasModel canvas) {
                snapshot.data?.reference.update({
                  "name": canvas.settings.name,
                  "icon": canvas.settings.icon,
                  "lesson_data": canvas.toJson(),
                });
              }
              widget.onSaved();
            },
            bytesToURL: (Uint8List bytes, {String? name, String? type}) async {
              final storage = FirebaseStorage.instance;
              // upload file to storage
              final ref = storage.ref().child(
                "lessons/${widget.moduleID}_${DateTime.now().millisecondsSinceEpoch}_$name",
              );
              // todo limit the size of files that can be uploaded!
              final uploadTask = ref.putData(bytes);
              final snapshot = await uploadTask.whenComplete(() {});
              final url = await snapshot.ref.getDownloadURL();
              return url;
            },
            style: RubricEditorStyle(
              logoUrl:
                  "https://firebasestorage.googleapis.com/v0/b/academy-5q7q96.firebasestorage.app/o/static%2Flogo.png?alt=media",
            ),
          );
        }
        return SizedBox.shrink(child: Text("Unable to load data"));
      },
    );
  }
}
