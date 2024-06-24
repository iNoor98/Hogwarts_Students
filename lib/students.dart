import 'package:flutter/material.dart';


class Student {
  final String studentName;
  final String studentHouse;
  final String photoUrl;
  final String studentAge;
  final String studentFavouritePet;
  final String studentWandType;
  final  MaterialColor color;

  const Student({
    required this.studentName,
    required this.studentHouse,
    required this.photoUrl,
    required this.studentAge,
    required this.studentFavouritePet,
    required this.studentWandType,
    required this.color,
  });
}
