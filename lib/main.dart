import 'package:flutter/material.dart';
import 'package:hogwarts_students/studentsGridView.dart';
import 'package:hogwarts_students/studentsGridView.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HOGWARTS STUDENTS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home:  StudentsGridView(),
    );
  }
}


