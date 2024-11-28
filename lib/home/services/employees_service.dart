import 'package:teste_betalent/core/errors/exceptions.dart';
import 'package:teste_betalent/core/http_client/http_client.dart';

import '../models/employee_model.dart';

class EmployeesService {
  final HttpClient _httplClient;

  EmployeesService(this._httplClient);

  Future<List<EmployeeModel>> getEmployess() async {
    try {
      final response = await _httplClient.get('/employees');

      final employees = List<EmployeeModel>.from(
        response.data.map((e) => EmployeeModel.fromMap(e)),
      );

      return employees;
    } on HttpException {
      rethrow;
    } catch (e, stackTrace) {
      throw AppException(
        message: 'Erro ao buscar Funcionários',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }
}
