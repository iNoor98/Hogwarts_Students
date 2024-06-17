import 'package:flutter/material.dart';

enum Students {

},

class Student {
  final String studentName;
  final String studentHouse;
  final String photoUrl;
  final int studentAge;
  final String studentFavouritePet;
  final String studentWandType;

  Student({
    required this.studentName,
    required this.studentHouse,
    required this.photoUrl,
    required this.studentAge,
    required this.studentFavouritePet,
    required this.studentWandType,
  });
}
