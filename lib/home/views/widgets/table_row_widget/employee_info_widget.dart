import 'package:flutter/material.dart';
import 'package:teste_betalent/core/shared/utils/app_formatters.dart';
import 'package:teste_betalent/core/theme/theme_colors.dart';

import '../../../models/employee_model.dart';
import 'dashline_painter.dart';

class EmployeeInfoWidget extends StatelessWidget {
  final EmployeeModel employee;
  const EmployeeInfoWidget(this.employee, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 31.5),
        _EmployeeInfoItemWidget(
          title: 'Cargo',
          info: employee.job,
        ),
        const SizedBox(height: 15.0),
        _EmployeeInfoItemWidget(
          title: 'Data de admissão',
          info: AppFormatters.date(employee.admission),
        ),
        const SizedBox(height: 15.0),
        _EmployeeInfoItemWidget(
          title: 'Telefone',
          info: AppFormatters.phoneNumber(employee.phone),
        ),
      ],
    );
  }
}

class _EmployeeInfoItemWidget extends StatelessWidget {
  final String title;
  final String info;
  const _EmployeeInfoItemWidget({
    required this.title,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: DashLinePainter(
        progress: 1.0,
        color: ThemeColors.gray10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Text(
            info,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}
