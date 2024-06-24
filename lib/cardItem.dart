import 'package:flutter/material.dart';
import 'package:hogwarts_students/students.dart';
import 'package:hogwarts_students/students_data.dart';

import 'detail_screen.dart';

class CardItem extends StatelessWidget {
 final Student student;

    const CardItem({required this.student, super.key});

  @override
  Widget build(BuildContext context) {
    return (InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              student: student,
            ),
          ),
        );
      },
      child: Card(
        color: student.color,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: student.color,
                  child: ClipOval(
                    child: Image.network(
                      student.photoUrl,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                student.studentName,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
