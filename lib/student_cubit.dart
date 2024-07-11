import 'package:hogwarts_students/add_new_student.dart';
import 'package:hogwarts_students/cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_students/students.dart';
import 'package:hogwarts_students/students_data.dart';

class StudentsCubit extends Cubit<StudentState> {
  StudentsCubit() : super(InitialState());

  void getStudents() async {
    try {
      emit(LoadingState());
      await Future.delayed(const Duration(seconds: 3));
      emit(SuccessState(DummyStudents.studentDataItems));
    } catch (e) {
      emit(ErrorState('internet is not connected'));
    }
  }

  void setStudentHouse(String house) {
    emit(SelectedHouseState(house));
  }

  void addStudent(Student student) async {
    await Future.delayed(const Duration(seconds: 2));
    DummyStudents.studentDataItems.add(student);
    emit(AddSuccessState('Added Successfully'));
  }
}
