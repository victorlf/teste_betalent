import 'package:flutter/material.dart';
import 'package:teste_betalent/core/shared/constants/app_images.dart';
import 'package:teste_betalent/core/theme/theme_colors.dart';
import 'package:teste_betalent/home/views/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.blue,
      body: Center(
        child: Image.asset(AppImages.logo),
      ),
    );
  }
}
