import 'package:flutter/material.dart';
import 'package:teste_betalent/core/theme/theme_colors.dart';

import '../../models/employee_model.dart';
import 'table_row_widget/employee_row_widget.dart';

class EmployeeTableWidget extends StatelessWidget {
  final List<EmployeeModel> emplooyees;
  const EmployeeTableWidget(this.emplooyees, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 47.0,
          padding: const EdgeInsets.only(
            left: 16.0,
            top: 14.0,
            right: 19.5,
            bottom: 14.0,
          ),
          decoration: BoxDecoration(
            color: ThemeColors.blue10,
            border: Border.all(color: ThemeColors.gray10),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: DefaultTextStyle(
            style: Theme.of(context).textTheme.displayMedium!,
            child: Row(
              children: [
                const Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Text('Foto'),
                ),
                const Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Text('Nome'),
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 8.0,
                      width: 8.0,
                      decoration: BoxDecoration(
                        color: ThemeColors.black,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: emplooyees.length,
              itemBuilder: (context, index) {
                return EmployeeRowWidget(emplooyees[index]);
              }),
        )
      ],
    );
  }
}
