import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teste_betalent/core/shared/constants/app_icons.dart';
import 'package:teste_betalent/core/theme/theme_colors.dart';
import 'package:teste_betalent/home/models/employee_model.dart';
import 'package:teste_betalent/home/views/widgets/table_row_widget/employee_info_widget.dart';
import 'package:teste_betalent/home/views/widgets/table_row_widget/expanded_widget.dart';

class EmployeeRowWidget extends StatefulWidget {
  final EmployeeModel employee;
  const EmployeeRowWidget(this.employee, {super.key});

  @override
  State<EmployeeRowWidget> createState() => _EmployeeRowWidgetState();
}

class _EmployeeRowWidgetState extends State<EmployeeRowWidget> {
  var expand = false;

  void changeExpand() => setState(() {
        expand = !expand;
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16.0,
        top: 13.5,
        right: 8.0,
        bottom: 12.5,
      ),
      decoration: const BoxDecoration(
          border: Border(
        left: BorderSide(color: ThemeColors.gray10),
        right: BorderSide(color: ThemeColors.gray10),
        bottom: BorderSide(color: ThemeColors.gray10),
      )),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: Image.network(
                        widget.employee.imageUrl,
                        errorBuilder: (_, __, ___) {
                          return Icon(
                            Icons.person,
                            color: Theme.of(context).colorScheme.primary,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Text(
                  widget.employee.name,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: changeExpand,
                    child: SvgPicture.asset(
                      height: 32.0,
                      width: 32.0,
                      expand ? AppIcons.arrowUp : AppIcons.arrowDown,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  // ),
                ),
              )
            ],
          ),
          ExpandedWidget(
            expand: expand,
            child: EmployeeInfoWidget(widget.employee),
          ),
        ],
      ),
    );
  }
}
