import 'package:hogwarts_students/students.dart';

abstract class StudentState<State> {}

class InitialState extends StudentState {}

class LoadingState extends StudentState {}

class SuccessState extends StudentState {
  final List<Student> students;

  SuccessState(this.students);
}

class SelectedHouseState extends StudentState {
  final String house;

  SelectedHouseState(this.house);
}

class ErrorState extends StudentState {
  final String errorMessage;

  ErrorState(this.errorMessage);
}
