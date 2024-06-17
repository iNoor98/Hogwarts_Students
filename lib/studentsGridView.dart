import 'package:flutter/material.dart';

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
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
      childAspectRatio: 3/2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
        ),
        children: const [

          ],
      ),
    );
  }
}
