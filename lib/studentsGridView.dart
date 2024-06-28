import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_students/addNewStudent.dart';
import 'package:hogwarts_students/cardItem.dart';
import 'package:hogwarts_students/cubit_state.dart';
import 'package:hogwarts_students/students_data.dart';

import 'cubit_cubit.dart';

class StudentsGridView extends StatelessWidget {
  StudentsGridView({super.key});

  final _studentCubit = StudentsCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HOGWARTS STUDENTS',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: BlocProvider(
        create: (context) => _studentCubit..getStudents(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: BlocBuilder<StudentsCubit, StudentState>(
            builder: (_, state) {
              if (state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is SuccessState) {
                if (state.students.isEmpty) {
                  return _buildEmptyList();
                }
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: state.students.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardItem(
                      student: state.students[index],
                    );
                  },
                );
              }
              if (state is ErrorState) {
                return _buildError();
              }
              return const Center(
                child: Text(
                  'No Student Added',
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewStudentScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildEmptyList() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_amber,
            color: Colors.grey,
            size: 50.0,
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            'No Student Added',
            style: TextStyle(
              color: Colors.purple,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildError() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 50.0,
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            'Content not available',
            style: TextStyle(
              color: Colors.red,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
