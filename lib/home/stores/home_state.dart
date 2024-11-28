import 'package:teste_betalent/home/models/employee_model.dart';

abstract class HomeState {}

class InitialHomeState extends HomeState {}

class SuccessHomeState extends HomeState {
  final List<EmployeeModel> employees;

  SuccessHomeState(this.employees);
}

class LoadingHomeState extends HomeState {}

class ErrorHomeState extends HomeState {
  final String message;

  ErrorHomeState(this.message);
}
