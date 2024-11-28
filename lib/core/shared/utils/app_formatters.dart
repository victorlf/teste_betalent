import 'package:intl/intl.dart';

class AppFormatters {
  static String date(DateTime value) {
    return DateFormat('dd/MM/yyyy').format(value);
  }

  static String phoneNumber(String phone) {
    return phone.replaceAllMapped(RegExp(r'(\d{2})(\d{2})(\d{5})(\d+)'),
        (Match m) => "+${m[1]} (${m[2]}) ${m[3]}-${m[4]}");
  }
}
