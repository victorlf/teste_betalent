import 'package:flutter/material.dart';

import '../models/employee_model.dart';
import '../services/employees_service.dart';
import 'home_state.dart';

class HomeStore extends ValueNotifier<HomeState> {
  final EmployeesService _service;
  HomeStore(this._service) : super(InitialHomeState());

  var employees = <EmployeeModel>[];

  Future<void> getEmployess() async {
    value = LoadingHomeState();
    _service.getEmployess().then((result) {
      employees = result;
      value = SuccessHomeState(employees);
    }).catchError((e) {
      value = ErrorHomeState(e.message);
    });
  }

  void search(String text) {
    if (text.isEmpty) {
      value = SuccessHomeState(employees);
    } else {
      text = text.toLowerCase();
      final result = employees.where((e) {
        return e.name.toLowerCase().contains(text) ||
            e.job.toLowerCase().contains(text) ||
            e.phone.contains(text);
      }).toList();
      value = SuccessHomeState(result);
    }
  }
}
