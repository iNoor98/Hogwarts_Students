import 'package:flutter/material.dart';
import 'package:hogwarts_students/students.dart';

import 'detail_screen.dart';

class StudentsGridView extends StatelessWidget {
  StudentsGridView({super.key});

  final List<Student> studentDataItems = [
    Student(
      studentName: 'Pansy Parkinson',
      studentHouse: 'Slytherin',
      photoUrl: 'https://cdn.staticneo.com/w/harrypotter/PansyParkinson.jpeg',
      studentAge: '20',
      studentFavouritePet: 'Owl',
      studentWandType: 'ThestralTailHair',
      color: Colors.green,
    ),
    Student(
      studentName: 'Harry Potter',
      studentHouse: 'Gryffindor',
      photoUrl:  'https://upload.wikimedia.org/wikipedia/en/d/d7/Harry_Potter_character_poster.jpg',
      studentAge: '20',
      studentFavouritePet: 'Owl',
      studentWandType: 'Phoenix Feather',
      color: Colors.red,
    ),
    Student(
      studentName: 'Neville Longbottom',
      studentHouse: 'Gryffindor',
      photoUrl: 'https://upload.wikimedia.org/wikipedia/en/7/75/Neville_Longbottom.jpeg',
      studentAge: '17',
      studentFavouritePet: 'Hamster',
      studentWandType: 'UniCornHair',
      color: Colors.red,
    ),
    Student(
      studentName: 'Ron Weasley',
      studentHouse: 'Gryffindor',
      photoUrl: 'https://upload.wikimedia.org/wikipedia/en/5/5e/Ron_Weasley_poster.jpg',
      studentAge: '20',
      studentFavouritePet: 'Rat',
      studentWandType: 'ThestralTailHair',
      color: Colors.red,
    ),
    Student(
      studentName: 'Cho Chang',
      studentHouse: 'Ravenclaw',
      photoUrl: 'https://upload.wikimedia.org/wikipedia/bs/b/be/Cho_Chang3.jpg',
      studentAge: '19',
      studentFavouritePet: 'Rat',
      studentWandType: 'PhoenixFeather',
      color: Colors.blue,
    ),
    Student(
      studentName: 'Cedric Diggory',
      studentHouse: 'Hufflepuff',
      photoUrl: 'https://upload.wikimedia.org/wikipedia/en/f/f7/Cedric_Diggory.jpeg',
      studentAge: '18',
      studentFavouritePet: 'Frog',
      studentWandType: 'PhoenixFeather',
      color: Colors.yellow,
    ),
    Student(
      studentName: 'Ginny Weasley',
      studentHouse: 'Gryffindor',
      photoUrl: 'https://upload.wikimedia.org/wikipedia/en/e/e7/Ginny_Weasley_poster.jpg',
      studentAge: '17',
      studentFavouritePet: 'Owl',
      studentWandType: 'DragonHartString',
      color: Colors.red,
    ),
    Student(
      studentName: 'Luna Lovegood',
      studentHouse: 'Ravenclaw',
photoUrl: 'https://upload.wikimedia.org/wikipedia/ms/2/2c/Luna_Lovegood_2.jpg',
      studentAge: '14',
      studentFavouritePet: 'Hamster',
      studentWandType: 'PhoenixFeather',
      color: Colors.blue,
    ),
    Student(
      studentName: 'Parvati Patil',
      studentHouse: 'Gryffindor',
      photoUrl: 'https://upload.wikimedia.org/wikipedia/ms/1/1f/Patil2.jpg',
      studentAge: '16',
      studentFavouritePet: 'Owl',
      studentWandType: 'ThestralTailHair',
      color: Colors.red,
    ),
    Student(
      studentName: 'Hermione Granger',
      studentHouse: 'Gryffindor',
      photoUrl: 'https://upload.wikimedia.org/wikipedia/en/d/d3/Hermione_Granger_poster.jpg',
      studentAge: '21',
      studentFavouritePet: 'Frog',
      studentWandType: 'DragonHartString',
      color: Colors.red,
    ),
  ];


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
          itemCount: studentDataItems.length,
          itemBuilder: (BuildContext context, int index) {
            final student = studentDataItems[index];
            return InkWell(
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
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
