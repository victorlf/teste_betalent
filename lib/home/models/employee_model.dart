class EmployeeModel {
  final int id;
  final String name;
  final String job;
  final DateTime admission;
  final String phone;
  final String imageUrl;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.job,
    required this.admission,
    required this.phone,
    required this.imageUrl,
  });

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      id: map['id'],
      name: map['name'],
      job: map['job'],
      admission: DateTime.parse(map['admission_date']),
      phone: map['phone'],
      imageUrl: map['image'],
    );
  }
}
