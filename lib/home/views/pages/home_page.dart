import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_betalent/core/shared/widgets/appbar_widget.dart';

import '../../stores/home_state.dart';
import '../../stores/home_store.dart';
import '../widgets/employee_table_widget.dart';
import '../widgets/search_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeStore>().getEmployess();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeState = context.watch<HomeStore>().value;

    return Scaffold(
      appBar: const AppBarWidget(),
      body: Builder(builder: (context) {
        if (homeState is LoadingHomeState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (homeState is ErrorHomeState) {
          return Center(
            child: Text(homeState.message),
          );
        }

        if (homeState is SuccessHomeState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 18.0,
                  top: 24.0,
                ),
                child: Text(
                  'Funcionários',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              const SizedBox(height: 15.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      SearchBarWidget(context.read<HomeStore>().search),
                      const SizedBox(height: 24.0),
                      Expanded(child: EmployeeTableWidget(homeState.employees)),
                    ],
                  ),
                ),
              ),
            ],
          );
        }

        return const SizedBox();
      }),
    );
  }
}
