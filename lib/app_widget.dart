import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_betalent/core/http_client/http_client.dart';
import 'package:teste_betalent/core/theme/app_theme.dart';
import 'package:teste_betalent/home/services/employees_service.dart';
import 'package:teste_betalent/home/stores/home_store.dart';
import 'package:teste_betalent/home/views/pages/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HttpClient>(
          create: (_) => HttpClient(),
        ),
        Provider<EmployeesService>(
          create: (context) => EmployeesService(context.read()),
        ),
        ChangeNotifierProvider<HomeStore>(
          create: (context) => HomeStore(context.read()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.brightTheme,
        home: const SplashPage(),
      ),
    );
  }
}
