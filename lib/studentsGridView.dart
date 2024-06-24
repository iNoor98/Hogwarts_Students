import 'package:flutter/material.dart';
import 'package:hogwarts_students/cardItem.dart';
import 'package:hogwarts_students/students.dart';
import 'package:hogwarts_students/students_data.dart';


class StudentsGridView extends StatelessWidget {
  const StudentsGridView({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HOGWARTS STUDENTS',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: DummyStudents.studentDataItems.length,
          itemBuilder: (BuildContext context, int index) {
            return  CardItem(student:DummyStudents.studentDataItems[index]);
          },
        ),
      ),
    );
  }
}
