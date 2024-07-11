import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_students/student_cubit.dart';
import 'package:hogwarts_students/cubit_state.dart';
import 'package:hogwarts_students/students.dart';

class NewStudentScreen extends StatefulWidget {
  const NewStudentScreen({super.key});

  @override
  State<NewStudentScreen> createState() => _NewStudentScreenState();
}

class _NewStudentScreenState extends State<NewStudentScreen> {
  final _nameController = TextEditingController();
  final _studentFavouritePetController = TextEditingController();
  final _ageController = TextEditingController();
  final _studentWandTypeController = TextEditingController();
  final studentCubit = StudentsCubit();

  static const List<String> studentHouse = [
    'Slytherin',
    'Hufflepuff',
    'Gryffindor',
    'Ravenclaw',
  ];

  String? selectedHouse;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _studentFavouritePetController.dispose();
    _studentWandTypeController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Student'),
      ),
      body: BlocProvider(
        create: (context) => studentCubit..setStudentHouse('Ravenclaw'),
        child: BlocListener<StudentsCubit, StudentState>(
          listenWhen: (_, newState) => newState is AddSuccessState,
          listener: (context, state) {
            if(state is AddSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                  content: Text(state.successMessage),
                ),
              );
              Navigator.pop(context);

            }
          },
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 48, 0, 30),
                      child: TextFormField(
                        validator: (value) {
                          final isNumeric = double.tryParse(value!) != null;
                          if (isNumeric || value.isEmpty) {
                            return 'Please Enter Valid Title';
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.purple),
                        controller: _nameController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          label: Text(
                            'Student Name',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: TextFormField(
                        validator: (value) {
                          final isNumeric = double.tryParse(value!) != null;
                          if (isNumeric || value.isEmpty) {
                            return 'Please Enter Valid pet';
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.purple),
                        controller: _studentFavouritePetController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          label: Text(
                            'Student Favourite Pet',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: TextFormField(
                        validator: (value) {
                          final isNumeric = double.tryParse(value!) != null;
                          if (isNumeric || value.isEmpty) {
                            return 'Please Enter valid student Wand Type';
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.purple),
                        controller: _studentWandTypeController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          label: Text(
                            'Student Wand Type',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: TextFormField(
                        validator: (value) {
                          final isNumeric = double.tryParse(value!) != null;
                          if (value.isEmpty || !isNumeric) {
                            return 'Please Enter Valid Age';
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.purple),
                        controller: _ageController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          label: Text(
                            'Student Age',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: studentHouse
                          .map(
                            (house) => ListTile(
                              title: Text(house),
                              leading: BlocBuilder<StudentsCubit, StudentState>(
                                builder: (context, state) {
                                  if (state is SelectedHouseState) {
                                    return Radio<String>(
                                      value: house,
                                      groupValue: state.house,
                                      onChanged: (returnHouse) {
                                        studentCubit.setStudentHouse(house);
                                      },
                                    );
                                  }
                                  return const SizedBox(
                                    height: 30,
                                  );
                                },
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                              final student = Student(
                                studentName: _nameController.text,
                                studentHouse: 'RavenClaw',
                                studentAge: _ageController.text,
                                studentFavouritePet:
                                    _studentFavouritePetController.text,
                                studentWandType:
                                    _studentWandTypeController.text,
                              );
                              studentCubit.addStudent(student);
                              // If the form is valid, display a snackBar. In the real world,
                              // you'd often call a server or save the information in a database.
                            }
                          },
                          child: const Text('Add'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
