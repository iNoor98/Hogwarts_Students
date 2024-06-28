import 'package:flutter/material.dart';
import 'package:hogwarts_students/students.dart';

import 'detail_screen.dart';

class CardItem extends StatelessWidget {
  final Student student;

  const CardItem({required this.student, super.key});

  static const Map<String, Color> _houseColor = {
    'Slytherin': Colors.green,
    'Hufflepuff': Colors.yellow,
    'Gryffindor': Colors.red,
    'Ravenclaw': Colors.blue,
  };

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
        color: _houseColor[student.studentHouse],
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
                  child: ClipOval(
                    child: Image.network(
                      'https://upload.wikimedia.org/wikipedia/en/d/d7/Harry_Potter_character_poster.jpg',
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
