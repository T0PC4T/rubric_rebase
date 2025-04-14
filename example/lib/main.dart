import 'package:example/rubric_editor.dart';
import 'package:example/rubric_viewer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

const FirebaseOptions destination = FirebaseOptions(
  apiKey: "AIzaSyD2h1Xa3aT0b-FuxX1q54cAg6Ps4MnXR-E",
  authDomain: "academy-5q7q96.firebaseapp.com",
  projectId: "academy-5q7q96",
  storageBucket: "academy-5q7q96.firebasestorage.app",
  messagingSenderId: "492783007613",
  appId: "1:492783007613:web:16400f648afd47c338fe14",
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: destination);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final b = 1 + 1 == 2;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body:
            b
                ? RubricLessonEditorWidget(
                  moduleID: "4fvNvIN5wYjiJPoAsCH3",
                  onSaved: () async {},
                )
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(color: Colors.black, height: 52),
                    Expanded(
                      child: RubricLessonReaderWidget(
                        moduleID: "4fvNvIN5wYjiJPoAsCH3",
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}
